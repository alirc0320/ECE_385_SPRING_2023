module sword_left_1_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hF, 4'hF, 4'hF},
	{4'hA, 4'h9, 4'h3},
	{4'hA, 4'h5, 4'h2},
	{4'hC, 4'hC, 4'hA},
	{4'h9, 4'h9, 4'h6},
	{4'hD, 4'h9, 4'h4},
	{4'hE, 4'hE, 4'hD},
	{4'h9, 4'hB, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule
