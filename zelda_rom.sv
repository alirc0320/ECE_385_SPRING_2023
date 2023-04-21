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






