module zelda_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'h6, 4'h2},
	{4'hD, 4'h9, 4'h4},
	{4'h4, 4'h7, 4'h2},
	{4'h7, 4'h7, 4'h6},
	{4'h9, 4'hC, 4'h4},
	{4'hC, 4'h8, 4'h3},
	{4'h8, 4'h8, 4'h6},
	{4'h5, 4'h7, 4'h4},
	{4'hA, 4'h8, 4'h3},
	{4'h7, 4'hA, 4'h3},
	{4'hA, 4'h5, 4'h2},
	{4'hB, 4'h8, 4'h5},
	{4'hB, 4'hB, 4'h4},
	{4'h9, 4'hA, 4'h3},
	{4'h8, 4'h6, 4'h4},
	{4'hB, 4'h6, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule


module zelda_right_1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hB, 4'h6, 4'h2},
	{4'h6, 4'h7, 4'h5},
	{4'h9, 4'hC, 4'h3},
	{4'hD, 4'h9, 4'h4},
	{4'h7, 4'h7, 4'h7},
	{4'h9, 4'hA, 4'h3},
	{4'h9, 4'h7, 4'h5},
	{4'h5, 4'h7, 4'h3},
	{4'hB, 4'hB, 4'h4},
	{4'h7, 4'h9, 4'h6},
	{4'hA, 4'h5, 4'h2},
	{4'hC, 4'h8, 4'h3},
	{4'h9, 4'h5, 4'h3},
	{4'h8, 4'h6, 4'h5},
	{4'h8, 4'hB, 4'h4},
	{4'hA, 4'h7, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule




module background_palette (
	input logic [4:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:31][11:0] palette = {
	{4'hE, 4'hD, 4'hA},
	{4'h6, 4'hA, 4'h3},
	{4'h1, 4'h1, 4'h1},
	{4'hA, 4'hC, 4'h7},
	{4'h4, 4'h7, 4'h2},
	{4'h7, 4'h6, 4'h5},
	{4'h3, 4'h5, 4'h1},
	{4'hD, 4'hC, 4'h9},
	{4'h9, 4'hB, 4'h6},
	{4'h0, 4'h1, 4'h0},
	{4'h6, 4'h5, 4'h4},
	{4'h4, 4'h5, 4'h2},
	{4'h7, 4'h9, 4'h5},
	{4'h5, 4'h9, 4'h2},
	{4'hB, 4'hA, 4'h8},
	{4'h9, 4'h9, 4'h6},
	{4'h3, 4'h3, 4'h2},
	{4'hC, 4'hC, 4'h8},
	{4'h1, 4'h3, 4'h0},
	{4'h5, 4'hA, 4'h2},
	{4'h2, 4'h4, 4'h1},
	{4'h0, 4'h0, 4'h0},
	{4'h6, 4'h8, 4'h3},
	{4'h1, 4'h2, 4'h0},
	{4'h8, 4'hB, 4'h5},
	{4'h5, 4'h4, 4'h3},
	{4'h7, 4'hA, 4'h4},
	{4'h2, 4'h2, 4'h1},
	{4'hA, 4'hA, 4'h7},
	{4'h8, 4'h7, 4'h6},
	{4'h3, 4'h6, 4'h1},
	{4'hC, 4'hB, 4'h9}
};

assign {red, green, blue} = palette[index];

endmodule



module zelda_up_1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'hA, 4'h5, 4'h2},
	{4'h9, 4'hB, 4'h3},
	{4'h8, 4'h7, 4'h6},
	{4'hA, 4'hA, 4'h3},
	{4'hD, 4'h9, 4'h4},
	{4'hA, 4'h7, 4'h2},
	{4'h9, 4'hC, 4'h3},
	{4'h8, 4'h6, 4'h4},
	{4'hA, 4'h8, 4'h5},
	{4'hC, 4'h8, 4'h3},
	{4'h7, 4'h7, 4'h7},
	{4'hA, 4'h6, 4'h2},
	{4'h6, 4'h7, 4'h5},
	{4'h8, 4'h9, 4'h6},
	{4'h8, 4'hA, 4'h4},
	{4'h9, 4'h5, 4'h3}
};

assign {red, green, blue} = palette[index];

endmodule



module zelda_left_1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h7, 4'h7, 4'h7},
	{4'h2, 4'h7, 4'h2},
	{4'hB, 4'h8, 4'h5},
	{4'h9, 4'hB, 4'h1},
	{4'hC, 4'h4, 4'h1},
	{4'hE, 4'h9, 4'h3},
	{4'hA, 4'h5, 4'h3},
	{4'h4, 4'h8, 4'h1},
	{4'h4, 4'h7, 4'h4},
	{4'h8, 4'hC, 4'h1},
	{4'h1, 4'h7, 4'h1},
	{4'hC, 4'h6, 4'h1},
	{4'hA, 4'h9, 4'h1},
	{4'h8, 4'h7, 4'h6},
	{4'h8, 4'h9, 4'h8},
	{4'h7, 4'hB, 4'h3}
};

assign {red, green, blue} = palette[index];

endmodule




module zelda_right_2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hA, 4'h5, 4'h2},
	{4'h6, 4'h7, 4'h5},
	{4'h9, 4'hB, 4'h4},
	{4'hD, 4'h9, 4'h4},
	{4'h7, 4'h7, 4'h6},
	{4'hA, 4'h8, 4'h3},
	{4'h4, 4'h7, 4'h2},
	{4'h8, 4'h6, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule


module background_collision_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue,
	
	input logic [3:0] index2,
	output logic [3:0] red1, green1, blue1
);

localparam [0:15][11:0] palette = {
	{4'h2, 4'h4, 4'h1},
	{4'hE, 4'hD, 4'hA}, //sand color 
	{4'h5, 4'h7, 4'h2},
	{4'h9, 4'h9, 4'h7},
	{4'h0, 4'h0, 4'h0},
	{4'hB, 4'h3, 4'hB}, //need to use this - hot pink 
	{4'hA, 4'hB, 4'h7},
	{4'h4, 4'h5, 4'h2},
	{4'h1, 4'h2, 4'h0},
	{4'h8, 4'hA, 4'h5},
	{4'h5, 4'hA, 4'h2},
	{4'h6, 4'h7, 4'h4}, 
	{4'h6, 4'h2, 4'h6}, //need to use this 
	{4'hC, 4'hC, 4'h9},
	{4'hF, 4'hB, 4'hD}, // need to use this
	{4'h6, 4'h9, 4'h4}
};

assign {red, green, blue} = palette[index];
assign {red1, green1, blue1} = palette[index2];

endmodule

