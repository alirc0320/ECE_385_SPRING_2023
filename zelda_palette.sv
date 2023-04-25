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

module Final_background_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
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


endmodule


module up1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h9, 4'hC, 4'h4},//(153,204,68) HAT
	{4'h4, 4'h7, 4'h3},//(68, 119, 51) IDK
	{4'h8, 4'h7, 4'h5},//(136, 119,85 )  IDK
	{4'hB, 4'h5, 4'h2},//(187, 85 ,34) IDK
	{4'hA, 4'h9, 4'h3},//(170,153 ,51) IDK
	{4'h7, 4'h7, 4'h7},//(119, 119,119 ) GRAY
	{4'h3, 4'h7, 4'h2},//(51, 119,34) MAYBEEEEEEEEEE BACK GREEN
	{4'hD, 4'h9, 4'h4},//(221,153,68) idk
	{4'hB, 4'h8, 4'h5},//(187,136,85) idk 
	{4'hB, 4'h6, 4'h2},//(187,102,34) idk 
	{4'h6, 4'h7, 4'h6},//(102,119,102 ) maybe 
	{4'h8, 4'hA, 4'h5},//(136,170,85) idk
	{4'h9, 4'hB, 4'h3},//(153,187,51) idk 
	{4'hA, 4'h6, 4'h3},//(170,102,51) idk 
	{4'h4, 4'h7, 4'h3},//(68,119,51)idk 
	{4'h5, 4'h9, 4'h2} //(85,153,34) idk 
};

assign {red, green, blue} = palette[index];

endmodule




module final_down1_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hE, 4'h7, 4'h2},
	{4'hA, 4'hB, 4'h1},
	{4'h2, 4'h2, 4'h1},
	{4'hC, 4'h5, 4'h1},
	{4'hF, 4'h9, 4'h3},
	{4'h7, 4'h9, 4'h3},
	{4'h7, 4'h4, 4'h3},
	{4'hA, 4'h8, 4'h1},
	{4'hD, 4'h9, 4'h5},
	{4'h1, 4'h0, 4'h0},
	{4'hA, 4'h6, 4'h3},
	{4'hD, 4'hA, 4'h3},
	{4'h8, 4'hC, 4'h1},
	{4'h3, 4'h6, 4'h1},
	{4'hC, 4'h6, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule




module final_final_sprite_left_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'h9, 4'h1},
	{4'h8, 4'hC, 4'h1},
	{4'h4, 4'h4, 4'h2},
	{4'hE, 4'h9, 4'h3},
	{4'h9, 4'h5, 4'h4},
	{4'hB, 4'h5, 4'h1},
	{4'h7, 4'h9, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule



module final_final_right_sprite_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'h9, 4'h1},
	{4'hC, 4'h5, 4'h1},
	{4'hE, 4'h9, 4'h3},
	{4'h3, 4'h3, 4'h2},
	{4'h8, 4'hC, 4'h1},
	{4'h7, 4'hA, 4'h3},
	{4'h8, 4'h6, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule



module final_left2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hE, 4'hE, 4'hE},
	{4'hA, 4'h6, 4'h1},
	{4'h8, 4'hA, 4'h1},
	{4'hD, 4'h8, 4'h2},
	{4'hF, 4'hF, 4'hF},
	{4'hB, 4'h4, 4'h0},
	{4'h5, 4'h3, 4'h2},
	{4'h7, 4'h8, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule





module final_up2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hF, 4'hF, 4'hF},
	{4'h8, 4'hC, 4'h1},
	{4'hE, 4'h8, 4'h3},
	{4'hC, 4'h5, 4'h1},
	{4'hB, 4'hA, 4'h8},
	{4'hA, 4'h9, 4'h1},
	{4'hD, 4'hD, 4'hD},
	{4'h9, 4'h7, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule





module final_down2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hE, 4'h8, 4'h3},
	{4'hF, 4'hF, 4'hF},
	{4'hC, 4'h5, 4'h1},
	{4'h7, 4'hC, 4'h1},
	{4'hC, 4'hC, 4'hB},
	{4'hA, 4'h8, 4'h5},
	{4'hA, 4'h9, 4'h1},
	{4'hB, 4'h9, 4'h8}
};

assign {red, green, blue} = palette[index];

endmodule


module aleena_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hB, 4'h5, 4'h2},
	{4'hF, 4'hF, 4'hF},
	{4'h8, 4'hC, 4'h1},
	{4'hB, 4'hA, 4'h9},
	{4'hE, 4'h8, 4'h3},
	{4'h8, 4'h9, 4'h5},
	{4'hB, 4'hA, 4'h2},
	{4'hE, 4'hD, 4'hD}
};

assign {red, green, blue} = palette[index];

endmodule





module sword_right_1_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hF, 4'hF, 4'hF},
	{4'hA, 4'h8, 4'h3},
	{4'hC, 4'hC, 4'hA},
	{4'hA, 4'h5, 4'h2},
	{4'hD, 4'h9, 4'h4},
	{4'h9, 4'hB, 4'h4},
	{4'h9, 4'h9, 4'h6},
	{4'hE, 4'hE, 4'hD}
};

assign {red, green, blue} = palette[index];

endmodule

module sword_right_2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h5, 4'h4, 4'hA},
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'h6, 4'h2},
	{4'hE, 4'hE, 4'hE},
	{4'h9, 4'hB, 4'h4},
	{4'h4, 4'h3, 4'h2},
	{4'h7, 4'h7, 4'h6},
	{4'hD, 4'h9, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule




module sword_right_3_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hD, 4'h9, 4'h4},
	{4'hF, 4'hF, 4'hF},
	{4'h9, 4'hB, 4'h4},
	{4'hA, 4'h6, 4'h2},
	{4'h7, 4'h6, 4'h4},
	{4'hC, 4'hB, 4'hB},
	{4'h3, 4'h2, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule



module sword_right_4_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hA, 4'h6, 4'h2},
	{4'h0, 4'h0, 4'h0},
	{4'h9, 4'hB, 4'h4},
	{4'hD, 4'h9, 4'h4},
	{4'hC, 4'hB, 4'hA},
	{4'h3, 4'h2, 4'h2},
	{4'h6, 4'h6, 4'h3},
	{4'hF, 4'hF, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule



