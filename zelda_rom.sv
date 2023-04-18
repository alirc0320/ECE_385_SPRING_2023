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


module background_rom (
	input logic clock,
	input logic [17:0] address,
	output logic [4:0] q
);

logic [4:0] memory [0:249999] /* synthesis ram_init_file = "./background/background.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module zelda_right_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./zelda_right_1/zelda_right_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule




module zelda_up_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
	
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./zelda_up_1/zelda_up_1.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
end

endmodule











module zelda_left_1_rom (
	input logic clock,
	input logic [9:0] address,
	output logic [3:0] q
);

logic [3:0] memory [0:1023] /* synthesis ram_init_file = "./zelda_left_1/zelda_left_1.mif" */;

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






module background_collision_rom (
	input logic clock,
	input logic [17:0] address,
	output logic [3:0] q,
	
	
	output logic [3:0] q_collision,
	input logic [17:0] collision_address
);

logic [3:0] memory [0:249999] /* synthesis ram_init_file = "./background_collision/background_collision.mif" */;

always_ff @ (posedge clock) begin
	q <= memory[address];
	q_collision <= memory[collision_address]; //added
end

endmodule



