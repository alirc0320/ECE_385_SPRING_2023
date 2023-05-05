module right2_final_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./right2_final/right2_final.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
