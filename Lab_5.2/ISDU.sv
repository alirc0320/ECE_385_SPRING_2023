//------------------------------------------------------------------------------
// Company:          UIUC ECE Dept.
// Engineer:         Stephen Kempf
//
// Create Date:    17:44:03 10/08/06
// Design Name:    ECE 385 Lab 6 Given Code - Incomplete ISDU
// Module Name:    ISDU - Behavioral
//
// Comments:
//    Revised 03-22-2007
//    Spring 2007 Distribution
//    Revised 07-26-2013
//    Spring 2015 Distribution
//    Revised 02-13-2017
//    Spring 2017 Distribution
//------------------------------------------------------------------------------


module ISDU (   input logic         Clk, 
									Reset,
									Run,
									Continue,
									
				input logic[3:0]    Opcode, 
				input logic         IR_5,
				input logic         IR_11,
				input logic         BEN,
				
				  
				output logic        LD_MAR,
									LD_MDR,
									LD_IR,
									LD_BEN,
									LD_CC,
									LD_REG,
									LD_PC,
									LD_LED, // for PAUSE instruction
									
				output logic        GatePC,
									GateMDR,
									GateALU,
									GateMARMUX,
									
				output logic [1:0]  PCMUX,
				output logic        DRMUX,
									SR1MUX,
									SR2MUX,
									ADDR1MUX,
				output logic [1:0]  ADDR2MUX,
									ALUK,
				  
				output logic        Mem_OE,
									Mem_WE
				);

	enum logic [5:0] {  Halted, 
						PauseIR1, 
						PauseIR2, 
						S_18, 
						S_33_1, 
						S_33_2, 
						S_35, 
						S_32, 
						S_01,
						S_05,
						S_09,
						S_06,
						S_25,
						S_27,
						S_07,
						S_23,
						S_16,
						S_0,
						S_22,
						S_12,
						S_04,
						S_21, 
						S_33_3, 
						S_33_4,
						S_25_2,
						S_25_3,
						S_25_4,
						S_25_5,  
						S_16_2, 
						S_16_3,
						S_16_4,
						S_16_5   
						
						
						}   State, Next_state;   // Internal state logic
		
	always_ff @ (posedge Clk)
	begin
		if (Reset) 
			State <= Halted;
		else 
			State <= Next_state;
	end
   
	always_comb
	begin 
		// Default next state is staying at current state
		Next_state = State;
		
		// Default controls signal values
		LD_MAR = 1'b0;
		LD_MDR = 1'b0;
		LD_IR = 1'b0;
		LD_BEN = 1'b0;
		LD_CC = 1'b0;
		LD_REG = 1'b0;
		LD_PC = 1'b0;
		LD_LED = 1'b0;
		 
		GatePC = 1'b0;
		GateMDR = 1'b0;
		GateALU = 1'b0;
		GateMARMUX = 1'b0;
		 
		ALUK = 2'b00;
		 
		PCMUX = 2'b00;
		DRMUX = 1'b0;
		SR1MUX = 1'b0;
		SR2MUX = 1'b0;
		ADDR1MUX = 1'b0;
		ADDR2MUX = 2'b00;
		 
		Mem_OE = 1'b0;
		Mem_WE = 1'b0;
	
		// Assign next state
		unique case (State)
			Halted : 
				if (Run) 
					Next_state = S_18;                      
			S_18 : 
				Next_state = S_33_1;
			// Any states involving SRAM require more than one clock cycles.
			// The exact number will be discussed in lecture.
			S_33_1 : 
				Next_state = S_33_2;
			S_33_2 : 
				Next_state = S_33_3;
			S_33_3:
				Next_state = S_33_4;
			S_33_4 : 
				Next_state = S_35; 
			S_35 : 
				Next_state = S_32;
			// PauseIR1 and PauseIR2 are only for Week 1 such that TAs can see 
			// the values in IR.
		PauseIR1 :
	begin	
				if (~Continue) 
					Next_state = PauseIR1;
				else 
					Next_state = PauseIR2;
					
					end
			PauseIR2 : 
			begin
				if (Continue) 
					Next_state = PauseIR2;
				else 
					Next_state = S_18;
					end
			S_32 : 
				case (Opcode)
					4'b0001 : Next_state = S_01; //ADD
					4'b0101 : Next_state = S_05; //AND 
					4'b0000 : Next_state = S_0; //BR
					4'b1100 : Next_state = S_12; //JMP
					4'b0100 : Next_state = S_04; //JSR
					4'b0110 : Next_state = S_06; //LDR
					4'b0111 : Next_state = S_07; //STR
					4'b1001 : Next_state = S_09; //NOT
					4'b1101: Next_state = PauseIR1;//PSE//

					// You need to finish the rest of opcodes.....

					default : 
						Next_state = S_18;
				endcase
			S_01 : 
				Next_state = S_18;
				
			S_05 :
				Next_state = S_18;
				
			S_09 :
				Next_state = S_18;
			
			S_06 :
				Next_state = S_25;
				
			S_25 :
				Next_state = S_25_2;
			
			S_25_2 :
				Next_state = S_25_3;
				
			S_25_3 :
				Next_state = S_25_4;
			
			S_25_4 :
				Next_state = S_25_5;
			
			S_25_5 : 
				Next_state = S_27;
				
				
			S_27 :
				Next_state = S_18;		
				
			S_07 :
				Next_state = S_23;		
				
			S_23 :
				Next_state = S_16;		
				
			S_16 :
				Next_state = S_16_2;
		
			S_16_2 :
				Next_state = S_16_3;
			
			S_16_3 :
				Next_state = S_16_4;
			
			S_16_4 :
				Next_state = S_16_5;
				
			S_16_5 :
				Next_state = S_18;
		
				
					
//			S_0 :
//			case (BEN)
//				1'b0 :Next_state = S_18; //has two states to go to 
//				1'b1 :Next_state = S_22;
//					default:
//				Next_state = S_18;	
//					endcase




			S_0:
			if(BEN == 0)
			Next_state = S_18;
			else
			Next_state = S_22;

					
			S_12 :
				Next_state = S_18;
					
			S_04 :
				Next_state = S_21;
				
			S_21 :
				Next_state = S_18;		
				
			S_22 :
				Next_state = S_18;
					
			
				
			
	
				
			

			// You need to finish the rest of states.....

			default : ;

		endcase
		
		// Assign control signals based on current state
		case (State)
			Halted: ;
			S_18 : 
				begin 
					GatePC = 1'b1;
					LD_MAR = 1'b1;
					PCMUX = 2'b00;
					LD_PC = 1'b1;
				end
			S_33_1 : 
				Mem_OE = 1'b1;
			S_33_2 : 
				begin 
					Mem_OE = 1'b1;
				end
				
			S_33_3 : 
				begin 
					Mem_OE = 1'b1;
				end
			
			S_33_4 : 
				begin 
					Mem_OE = 1'b1;
					LD_MDR = 1'b1;
				end
				
			S_35 : 
				begin 
					GateMDR = 1'b1;
					LD_IR = 1'b1;
				end
				
				
			S_25 :
			begin 
					Mem_OE = 1'b1;
					
				end
					
			S_25_2 :
			begin 
					Mem_OE = 1'b1;
				end
				
						
			S_25_3 :
			begin 
					Mem_OE = 1'b1;
				end
				
						
			S_25_4 :
			begin 
					
					Mem_OE = 1'b1;
				end
			S_25_5:
				begin
					GateMDR = 1'b0;
					LD_MDR = 1'b1;
					LD_MAR = 1'b0; //??
					Mem_OE = 1'b1;
				
				end
				//chnaged oe to we
		S_16 : 
				begin 
					Mem_WE = 1'b1;
				end
		S_16_2 : 
				begin 
					Mem_WE = 1'b1;
				end
				
		S_16_3 : 
				begin 
					Mem_WE = 1'b1;
				end
				
		S_16_4 : 
				begin 
					Mem_WE = 1'b1;	
				end
				
		S_16_5 : 
			begin
					//Mem_OE = 1'b1;
					Mem_WE = 1'b1;
					LD_MDR = 1'b0;
			end
		
		
		S_05: 
		begin
					SR2MUX = IR_5;
					SR1MUX = 1'b1 ;
					ALUK = 2'b01;
					GateALU = 1'b1;
					DRMUX = 1'b0;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
					//LD_BEN = 1'b1;
					
					
		
		end
		
		S_09:
		begin
		
					SR1MUX = 1'b1 ;
					ALUK = 2'b10;
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
					//LD_BEN = 1'b1 ;
					DRMUX = 1'b0;			
		end
		
		
		S_06:
		begin
			ADDR1MUX = 1'b1;
			SR1MUX = 1'b1; 
			ADDR2MUX = 2'b01;
			GateMARMUX = 1'b1;
			LD_MAR = 1'b1;
		end
		
		
		
		
		
		
		
		S_27:
		begin
		GateMDR = 1'b1;
		LD_MDR = 1'b0;
		LD_CC = 1'b1;
		LD_REG = 1'b1;
		DRMUX = 1'b0;
		//LD_BEN = 1'b1; 
		end
		
		
		
		
		
		
		
		S_07:
		begin
		ADDR1MUX = 1'b1;
		SR1MUX = 1'b1; 
		ADDR2MUX = 2'b01;
		GateMARMUX = 1'b1; 
		LD_MAR = 1'b1;
		end
		
		
		
		S_23:
		begin
		
		ALUK = 2'b11;
		GateALU = 1'b1;
		LD_MDR = 1'b1;
		
		end
		
		
		S_0: ; 
		
		
		S_22:
		begin
		ADDR1MUX = 1'b0;
		ADDR2MUX = 2'b10;
		PCMUX = 2'b10;
		LD_PC= 1'b1;
		end
		
		
		S_12:
		begin
		
		SR1MUX = 1'b1;
		ADDR2MUX = 2'b00;
		ADDR1MUX = 1'b1;
		PCMUX = 2'b10;
		LD_PC = 1'b1;
		
		
		
		
		end
		
		S_04:
		begin
		GatePC = 1'b1;
		DRMUX = IR_11;
		LD_REG = 1'b1;
		end
		
		
		
		S_21:
		begin
		LD_PC = 1'b1;
		ADDR1MUX = 1'b0;
		ADDR2MUX = 2'b11;
		PCMUX = 2'b10;
		end
		   
			
			PauseIR1: 
			begin
			LD_LED = 1'b1 ;
			end
			
			PauseIR2:
			begin
			LD_LED = 1'b1 ;
			end
			
			
			
			S_32 : 
				LD_BEN = 1'b1;
			S_01 : 
				begin 
					DRMUX = 1'b0;
					SR1MUX = 1'b1 ;
					SR2MUX = IR_5;
					ALUK = 2'b00;
					GateALU = 1'b1;
					LD_REG = 1'b1;
					LD_CC = 1'b1;
					//LD_BEN = 1'b1;
				end

			// You need to finish the rest of states.....

			default : ;
		endcase
	end 

	
endmodule
