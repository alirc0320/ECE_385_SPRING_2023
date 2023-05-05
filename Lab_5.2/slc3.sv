//------------------------------------------------------------------------------
// Company: 		 UIUC ECE Dept.
// Engineer:		 Stephen Kempf
//
// Create Date:    
// Design Name:    ECE 385 Lab 5 Given Code - SLC-3 top-level (Physical RAM)
// Module Name:    SLC3
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 09-22-2015 
//    Revised 06-09-2020
//	  Revised 03-02-2021
//------------------------------------------------------------------------------


module slc3(
	input logic [9:0] SW,
	input logic	Clk, Reset, Run, Continue,
	output logic [9:0] LED,
	input logic [15:0] Data_from_SRAM,
	output logic OE, WE,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
	output logic [15:0] ADDR,
	output logic [15:0] Data_to_SRAM
);

logic [15:0] ADDER_OUTPUT;
// An array of 4-bit wires to connect the hex_drivers efficiently to wherever we want
// For Lab 1, they will direclty be connected to the IR register through an always_comb circuit
// For Lab 2, they will be patched into the MEM2IO module so that Memory-mapped IO can take place
//logic [3:0] hex_4[3:0]; 
//logic [3:0] hex_3, hex_2, hex_1, hex_0 ; 
logic [3:0] hex_4[3:0];
HexDriver hex_drivers[3:0] (hex_4, {HEX3, HEX2, HEX1, HEX0});
// This works thanks to http://stackoverflow.com/questions/1378159/verilog-can-we-have-an-array-of-custom-modules
//deleted hex_4 --- need to add backfor 5.2
//assign hex_0 = IR[3:0];
//assign hex_1 = IR[7:4];
//assign hex_2 = IR[11:8];
//assign hex_3 = IR[15:12];

//took out ben
// Internal connections
logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED;
logic GatePC, GateMDR, GateALU, GateMARMUX; //tristate buffer selects 
logic SR2MUX, ADDR1MUX, MARMUX;
logic MIO_EN, DRMUX, SR1MUX; //selects 
//logic BEN;
logic [1:0] PCMUX, ADDR2MUX, ALUK; //selects

logic [15:0] MDR_In;
logic [15:0] MAR, MDR, IR, PC; //outputs 
logic [15:0]MIO_Out;
logic [15:0] BUS;
logic [15:0] PC_Mux_Out;
logic [15:0] ALU_OUTPUT;
logic BEN_OUT;

//logic [15:0] MEM;
// Connect MAR to ADDR, which is also connected as an input into MEM2IO
//	MEM2IO will determine what gets put onto Data_CPU (which serves as a potential
//	input into MDR)

//*****************************************************//
//Tri-state buffer//
//always_comb
//		begin
//					//this unique case takes care of the if/else statements 
//					
//				if(GateMDR == 1)
//				     BUS = MDR;
//				else if(GateALU == 1) 
//				     BUS = 16'hxxxx ;
//				else if(GatePC == 1) 
//				     BUS = PC;
//				else if(GateMARMUX == 1) 
//				     BUS = MAR;
//				else
//				     BUS = 16'hxxxx;
//		end
//*********************************************************//

register PC0(.Clk(Clk), .Reset(Reset), .Load(LD_PC), .D(PC_Mux_Out), .Data_Out(PC));
PC_Mux PC_Mux0(.S(PCMUX), .PC1(PC+16'h0001), .BUS(BUS), .ADDER(ADDER_OUTPUT), .Q_Out(PC_Mux_Out));

register MDR0(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), .D(MIO_Out), .Data_Out(MDR));
MIO_EN_Mux MIO_EN_Mux0(.S(MIO_EN), .BUS(BUS), .MEM(MDR_In), .Q_Out(MIO_Out));

register IR0(.Clk(Clk), .Reset(Reset), .Load(LD_IR), .D(BUS), .Data_Out(IR)); 

register MAR0(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), .D(BUS), .Data_Out(MAR));

tri_state tri_0(.GateMDR(GateMDR), .GateALU(GateALU), .GatePC(GatePC), .GateMARMUX(GateMARMUX), .ADDER(ADDER_OUTPUT), .MDR(MDR),
					.PC(PC), .ALU(ALU_OUTPUT), .Q_Out(BUS));


//we are writing to the bus with more than 1 value 
assign ADDR = MAR; 
assign MIO_EN = OE;
//*********************************************************************************************
// Connect everything to the data path (you have to figure out this part)
//5.2
////////////DECODER








































