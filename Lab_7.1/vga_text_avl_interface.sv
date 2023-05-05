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
	input  logic [9:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,		// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,		// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						// VGA HS/VS
);


logic [31:0] LOCAL_REG       [`NUM_REGS]; // Registers
//put other local variables here
//Declare submodules..e.g. VGA controller, ROMS, etc

//given a pixel coordinate
//find which row and column we are on
//find out the register 
//


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
logic [7:0] code;
logic [31:0] address_font_rom;
logic [7:0] data;
always_comb 
begin


drawXNew= drawX[9:3]; // divided by 8
drawYNew = drawY[9:4]; //divide by 16
byteAddress = (80*drawYNew)+drawXNew; // (80*DrawyNew)+DrawxNew //lower two bits inidcate the dedicated bytes 
word_address = byteAddress[31:2];  // word_address/4

	unique case(byteAddress[1:0])
	
	2'b00: code = LOCAL_REG[word_address][7:0];
	2'b01: code = LOCAL_REG[word_address][15:8];
	2'b10: code = LOCAL_REG[word_address][23:16];
	2'b11: code = LOCAL_REG[word_address][31:24];
	default : ;
	
	endcase
	address_font_rom = (code[6:0]*16) + drawY[3:0] ;
	
	
//
//
//	if (byteAddress[1:0] == 2'b00)
//	begin
//	code = LOCAL_REG[word_address][7:0];
//
//	end
//
//
//
//	else if (byteAddress[1:0] == 2'b01)
//	begin
//		code = LOCAL_REG[word_address][15:8];
//	end
//
//
//
//	else if (byteAddress[1:0] == 2'b10)
//	begin
//		code = LOCAL_REG[word_address][23:16];
//	end
//
//
//
//	else if(byteAddress[1:0] == 2'b11)
//	begin
//		code = LOCAL_REG[word_address][31:24];
//	end
//	
//	else
//	code = 2'hxx;
//	
//	address_font_rom = (code[6:0]*16) + drawY[3:0] ;
//	
//	
//
//	end
end
font_rom fontrom(.addr(address_font_rom), .data(data));
					 
					 
vga_controller vgacontroller(.Clk(CLK), .Reset(RESET), .hs(hs), .vs(vs), .pixel_clk(pixelclk), 
.blank(blank), .sync(sync), .DrawX(drawX), .DrawY(drawY));     
    
	 
	 
	 
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
//logic[31:0]register[601]; 

always_ff @(posedge CLK) begin
       
		 
		if(RESET)begin
			for(int i = 0; i<601; i++)
				LOCAL_REG[i][31:0] <= 32'h00000000;
			end	
		

		else if(AVL_CS) 
		
		begin 
		
		
		if((AVL_WRITE) && (~AVL_READ)) 	
			begin
	

//logic inv_bit

	if(AVL_BYTE_EN == 4'b1111)
		LOCAL_REG[AVL_ADDR][31:0] <= AVL_WRITEDATA[31:0];
	
	else if(AVL_BYTE_EN == 4'b1100)
		LOCAL_REG[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
	
	else if(AVL_BYTE_EN == 4'b0011)
		LOCAL_REG[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
	
	else if(AVL_BYTE_EN == 4'b1000)
		LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
	
	else if(AVL_BYTE_EN == 4'b0100)
		LOCAL_REG[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
	
	else if(AVL_BYTE_EN == 4'b0010)
		LOCAL_REG[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
	
	else if(AVL_BYTE_EN == 4'b0001)
		LOCAL_REG[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];
end


		else if((AVL_READ) && (~AVL_WRITE))
		AVL_READDATA[31:0] <= LOCAL_REG[AVL_ADDR][31:0];
		
		
		
	end

	
	end

//handle drawing (may either be combinational or sequential - or both).
//alwaysff
//if(blank)




	
	//you wanna check if you are drawing the background or sprite
	//need to check inverse bit
	//do not know how to get 
	// how do  you get the inverse bits
	//how do you get the bit that checks if you are drawing the background or foreground 
	//how to use data bit
	//code[7] is the inverse bit 
	
	
	always_ff @(posedge pixelclk) begin
		
		if(blank)
		
	begin
			
	
	
	
	if(code[7] ^ data[7-drawX[2:0]] )
		begin
			red <= LOCAL_REG[600][24:21];
			blue <= LOCAL_REG[600][16:13];
			green <= LOCAL_REG[600][20:17];
		end
		
	else 
		begin
			red <= LOCAL_REG[600][12:9];
			blue <= LOCAL_REG[600][4:1];
			green <= LOCAL_REG[600][8:5];
		end
	end
	
	else 
	begin
	      red <= 4'h0;
			blue <= 4'h0;
			green <= 4'h0;
	end
	
	
	
//	
//	//~draw because it is read from right to to left but is written left to right 
//	else if(~code[7] && data[7-drawX[2:0]] )begin
//			red <= LOCAL_REG[600][24:21];
//			blue <= LOCAL_REG[600][16:13];
//			green <= LOCAL_REG[600][20:17];
//	end
//	else if( code[7] && data[7-drawX[2:0]] )begin
//			red <= LOCAL_REG[600][12:9];
//			blue <= LOCAL_REG[600][4:1];
//			green <= LOCAL_REG[600][4:1];
//	end
//	
//	else if(code[7] && ~data[7-drawX[2:0]])begin
//			red <= LOCAL_REG[600][24:21];
//			blue <= LOCAL_REG[600][16:13];
//			green <= LOCAL_REG[600][20:17];
//	end
//	
//	else if(~code[7] && ~data[7-drawX[2:0]])begin
//			red <= LOCAL_REG[600][12:9];
//			blue <= LOCAL_REG[600][4:1];
//			green <= LOCAL_REG[600][4:1];
//	end
//	
	
	end

	
	
 
 
 
 
 
 
 
 
 
 
 

endmodule
