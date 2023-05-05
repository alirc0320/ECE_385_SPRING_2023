module zelda_right_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./zelda_right_1/zelda_right_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
