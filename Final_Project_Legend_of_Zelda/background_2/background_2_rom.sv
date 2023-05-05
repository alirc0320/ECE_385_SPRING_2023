module background_2_rom (
	input logic clock,
	input logic [15:0] address,
	output logic [4:0] q
);

logic [4:0] memory [0:39999] /* synthesis ram_init_file = "./background_2/background_2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
