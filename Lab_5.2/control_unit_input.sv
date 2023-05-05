module LOGIC1(input  [15:0]BUS,
					output logic N,
					output logic Z,
					output logic P 
);

	always_comb
	begin
	P = 0 ;
	N = 0 ; 
	Z = 0 ;
	if(BUS != 16'h0000 && BUS[15] == 1'b0)
	P = 1'b1;
	
	if(BUS == 16'h0000)
	Z = 1'b1;
	
	
	if(BUS[15] == 1'b1)
	N = 1'b1;
	end
	
endmodule

module one_bit_register(input			logic		Clk, Reset, LD,
								input			logic		D,
								output logic      Data_Out);
								
								
								
								
								
								
								
								always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 1'b0;
		 else if (LD)
			  Data_Out <= D;
    end
	
								
								
								
								
								
								
								
endmodule


								

module LOGIC2( input logic  [11:9] IR,
					input logic N, Z, P,
					output logic logic_out
					);
					always_comb
					begin
			logic_out = ((IR[11] & N) | (IR[10] & Z) | (IR[9] & P)) ;
			end
endmodule






