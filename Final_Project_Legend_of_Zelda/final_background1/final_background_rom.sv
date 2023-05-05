module final_background_rom (
	input logic clock,
	input logic [15:0] address,
	output logic [4:0] q
);

logic [4:0] memory [0:62499] /* synthesis ram_init_file = "./final_background/final_background.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
