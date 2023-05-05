
module MARMUX(
						input	logic			S, //2-bit select 
						input	logic			[7:0]	IR_7, //PC+1
						input logic			[15:0]   ADDER_OUT, //BUS
						output logic			[15:0]   zext_7,
						output logic   [15:0] 	Q_Out);
						
										
always_comb
begin
	
		zext_7 = { {8{1'b0}}, IR_7};
	
end


						
	always_comb
		begin
		unique case(S) //if S is ____, then Q_Out will = some In value 
				
						1'b0	:	Q_Out <= zext_7;
						1'b1	:	Q_Out <= ADDER_OUT;
				endcase
			
		end

endmodule