//datapath d0 (.*);

// Our SRAM and I/O controller (note, this plugs into MDR/MAR)

Mem2IO memory_subsystem(
    .*, .Reset(Reset), .ADDR(ADDR), .Switches(SW),
    .HEX0(hex_4[0][3:0]), .HEX1(hex_4[1][3:0]), .HEX2(hex_4[2][3:0]), .HEX3(hex_4[3][3:0]),
    .Data_from_CPU(MDR), .Data_to_CPU(MDR_In),
    .Data_from_SRAM(Data_from_SRAM), .Data_to_SRAM(Data_to_SRAM)
);

// State machine, you need to fill in the code here as well
//ISDU state_controller(
//	.*, .Reset(Reset), .Run(Run), .Continue(Continue),
//	.Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]),
//   .Mem_OE(OE), .Mem_WE(WE)
//);






ISDU ISDU0(.Clk(Clk), .Reset(Reset), .Run(Run), .Continue(Continue), .Opcode(IR[15:12]), .IR_5(IR[5]), .IR_11(IR[11]), .BEN(BEN_OUT), 
.LD_MAR(LD_MAR), .LD_MDR(LD_MDR), .LD_IR(LD_IR), .LD_BEN(LD_BEN), .LD_CC(LD_CC), .LD_REG(LD_REG), .LD_PC(LD_PC), .LD_LED(LD_LED), 
.GatePC(GatePC), .GateMDR(GateMDR), .GateALU(GateALU), .GateMARMUX(GateMARMUX), 
.PCMUX(PCMUX), .DRMUX(DRMUX), .SR1MUX(SR1MUX), .SR2MUX(SR2MUX),
.ADDR1MUX(ADDR1MUX), .ADDR2MUX(ADDR2MUX), .ALUK(ALUK), .Mem_OE(OE), .Mem_WE(WE));




//logic [15:0] Data_Out [8];
//
//logic [7:0] LD;
//always_comb begin
//	Ld = 0;
//	LD[DR] = LD_REG;
//end
//
//always_comb
//	if (LD_REG)
//		LD = 8'b1 << DR;
//		
//always_ff @ (posedge clk) 
//	if (LD_REG)
//		Data_Out[DR] <= BUS;
//
//OUTPUT1 = Data_Out[SR1];



//*******************************************************************************************************



logic [2:0] Select_for_sr1_internal;
logic [2:0] DR_MUX_OUT;
logic LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7;
logic [15:0]Data_Out0, Data_Out1, Data_Out2, Data_Out3, Data_Out4, Data_Out5, Data_Out6, Data_Out7;
logic [15:0]OUTPUT;
logic [15:0]OUTPUT2;
//DATOUT
//LD




DR_MUX DR_MUX0(.DR(DRMUX), .IR_11(IR[11:9]), .DRMUX(DR_MUX_OUT) );


SR1MUX SR1MUX0(.SR1MUX(SR1MUX), .IR_11(IR[11:9]), .IR_8(IR[8:6]), .SR1_OUT(Select_for_sr1_internal));


Load_Reg_Decoder Decoder(.DR_MUX(DR_MUX_OUT), .LD_REG(LD_REG), .LD0(LD0), .LD1(LD1), .LD2(LD2), .LD3(LD3), .LD4(LD4),
.LD5(LD5), .LD6(LD6), .LD7(LD7));

SR1_INTERNAL_MUX SR1_INTERNAL_MUX0 (.S(Select_for_sr1_internal), .Data_Out0(Data_Out0), .Data_Out1(Data_Out1), .Data_Out2(Data_Out2), .Data_Out3(Data_Out3), 
.Data_Out4(Data_Out4), .Data_Out5(Data_Out5), .Data_Out6(Data_Out6), .Data_Out7(Data_Out7), .OUTPUT(OUTPUT) );

SR2_INTERNAL_MUX SR2_INTERNAL_MUX0 (.S(IR[2:0]), .Data_Out0(Data_Out0), .Data_Out1(Data_Out1), .Data_Out2(Data_Out2), .Data_Out3(Data_Out3), 
.Data_Out4(Data_Out4), .Data_Out5(Data_Out5), .Data_Out6(Data_Out6), .Data_Out7(Data_Out7), .OUTPUT(OUTPUT2) );


