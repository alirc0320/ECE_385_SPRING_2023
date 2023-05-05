module sword_left_2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hD, 4'h9, 4'h4},
	{4'h0, 4'h0, 4'h0},
	{4'hE, 4'hE, 4'hE},
	{4'h5, 4'h4, 4'hA},
	{4'hA, 4'h6, 4'h2},
	{4'h9, 4'hB, 4'h4},
	{4'h7, 4'h7, 4'h6},
	{4'h4, 4'h3, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule
