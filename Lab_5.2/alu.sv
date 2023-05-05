module ALU(
		input  logic [1:0]  ALUK, 
      input  logic [15:0] sr1_out, sr2_mux_out,
      output logic [15:0] ALU_OUT);
					 
			

	 //This is the 1-bit ALU
    always_comb
	 begin
        case (ALUK) //The unique keyword here instructs synthesis to fail if a case appears more than once.
	 	   2'b00   : ALU_OUT = sr1_out + sr2_mux_out ;
		   2'b01   : ALU_OUT = sr1_out & sr2_mux_out ;
		   2'b10   : ALU_OUT = ~sr1_out;
		   2'b11   : ALU_OUT = sr1_out;
        endcase
    end

	 
endmodule

module SR2_MUX (
	input logic SR2MUX, //select bit - comes from IR[5]
	input logic [15:0] sr2_out,
	input logic [4:0] IR_4, //will instantiate with IR[4:0]	
	output logic [15:0] sext_4, //sign extended IR[4:0]
	output logic [15:0] SR2_MUX_OUT
);

always_comb
begin
	if(IR_4[4] == 1)
		sext_4 = { {11{1'b1}}, IR_4};
	else if(IR_4[4] == 0)
		sext_4 = { {11{1'b0}}, IR_4};
		else 
		sext_4 = 16'hxxxx;
end

	always_comb
	begin
		case(SR2MUX)
		1'b0 	: SR2_MUX_OUT = sr2_out; 
		1'b1	: SR2_MUX_OUT = sext_4; 
		endcase
	end 

endmodule 