register R0(.Clk(Clk), .Reset(Reset), .Load(LD0), .D(BUS), .Data_Out(Data_Out0)); 
register R1(.Clk(Clk), .Reset(Reset), .Load(LD1), .D(BUS), .Data_Out(Data_Out1)); 
register R2(.Clk(Clk), .Reset(Reset), .Load(LD2), .D(BUS), .Data_Out(Data_Out2)); 
register R3(.Clk(Clk), .Reset(Reset), .Load(LD3), .D(BUS), .Data_Out(Data_Out3)); 
register R4(.Clk(Clk), .Reset(Reset), .Load(LD4), .D(BUS), .Data_Out(Data_Out4)); 
register R5(.Clk(Clk), .Reset(Reset), .Load(LD5), .D(BUS), .Data_Out(Data_Out5)); 
register R6(.Clk(Clk), .Reset(Reset), .Load(LD6), .D(BUS), .Data_Out(Data_Out6)); 
register R7(.Clk(Clk), .Reset(Reset), .Load(LD7), .D(BUS), .Data_Out(Data_Out7)); 

	
	
//***************************************************************************************************
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
logic [15:0] sr2_in1;
logic [15:0] sr2_mux_out; 
					 
SR2_MUX sr2mux0(.SR2MUX(SR2MUX), .sr2_out(OUTPUT2), .IR_4(IR[4:0]), 
			.sext_4(sr2_in1), .SR2_MUX_OUT(sr2_mux_out));		
ALU alu0(.ALUK(ALUK), .sr1_out(OUTPUT), .sr2_mux_out(sr2_mux_out), .ALU_OUT(ALU_OUTPUT)); 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 //**************************************************************************************
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
// 
//						output 	logic			[15:0]	sext_10,
//						output 		logic		[15:0]	sext_8,
//						output			logic	[15:0]	sext_5,
//						
						
 
 
 
 
 
 logic [15:0] ADDR2MUX_OUT;
 logic [15:0] ADDR1MUX_OUT; 
 //logic [15:0] ADDER_OUTPUT;
 
ADDR2MUX ADDR2MUX0(.S(ADDR2MUX), .sext_10( {{5{IR[10]}}, IR[10:0]}), .sext_8({ {7{IR[8]}}, IR[8:0]}), .sext_5({ {10{IR[5]}}, IR[5:0]}), .Zero(16'h0000), .ADDR2MUX_OUT(ADDR2MUX_OUT) );
ADDR1MUX ADDR1MUX0(.S(ADDR1MUX), .PC_Out(PC), .SR1_OUT(OUTPUT), .Q_Out(ADDR1MUX_OUT));
ADDER ADDER0(.ADDR2MUX_OUT(ADDR2MUX_OUT), .ADDR1MUXOUT(ADDR1MUX_OUT), .ADDER(ADDER_OUTPUT));


						
						
						

//***********CONTROL UNIT**************


logic N, Z, P;	
logic N_OUT, Z_OUT, P_OUT; 		
logic BEN_IN;


LOGIC1 LOGIC_1(.BUS(BUS), .N(N), .Z(Z), .P(P));
LOGIC2 LOGIC_2(.IR(IR[11:9]), .N(N_OUT), .Z(Z_OUT), .P(P_OUT), .logic_out(BEN_IN));
one_bit_register N_reg(.Clk(Clk), .Reset(Reset), .LD(LD_CC), .D(N), .Data_Out(N_OUT));
one_bit_register Z_reg(.Clk(Clk), .Reset(Reset), .LD(LD_CC), .D(Z), .Data_Out(Z_OUT));
one_bit_register P_reg(.Clk(Clk), .Reset(Reset), .LD(LD_CC), .D(P), .Data_Out(P_OUT));
one_bit_register BEN_reg(.Clk(Clk), .Reset(Reset), .LD(LD_BEN), .D(BEN_IN), .Data_Out(BEN_OUT));







































always_comb
begin 

case(LD_LED)
	1'b0: LED = 10'b0;
	1'b1: LED = IR[9:0];
	
	endcase
	

end










// SRAM WE register
//logic SRAM_WE_In, SRAM_WE;
//// SRAM WE synchronizer
//always_ff @(posedge Clk or posedge Reset_ah)
//begin
//	if (Reset_ah) SRAM_WE <= 1'b1; //resets to 1
//	else 
//		SRAM_WE <= SRAM_WE_In;
//end



//	
endmodule
