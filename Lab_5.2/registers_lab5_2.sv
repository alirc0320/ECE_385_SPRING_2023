module register(

	input					Clk, Reset, Load,
	input					[15:0] D,
	output logic      [15:0] Data_Out);
	
    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 16'h0000;
		 else if (Load)
			  Data_Out <= D;
    end
	
					
endmodule



//come back 

module PC_Mux(    input	logic 			[1:0]S, //2-bit select 
						input	logic 		[15:0]	PC1, //PC+1
						input logic			[15:0]   BUS, //BUS
						input logic		[15:0]   ADDER,
						
						
						
						output logic   [15:0] Q_Out
);
	always_comb
		begin
		case(S) //if S is ____, then Q_Out will = some In value 
				
						2'b00	:	Q_Out <= PC1;
						2'b01	:	Q_Out <= BUS;
						2'b11 :  Q_Out <= 16'hxxxx ; 
						2'b10 : 	Q_Out <= ADDER;
				endcase
			
		end

endmodule
		

module MIO_EN_Mux(    input	logic			    S, //1-bit select 
						input		logic			[15:0]BUS,
						input 	logic		   [15:0]MEM,
						
						
						output logic  [15:0] Q_Out
);
	always_comb
		begin
		case(S) //if S is ____, then Q_Out will = some In value 
				
						1'b0	:	Q_Out <= BUS;
						1'b1	:	Q_Out <= MEM;
						
				endcase
		end









endmodule






module tri_state	(input				GateMDR, GateALU, GatePC, GateMARMUX, //4-bit select 
						 
						 input		       [15:0] ADDER, MDR, PC, ALU, //outputs 
						 output logic      [15:0] Q_Out );
						
		// 17 bit parallel multiplexer implemented using case statement
		always_comb
		begin
					//this unique case takes care of the if/else statements 
					
				if(GateMDR == 1)
				     Q_Out = MDR;
				else if(GateALU == 1) 
				     Q_Out = ALU;
				else if(GatePC == 1) 
				     Q_Out = PC;
				else if(GateMARMUX == 1) 
				     Q_Out = ADDER;
				else
				     Q_Out = 16'hxxxx;
		end
		
		
endmodule


