module zelda_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./zelda/zelda.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module zelda_right_2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./zelda_right_2/zelda_right_2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module Final_background_rom (
	input logic clock,
	input logic [17:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:249999] /* synthesis ram_init_file = "./Final_background/Final_background.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
	
end

endmodule




module up1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./up1/up1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule





module final_down1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./final_down1/final_down1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module final_right1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./final_right1/final_right1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module final_final_sprite_left_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./final_final_sprite_left/final_final_sprite_left.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule





module final_final_right_sprite_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./final_final_right_sprite/final_final_right_sprite.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module final_left2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./final_left2/final_left2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module final_up2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./final_up2/final_up2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module final_down2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./final_down2/final_down2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module aleena_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./aleena/aleena.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module sword_right_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_right_1/sword_right_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module sword_right_2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_right_2/sword_right_2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule





module sword_right_3_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_right_3/sword_right_3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module sword_right_4_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_right_4/sword_right_4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module sword_up_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_up_1/sword_up_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule







module sword_up_2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_up_2/sword_up_2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module sword_up_3_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_up_3/sword_up_3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module sword_up_4_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_up_4/sword_up_4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module sword_down_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_down_1/sword_down_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module sword_down_2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_down_2/sword_down_2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module sword_down_3_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_down_3/sword_down_3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module sword_down_4_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_down_4/sword_down_4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule

module sword_left_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_left_1/sword_left_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module sword_left_2_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_left_2/sword_left_2.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule



module sword_left_3_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_left_3/sword_left_3.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module sword_left_4_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./sword_left_4/sword_left_4.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule
module enemy_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./enemy_1/enemy_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module knight_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./knight_1/knight_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


module professor_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [2:0] q
);

logic [2:0] memory [0:1023] /* synthesis ram_init_file = "./professor/professor.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule


