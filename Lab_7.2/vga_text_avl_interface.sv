/************************************************************************
Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/
`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,			// Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);


//logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here
//Declare submodules..e.g. VGA controller, ROMS, etc

//given a pixel coordinate
//find which row and column we are on
//find out the register 
//
logic [31:0] color_palette_register[8];

//To get row, col: Divide drawx by 8 and drawy by 16 
//now we have thr row and column
//
logic [9:0] drawX, drawY;
logic blank, sync; 
logic pixelclk; //output
logic [31:0]byteAddress; 
logic [31:0]word_address; 
logic [9:0]drawXNew;
logic [9:0]drawYNew;
logic [15:0] code;
logic [31:0] address_font_rom;
logic [7:0] data;
logic [31:0] word_data;
logic [3:0] BKG_IDX;
logic [3:0] FGD_IDX;
logic [31:0] dummy;

//// INSTANTIATE RAM/////////wren_b(0), .q_a(AVL_READDATA), .q_b(q_b_address));
// if [11] == 1                                    																																			//~[11] bc want to check that write bit is 0 so we don't override any values 
//then read to palette registers, could read
// if low then do nothing 
// check AVL, if MSB is a 1 then we want to write to the palette registers 
	 
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
//logic[31:0]register[601]; 

font_rom fontrom(.addr(address_font_rom), .data(data));
					 
					 
vga_controller vgacontroller(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixelclk), 
.blank(blank), .sync(sync), .DrawX(drawX), .DrawY(drawY));     
    
//RAM INSTANTIATION

ram ram0(.address_a(AVL_ADDR), .address_b(word_address), .byteena_a(AVL_BYTE_EN), .clock(CLK), 
.data_a(AVL_WRITEDATA), .data_b(), .rden_a(AVL_READ & AVL_CS & ~AVL_ADDR[11]), .rden_b(1), .wren_a(AVL_CS & AVL_WRITE & ~AVL_ADDR[11]), 
.wren_b(0), .q_a(dummy), .q_b(word_data));


/*
READ AND WRITE OPERATIONS OF REGISTERS BASED ON 11TH BIT
most-significant bit of the word address (e.g., bit 11) to select between on-chip 
memory VRAM and your color palette in FPGA registers.
*/



always_ff @(posedge CLK) begin
		
		if(AVL_ADDR[11] & AVL_WRITE & AVL_CS ) //if this bit is 1 then we want to read and write to the palette registers 
		color_palette_register[AVL_ADDR[2:0]] <= AVL_WRITEDATA;
		
		else if(AVL_ADDR[11] & AVL_READ & AVL_CS)
		AVL_READDATA <= color_palette_register[AVL_ADDR[2:0]];
		
		else if (~AVL_ADDR[11] & AVL_READ & AVL_CS) 
		AVL_READDATA <= dummy; 
	
	
	
	end
	
	
	
	
	
	
	
	//MATH AND ASSIGNING Bit Encoding for VRAM (
	
	always_comb 
begin


drawXNew= drawX[9:3]; // divided by 8
drawYNew = drawY[9:4]; //divide by 16
byteAddress = (80*drawYNew)+drawXNew; // (80*DrawyNew)+DrawxNew //lower two bits inidcate the dedicated bytes 
word_address = byteAddress[31:1];  // word_address/2

	unique case(byteAddress[0]) ////////changed to check = 0 was = 1
	//? localreg[600][15:0]
	1'b0: begin 	
			code = word_data[15:8]; //need to check if right bits
			FGD_IDX = word_data[7:4];
			BKG_IDX = word_data[3:0];
			end
	
	
	1'b1: 
			begin 
			code = word_data[31:24]; ////need to check if right bits
			BKG_IDX = word_data[19:16];
			FGD_IDX = word_data[23:20]; 
			end
			
	default : ;
	
	endcase
//	//address_font_rom = (code[14:8]*16) + drawY[3:0] ;
address_font_rom = (code[7:0]*16) + drawY[3:0] ;
	
end
	//RGB 
	
	
	
	
	
	
	
	
	
	always_ff @(posedge pixelclk) begin  
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
		if(blank)
		
	begin 
			
	if(code[15] ^ data[7-drawX[2:0]] )   //you wanna draw foreground
				begin  //then draw fg0
					if(FGD_IDX[0] == 1'b0)
						begin
							red <= color_palette_register[FGD_IDX[3:1]][12:9] ; //changed to 7:4 from 3:1
							blue <= color_palette_register[FGD_IDX[3:1]][4:1];
							green <= color_palette_register[FGD_IDX[3:1]][8:5];
						end
					else if (FGD_IDX[0] == 1'b1)
						begin
							red <= color_palette_register[FGD_IDX[3:1]][24:21] ;
							blue <= color_palette_register[FGD_IDX[3:1]][16:13];
							green <= color_palette_register[FGD_IDX[3:1]][20:17];
						end
	end	
	
	else  
	begin
				if(BKG_IDX[0] == 1'b0)	
				begin
					red <= color_palette_register[BKG_IDX[3:1]][12:9] ;
					blue <= color_palette_register[BKG_IDX[3:1]][4:1];
					green <= color_palette_register[BKG_IDX[3:1]][8:5];
				end
				
				else if(BKG_IDX[0] == 1'b1)
				begin
					red <= color_palette_register[BKG_IDX[3:1]][24:21] ;
					blue <= color_palette_register[BKG_IDX[3:1]][16:13];
					green <= color_palette_register[BKG_IDX[3:1]][20:17];
				end
				
	end
				

	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	end 
	
	
	
	else 
	begin 
	      red <= 4'h0;
			blue <= 4'h0;
			green <= 4'h0;
	end  
	end   
	
endmodule
///////////////////alichaudrycode////////////////////////







