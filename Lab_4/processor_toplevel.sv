//Top level for ECE 385 adders lab
//modified for Spring 2023

//Note: lowest 2 HEX digits will reflect lower 8 bits of switch input
//Upper 4 HEX digits will reflect value in the accumulator


module processor_toplevel  (input Clk, Reset_Clear, Run_Accumulate, 
						input [7:0]			SW,
						output logic [9:0]	LED,
						output logic [6:0]	HEX0, 
											HEX1, 
											HEX2, 
											HEX3, 
											HEX4,
											HEX5
										);
										
		logic Reset_h, Run_h;
										
		// Misc logic that inverts button presses and ORs the Load and Run signal
		always_comb	
		begin
				Reset_h = ~Reset_Clear;
				Run_h = ~Run_Accumulate;

		end
				
				
			logic ADD;
			logic CLR;
			logic SUB;
			logic LD; 
			//logic SHIFT;   //Is this the same as the shift_en
			logic [7:0] A_in; //output of adder into A register 
			logic [7:0] A_out; 
			//logic [7:0] SW_in; //value of switches go into B register
			logic M;
			logic Shift_En;
			logic [7:0]B_out;
			 
			logic Ld_A;
			logic [16:0] Out;
			assign Ld_A = ADD | SUB;
			logic X;
			logic shift_A;
			
			
		//nine bit adder 
		
		nine_sw_Bit_adder adderA(.A(A_out), .sw_B(SW), .cin(1'b0), .s(A_in), .SUB(SUB), .X(X) );
		
		//control unit
		
		control_unit control(.clk(Clk), .reset(Reset_h), .run(Run_h), .M(B_out[0]),
		 .Shift_En(Shift_En), .SUB(SUB), .ADD(ADD), .CLR(CLR), .LD(LD));
		
		
		//register unit (A & B & X)

		register_unit register(.Clk(Clk), .Reset(Reset_h), .Ld_A(Ld_A), .Ld_B(LD), .Shift_En(Shift_En),
		.A_In(A_in), .B_In(SW), .X_In(X), .A_out(A_out), .B_out(B_out), .CLR(CLR), .Shift_In_B(shift_A), 
		 .Shift_Out_A(shift_A));
	
	


		
		
		
		
		
		
		
		
		// Hex units that display contents of SW and register R in hex
		
		//need to swap LED 3/4 with 5/6 
		HexDriver		AHex0 (
								.In0(SW[3:0]),
								.Out0(HEX0) );
								
		HexDriver		AHex1 (
								.In0(SW[7:4]),
								.Out0(HEX1) );
								
		HexDriver		BHex0 (
								.In0(B_out[3:0]),
								.Out0(HEX2) );
								
		HexDriver		BHex1 (
								.In0(B_out[7:4]),
								.Out0(HEX3) );
		
		HexDriver		BHex2 (
								.In0(A_out[3:0]),
								.Out0(HEX4) );
								
		HexDriver		BHex3 (
								.In0(A_out[7:4]),
								.Out0(HEX5) );
								
	assign LED[7:0] = SW;
	assign LED[9] = Reset_h;
	assign LED [8] = Run_h;	
	
		
endmodule