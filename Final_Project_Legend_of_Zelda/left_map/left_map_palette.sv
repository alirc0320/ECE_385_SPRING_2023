module left_map_palette (
	input logic [4:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:31][11:0] palette = {
	{4'h0, 4'hA, 4'h0},
	{4'hF, 4'hD, 4'hA},
	{4'h5, 4'h8, 4'h3},
	{4'h3, 4'h3, 4'h2},
	{4'hF, 4'h6, 4'hB},
	{4'h0, 4'h6, 4'h0},
	{4'h7, 4'h9, 4'h5},
	{4'h2, 4'hA, 4'h1},
	{4'h0, 4'h2, 4'h0},
	{4'hD, 4'hC, 4'h9},
	{4'h6, 4'hB, 4'h4},
	{4'h5, 4'h5, 4'h3},
	{4'hF, 4'h8, 4'hB},
	{4'h7, 4'h6, 4'h4},
	{4'h0, 4'h4, 4'h0},
	{4'hF, 4'hA, 4'hA},
	{4'h0, 4'h8, 4'h0},
	{4'h9, 4'hC, 4'h6},
	{4'h0, 4'h0, 4'h0},
	{4'h3, 4'h5, 4'h2},
	{4'h8, 4'hB, 4'h5},
	{4'h3, 4'h8, 4'h2},
	{4'h8, 4'h7, 4'h5},
	{4'h4, 4'h4, 4'h3},
	{4'h1, 4'h5, 4'h1},
	{4'h1, 4'hA, 4'h0},
	{4'h1, 4'h8, 4'h1},
	{4'hF, 4'hB, 4'hA},
	{4'h4, 4'hB, 4'h3},
	{4'h9, 4'h9, 4'h6},
	{4'hB, 4'hA, 4'h7},
	{4'h1, 4'h2, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule
