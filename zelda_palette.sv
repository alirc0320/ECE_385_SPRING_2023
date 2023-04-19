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



//
//module background_palette (
//	input logic [4:0] index,
//	output logic [3:0] red, green, blue
//);
//
//localparam [0:31][11:0] palette = {
//	{4'hE, 4'hD, 4'hA},
//	{4'h6, 4'hA, 4'h3},
//	{4'h1, 4'h1, 4'h1},
//	{4'hA, 4'hC, 4'h7},
//	{4'h4, 4'h7, 4'h2},
//	{4'h7, 4'h6, 4'h5},
//	{4'h3, 4'h5, 4'h1},
//	{4'hD, 4'hC, 4'h9},
//	{4'h9, 4'hB, 4'h6},
//	{4'h0, 4'h1, 4'h0},
//	{4'h6, 4'h5, 4'h4},
//	{4'h4, 4'h5, 4'h2},
//	{4'h7, 4'h9, 4'h5},
//	{4'h5, 4'h9, 4'h2},
//	{4'hB, 4'hA, 4'h8},
//	{4'h9, 4'h9, 4'h6},
//	{4'h3, 4'h3, 4'h2},
//	{4'hC, 4'hC, 4'h8},
//	{4'h1, 4'h3, 4'h0},
//	{4'h5, 4'hA, 4'h2},
//	{4'h2, 4'h4, 4'h1},
//	{4'h0, 4'h0, 4'h0},
//	{4'h6, 4'h8, 4'h3},
//	{4'h1, 4'h2, 4'h0},
//	{4'h8, 4'hB, 4'h5},
//	{4'h5, 4'h4, 4'h3},
//	{4'h7, 4'hA, 4'h4},
//	{4'h2, 4'h2, 4'h1},
//	{4'hA, 4'hA, 4'h7},
//	{4'h8, 4'h7, 4'h6},
//	{4'h3, 4'h6, 4'h1},
//	{4'hC, 4'hB, 4'h9}
//};
//
//assign {red, green, blue} = palette[index];
//
//endmodule



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

//
//module background_collision_palette (
//	input logic [3:0] index,
//	output logic [3:0] red, green, blue,
//	
//	input logic [3:0] index2,
//	output logic [3:0] red1, green1, blue1
//);
//
//localparam [0:15][11:0] palette = {
//	{4'h2, 4'h4, 4'h1},
//	{4'hE, 4'hD, 4'hA}, //sand color 
//	{4'h5, 4'h7, 4'h2},
//	{4'h9, 4'h9, 4'h7},
//	{4'h0, 4'h0, 4'h0},
//	{4'hB, 4'h3, 4'hB}, //need to use this - hot pink 
//	{4'hA, 4'hB, 4'h7},
//	{4'h4, 4'h5, 4'h2},
//	{4'h1, 4'h2, 4'h0},
//	{4'h8, 4'hA, 4'h5},
//	{4'h5, 4'hA, 4'h2},
//	{4'h6, 4'h7, 4'h4}, 
//	{4'h6, 4'h2, 4'h6}, //need to use this 
//	{4'hC, 4'hC, 4'h9},
//	{4'hF, 4'hB, 4'hD}, // need to use this
//	{4'h6, 4'h9, 4'h4}
//};
//
//assign {red, green, blue} = palette[index];
//assign {red1, green1, blue1} = palette[index2];
//
//endmodule



////////////////////////////////////////////////////////////////////
module Final_background_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue,
	
	
	
	
	input logic [3:0] index2,
	output logic [3:0] red1, green1, blue1
);

localparam [0:15][11:0] palette = {
	{4'h3, 4'h5, 4'h2}, //green				(51, 85, 34)
	{4'hE, 4'hD, 4'hA}, //sand 
	{4'h8, 4'hA, 4'h5}, //green				(136, 170, 85)
	{4'h1, 4'h2, 4'h0}, //dark greenish		(17, 34, 0)
	{4'h5, 4'hA, 4'h2}, //green				(85,170, 34)
	{4'hA, 4'hB, 4'h7}, //green				(170, 187, 119)
	{4'h0, 4'h0, 4'h0}, //black			   (0,0,0)
	{4'h6, 4'h6, 4'h4}, //brownish/green	(102,102,68)
	{4'hC, 4'hC, 4'h9}, //pale hreen			(204,204,153)
	{4'h5, 4'h8, 4'h3}, //green				(85, 136,51)
	{4'hD, 4'h8, 4'hA}, //light pink			(221,136,170)
	{4'h2, 4'h3, 4'h1}, //dark green		   (34,51,17)
	{4'hB, 4'h4, 4'h7}, //dark pink		   (187,68,119)
	{4'h8, 4'h8, 4'h6}, //grayish green    (136,136,102)
	{4'h7, 4'hA, 4'h4}, //dark green			 (119,170,68)
	{4'hF, 4'hC, 4'hC} //lightest baby pink (255,204,204)
};

assign {red, green, blue} = palette[index];
assign {red1, green1, blue1} = palette[index2];

endmodule


