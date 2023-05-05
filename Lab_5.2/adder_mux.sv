module ADDR2MUX(
						input		logic		[1:0]S, //2-bit select 
						input   logic	   [15:0]   Zero,
						input 	logic			[15:0]	sext_10,
						input		logic		[15:0]	sext_8,
						input			logic	[15:0]	sext_5,
						output logic   [15:0] 	ADDR2MUX_OUT);
						
											
	always_comb
		begin
		
		
		case(S) //if S is ____, then Q_Out will = some In value 
				
						2'b00	:	ADDR2MUX_OUT <= Zero;
						2'b01	:	ADDR2MUX_OUT <= sext_5;
						2'b10 : 	ADDR2MUX_OUT <= sext_8;
						2'b11 :  ADDR2MUX_OUT <= sext_10; 
						
				endcase
			
		end

endmodule




















module ADDR1MUX(
						input	logic				S, //2-bit select 
						input	logic				[15:0]	PC_Out, //PC+1
						input logic				[15:0]   SR1_OUT, //BUS
				
						output logic   [15:0] Q_Out);

						
	always_comb
		begin
		case(S) //if S is ____, then Q_Out will = some In value 
				
						1'b0	:	Q_Out <= PC_Out;
						1'b1	:	Q_Out <= SR1_OUT;
				endcase
			
		end

endmodule
		
		
		
		module ADDER(
		 
      input  logic [15:0] ADDR2MUX_OUT, ADDR1MUXOUT,
      output logic [15:0] ADDER);
					 
    always_comb
	 begin
       ADDER = ADDR2MUX_OUT + ADDR1MUXOUT;
    end

	 
endmodule




