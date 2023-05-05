module right_map_example (
	input logic [9:0] DrawX, DrawY,
	input logic vga_clk, blank,
	output logic [3:0] red, green, blue
);

logic [15:0] rom_address;
logic [4:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue;

assign rom_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);

always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;

	if (blank) begin
		red <= palette_red;
		green <= palette_green;
		blue <= palette_blue;
	end
end

right_map_rom right_map_rom (
	.clock   (vga_clk),
	.address (rom_address),
	.q       (rom_q)
);

right_map_palette right_map_palette (
	.index (rom_q),
	.red   (palette_red),
	.green (palette_green),
	.blue  (palette_blue)
);

endmodule
