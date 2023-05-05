module right_map_rom (
	input logic clock,
	input logic [15:0] address,
	output logic [4:0] q
);

logic [4:0] memory [0:39999] /* synthesis ram_init_file = "./right_map/right_map.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
