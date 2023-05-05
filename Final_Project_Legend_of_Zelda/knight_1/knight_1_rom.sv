module knight_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./knight_1/knight_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
