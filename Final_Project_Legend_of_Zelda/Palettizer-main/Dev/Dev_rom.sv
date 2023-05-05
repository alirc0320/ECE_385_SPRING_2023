module Dev_rom (
	input logic clock,
	input logic [10:0] address,
	output logic [4:0] q
);

logic [4:0] memory [0:1599] /* synthesis ram_init_file = "./Dev/Dev.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
