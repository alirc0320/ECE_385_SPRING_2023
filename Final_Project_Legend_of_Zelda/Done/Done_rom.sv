module Done_rom (
	input logic clock,
	input logic [16:0] address,
	output logic [4:0] q
);

logic [4:0] memory [0:89999] /* synthesis ram_init_file = "./Done/Done.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
