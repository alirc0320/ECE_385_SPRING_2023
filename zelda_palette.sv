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
module final_background_palette (
	input logic [4:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:31][11:0] palette = {
	{4'h4, 4'h4, 4'h2}, //68, 68, 34
	{4'hF, 4'hD, 4'hA}, //255, 221, 170
	{4'h8, 4'h9, 4'h6}, //136, 153, 102
	{4'h5, 4'hA, 4'h2},//85, 170, 34
	{4'h0, 4'h0, 4'h0},
	{4'h7, 4'h7, 4'h5},  //119, 119, 85
	{4'hE, 4'hA, 4'hA}, //238, 170, 170          pink 
	{4'h4, 4'h6, 4'h2}, //68, 102, 34
	{4'hA, 4'hB, 4'h7}, //170, 187, 119
	{4'h1, 4'h2, 4'h0}, //17, 34, 0
	{4'h2, 4'h4, 4'h1}, //34, 68, 17
	{4'h7, 4'hA, 4'h4}, // 119, 170, 68
	{4'hD, 4'h8, 4'hA}, //221, 136, 170         pink
	{4'h4, 4'h8, 4'h2}, //68, 136, 34
	{4'h9, 4'h9, 4'h6}, //153, 153, 102
	{4'h9, 4'hB, 4'h6}, //153, 187, 102
	{4'h5, 4'h6, 4'h4}, //85, 102, 68
	{4'h6, 4'hA, 4'h3}, //102, 170, 51 
	{4'hB, 4'h9, 4'h8}, // 187, 153, 136 ??
	{4'h8, 4'hB, 4'h5}, //136, 187, 85
	{4'h6, 4'h8, 4'h3}, //102, 136, 51
	{4'h7, 4'h9, 4'h4}, //119, 153, 68
	{4'h2, 4'h3, 4'h1}, //34, 51, 17
	{4'hA, 4'hA, 4'h7}, //170, 170. 119
	{4'hC, 4'hC, 4'h9}, //204, 204, 153
	{4'h8, 4'h8, 4'h5}, // 136,  136, 85
	{4'h1, 4'h1, 4'h0}, //17, 17, 0
	{4'h3, 4'h5, 4'h1}, //51, 85, 17
	{4'h2, 4'h2, 4'h1}, //34, 34, 17
	{4'h4, 4'h5, 4'h3}, //68, 85, 51
	{4'hF, 4'hC, 4'hB}, //255, 204, 187
	{4'h5, 4'h9, 4'h2} //85, 153, 34
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






module sword_up_1_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h1, 4'h1, 4'h0},
	{4'h9, 4'h9, 4'h3},
	{4'hA, 4'h6, 4'h2},
	{4'h0, 4'h0, 4'h0},
	{4'h9, 4'hC, 4'h3},
	{4'h6, 4'h6, 4'h3},
	{4'hC, 4'h8, 4'h4},
	{4'h4, 4'h3, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule




module sword_up_2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'hC, 4'h5},
	{4'hF, 4'hF, 4'hF},
	{4'h9, 4'h5, 4'h3},
	{4'h2, 4'h2, 4'h1},
	{4'hB, 4'hB, 4'hC},
	{4'h4, 4'h4, 4'h6},
	{4'hA, 4'h8, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule



module sword_up_3_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'h9, 4'h8, 4'h3},
	{4'hF, 4'hF, 4'hE},
	{4'h5, 4'h5, 4'h5},
	{4'h3, 4'h2, 4'h2},
	{4'h9, 4'hC, 4'h3},
	{4'hA, 4'h6, 4'h2},
	{4'hC, 4'h9, 4'h5}
};

assign {red, green, blue} = palette[index];

endmodule


module sword_up_4_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h9, 4'hC, 4'h4},
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'h6, 4'h2},
	{4'hE, 4'hF, 4'hE},
	{4'h2, 4'h1, 4'h1},
	{4'hC, 4'h9, 4'h5},
	{4'h6, 4'h5, 4'h3},
	{4'hA, 4'h9, 4'h3}
};

assign {red, green, blue} = palette[index];

endmodule


module sword_down_1_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hC, 4'h5, 4'h1},
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'h9, 4'h1},
	{4'hE, 4'h8, 4'h3},
	{4'h4, 4'h3, 4'h2},
	{4'h8, 4'hC, 4'h1},
	{4'hA, 4'h7, 4'h4},
	{4'h7, 4'h5, 4'h4}
};

assign {red, green, blue} = palette[index];

endmodule



module sword_down_2_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hB, 4'h6, 4'h1},
	{4'h0, 4'h0, 4'h0},
	{4'hA, 4'hA, 4'hA},
	{4'h9, 4'hB, 4'h1},
	{4'h3, 4'h2, 4'h9},
	{4'hE, 4'h8, 4'h3},
	{4'h4, 4'h3, 4'h3},
	{4'hF, 4'hF, 4'hF}
};

assign {red, green, blue} = palette[index];

endmodule


module sword_down_3_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hE, 4'h8, 4'h3},
	{4'hF, 4'hF, 4'hF},
	{4'h8, 4'h6, 4'h3},
	{4'h8, 4'hB, 4'h1},
	{4'hC, 4'h5, 4'h1},
	{4'hB, 4'hB, 4'hA},
	{4'h4, 4'h3, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule


module sword_down_4_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hC, 4'h5, 4'h1},
	{4'h0, 4'h0, 4'h0},
	{4'h8, 4'h6, 4'h4},
	{4'hE, 4'h8, 4'h3},
	{4'hF, 4'hF, 4'hF},
	{4'h8, 4'hB, 4'h1},
	{4'h2, 4'h2, 4'h1},
	{4'hC, 4'hB, 4'hA}
};

assign {red, green, blue} = palette[index];

endmodule


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


module sword_left_3_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h9, 4'hB, 4'h4},
	{4'h0, 4'h0, 4'h0},
	{4'hF, 4'hF, 4'hF},
	{4'hA, 4'h6, 4'h2},
	{4'hD, 4'h9, 4'h4},
	{4'h3, 4'h2, 4'h2},
	{4'h7, 4'h6, 4'h4},
	{4'hC, 4'hB, 4'hB}
};

assign {red, green, blue} = palette[index];

endmodule

module sword_left_4_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hC, 4'hB, 4'hA},
	{4'h0, 4'h0, 4'h0},
	{4'h9, 4'hB, 4'h4},
	{4'hA, 4'h6, 4'h2},
	{4'h6, 4'h6, 4'h4},
	{4'hF, 4'hF, 4'hF},
	{4'hD, 4'h9, 4'h4},
	{4'h3, 4'h2, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule
module enemy_1_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hF, 4'hF, 4'hF},
	{4'h1, 4'h1, 4'h1},
	{4'h8, 4'h7, 4'h8},
	{4'h0, 4'h0, 4'h0},
	{4'h4, 4'h4, 4'h5},
	{4'hD, 4'hD, 4'hD},
	{4'hA, 4'hA, 4'hA},
	{4'h2, 4'h2, 4'h2}
};

assign {red, green, blue} = palette[index];

endmodule




module knight_1_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'h5, 4'h8, 4'hF},
	{4'h0, 4'h0, 4'h0},
	{4'h1, 4'h1, 4'hB},
	{4'hF, 4'hF, 4'hF},
	{4'h5, 4'h5, 4'h7},
	{4'h1, 4'h2, 4'h3},
	{4'h3, 4'h5, 4'hD},
	{4'hB, 4'hC, 4'hD}
};

assign {red, green, blue} = palette[index];

endmodule


module professor_palette (
	input logic [2:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:7][11:0] palette = {
	{4'hE, 4'hB, 4'hA},
	{4'h3, 4'h2, 4'h2},
	{4'hF, 4'h6, 4'hB},
	{4'h7, 4'h4, 4'h4},
	{4'h1, 4'h1, 4'h0},
	{4'hB, 4'h7, 4'h5},
	{4'hB, 4'h5, 4'h8},
	{4'hD, 4'h9, 4'h8}
};

assign {red, green, blue} = palette[index];

endmodule





module background_2_palette (
	input logic [4:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:31][11:0] palette = {
	{4'h7, 4'h7, 4'h4}, //(119,119,68)       
	{4'hF, 4'hD, 4'hA}, //(255,221,170)
	{4'h0, 4'h7, 4'h0}, //(0,119,0)
	{4'h0, 4'hA, 4'h0}, //(0,170,0)
	{4'h2, 4'h2, 4'h1}, //(34,34,17)
	{4'hF, 4'hB, 4'hA}, //(255,187,170) //pink
	{4'h6, 4'hB, 4'h4}, //(102,187,68) //
	{4'hA, 4'hC, 4'h7}, //(170,204,119)
	{4'h3, 4'hA, 4'h2}, //(51,170,34)
	{4'h4, 4'h4, 4'h2}, //(68,68,34)
	{4'h0, 4'h4, 4'h0}, //(0,68,0)
	{4'h0, 4'h0, 4'h0}, //(0,0,0)
	{4'h0, 4'hA, 4'h0}, //(0,170,0)
	{4'h9, 4'hA, 4'h6}, //(153,170,102)
	{4'h2, 4'h5, 4'h1}, //(34,85,17)
	{4'h2, 4'hA, 4'h1}, //(34,170,17)
	{4'h4, 4'h8, 4'h3}, //(68,136,51)
	{4'h2, 4'h3, 4'h1}, //(34,51,17)
	{4'hE, 4'h8, 4'hA}, //(238,136,170) //pink
	{4'hD, 4'hC, 4'h9}, //(221,204,153)
	{4'hB, 4'h9, 4'h7}, //(187,153,119)
	{4'h5, 4'hB, 4'h3}, //(85,187,51)
	{4'h2, 4'h8, 4'h1}, //(34,136,17)
	{4'hF, 4'hC, 4'hB}, //(255,204,187)//pink?
	{4'h5, 4'h6, 4'h3}, //(85,102,51)
	{4'h8, 4'hC, 4'h5}, //(136,204,85)
	{4'h0, 4'h2, 4'h0}, //(0,34,0)
	{4'h8, 4'h8, 4'h6}, //(136,136,102)
	{4'h0, 4'h5, 4'h0}, //(0,85,0)
	{4'h7, 4'h9, 4'h5}, //(119,153,85)
	{4'h0, 4'h8, 4'h0}, //(0,136,0)
	{4'hE, 4'h9, 4'hA}  //(238,153,170) pink
};

assign {red, green, blue} = palette[index];

endmodule



module title_palette (
	input logic [4:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:31][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hE, 4'hB, 4'hB},
	{4'h7, 4'h7, 4'h7},
	{4'hB, 4'hB, 4'hB},
	{4'hA, 4'h5, 4'h2},
	{4'h4, 4'h3, 4'h3},
	{4'hA, 4'hA, 4'h5},
	{4'hC, 4'hF, 4'hC},
	{4'h6, 4'h9, 4'h3},
	{4'h9, 4'h9, 4'h9},
	{4'h3, 4'h3, 4'h2},
	{4'hD, 4'hB, 4'h7},
	{4'h0, 4'h0, 4'h0},
	{4'h5, 4'h6, 4'h1},
	{4'h5, 4'h5, 4'h4},
	{4'h8, 4'h9, 4'h5},
	{4'hB, 4'hB, 4'h7},
	{4'h8, 4'h8, 4'h8},
	{4'hE, 4'hF, 4'hE},
	{4'hD, 4'hB, 4'h9},
	{4'h4, 4'h2, 4'h0},
	{4'hA, 4'hA, 4'hA},
	{4'h8, 4'h7, 4'h6},
	{4'h6, 4'h4, 4'h2},
	{4'hF, 4'hD, 4'hB},
	{4'hB, 4'hB, 4'hB},
	{4'hA, 4'h9, 4'h7},
	{4'h6, 4'h6, 4'h6},
	{4'hB, 4'h7, 4'h4},
	{4'h5, 4'h8, 4'h4},
	{4'h7, 4'h7, 4'h3},
	{4'h1, 4'h1, 4'h1}
};

assign {red, green, blue} = palette[index];

endmodule

module Done_palette (
	input logic [4:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:31][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'hD, 4'hD, 4'hD},
	{4'h7, 4'h7, 4'h7},
	{4'h0, 4'h5, 4'hE},
	{4'h9, 4'h2, 4'h0},
	{4'hE, 4'h4, 4'h1},
	{4'h3, 4'h3, 4'h3},
	{4'h0, 4'h2, 4'h6},
	{4'hE, 4'hE, 4'hE},
	{4'hA, 4'hA, 4'hA},
	{4'hF, 4'hA, 4'h5},
	{4'h0, 4'h3, 4'h8},
	{4'h4, 4'h4, 4'h4},
	{4'hF, 4'h3, 4'h0},
	{4'h0, 4'h0, 4'h4},
	{4'h2, 4'h0, 4'h0},
	{4'h1, 4'h4, 4'hA},
	{4'hF, 4'hF, 4'hF},
	{4'hC, 4'hC, 4'hB},
	{4'h1, 4'h1, 4'h1},
	{4'h6, 4'h1, 4'h0},
	{4'h1, 4'h5, 4'hC},
	{4'hB, 4'h4, 4'h1},
	{4'h0, 4'h0, 4'h0},
	{4'h6, 4'h6, 4'h6},
	{4'h8, 4'h8, 4'h8},
	{4'hE, 4'hC, 4'hA},
	{4'hB, 4'h8, 4'h4},
	{4'h0, 4'h0, 4'h2},
	{4'h8, 4'h4, 4'h2},
	{4'hE, 4'h7, 4'h2},
	{4'h4, 4'h0, 4'h0}
};

assign {red, green, blue} = palette[index];

endmodule



module enemy_4_palette (
	input logic [3:0] index,
	output logic [3:0] red, green, blue
);

localparam [0:15][11:0] palette = {
	{4'h0, 4'h0, 4'h0},
	{4'h7, 4'hA, 4'hF},
	{4'hD, 4'hE, 4'hF},
	{4'h3, 4'h4, 4'h5},
	{4'h2, 4'h3, 4'hC},
	{4'hB, 4'hC, 4'hF},
	{4'h2, 4'h2, 4'h3},
	{4'h6, 4'h7, 4'h9},
	{4'hB, 4'hC, 4'hD},
	{4'h4, 4'h6, 4'hD},
	{4'h9, 4'hB, 4'hF},
	{4'h6, 4'h9, 4'hD},
	{4'h0, 4'h1, 4'h1},
	{4'h5, 4'h6, 4'h7},
	{4'h1, 4'h1, 4'hA},
	{4'h9, 4'hA, 4'hD}
};

assign {red, green, blue} = palette[index];

endmodule
