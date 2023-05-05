module control(
	input logic vga_clk,
	input logic Reset,
	input logic [7:0] keycode,
	input logic [9:0] DrawX, DrawY,
	input logic [1:0] color_main,
	output logic [3:0] red, green, blue,
	output logic [5:0] final_background_red, final_background_green, final_background_blue,
	output logic [9:0] BallXCenter, BallYCenter //changed this
	);
	
	
	enum logic [2:0] {  Start,
							Main,
							Menu,
							Left,
							Right,
							Up
							}   State, Next_state;
							
							
		
	always_ff @ (posedge vga_clk or posedge Reset)
	begin
		if (Reset) 
			State <= Start;
		else 
			State <= Next_state;
	end
	
	
	always_ff @ (posedge vga_clk)
	begin
	// Default next state is staying at current state
	Next_state = State;
	// Default controls signal values
	red = title_red;
	green = title_green;
	blue = title_blue;
	BallXCenter = 645;
	BallYCenter = 490;
	unique case (State)
		Start :
			if(keycode == 8'h28) 
				Next_state = Main;
		Main :
			Next_state = Menu;
	
		Menu :
			case(color_main)
				2'b01:
					Next_state = Left;
				2'b10:
					Next_state = Right;
				2'b11:
					Next_state = Up;
				default:
					Next_state = Menu;
			endcase
			
		Left: 
			if(color_main != 2'b01)
				Next_state = Menu;
		
		Right:
			if(color_main != 2'b10)
				Next_state = Menu;
		Up:
			if(color_main != 2'b11)
				Next_state = Menu;
				
		default: ;
			
	endcase
	
	
	
	case (State)
		Start: 
			begin
				red = title_red;
				green = title_green;
				blue = title_blue;
				BallXCenter = 645;
				BallYCenter = 490;
			end
		Main:
			begin 
				red = final_background_red;
				blue = final_background_green;
				green = final_background_blue;
				BallXCenter = 320;
				BallYCenter = 240;
			end
		Menu: 
			begin 
				red = final_background_red;
				blue = final_background_green;
				green = final_background_blue;
				BallXCenter = 320;
				BallYCenter = 240;
			end
		Left:
			begin
				red = left_map_red;
				blue = left_map_green;
				green = left_map_blue;
				BallXCenter = 320;
				BallYCenter = 240;
			end
		Right:
			begin
				red = right_map_red;
				blue = right_map_green;
				green = right_map_blue;
				BallXCenter = 320;
				BallYCenter = 240;
			end
		Up:
			begin
				red = background_2_red;
				blue = background_2_green;
				green = background_2_blue;
				BallXCenter = 320;
				BallYCenter = 240;
			end
	default: ;
	
	endcase
end
	
	


/////////////////////////////////////////////////////////////////////////
logic [15:0] title_address;
logic [5:0] title_q;
logic [3:0] title_red, title_green, title_blue;
assign title_address = ((DrawX * 225) / 640) + (((DrawY * 225) / 480) * 225);
///////////////////////////////////////////////////////////////////////////


	
/////////////////////////////////////////////////////////////////////////
logic [17:0] background_2_address;
logic [5:0] background_2_q;
logic [3:0] background_2_red, background_2_green, background_2_blue;
assign background_2_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);
///////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////
logic [15:0] final_background_address;
logic [4:0] final_background_q;
//logic [3:0] final_background_red, final_background_green, final_background_blue;
assign final_background_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);
///////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////
logic [17:0] left_map_address;
logic [5:0] left_map_q;
logic [3:0] left_map_red, left_map_green, left_map_blue;
assign left_map_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);
///////////////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////////////
logic [17:0] right_map_address;
logic [5:0] right_map_q;
logic [3:0] right_map_red, right_map_green, right_map_blue;
assign right_map_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);
///////////////////////////////////////////////////////////////////////////








background_2_rom background_2_rom0 (
	.clock   (vga_clk),
	.address (background_2_address),
	.q       (background_2_q)
);

background_2_palette background_2_palette0 (
	.index (background_2_q),
	.red   (background_2_red),
	.green (background_2_green),
	.blue  (background_2_blue)
);



Final_background_rom final_background_rom (
	.clock   (vga_clk),
	.address (final_background_address),
	.q       (final_background_q)
);

Final_background_palette final_background_palette (
	.index (final_background_q),
	.red   (final_background_red),
	.green (final_background_green),
	.blue  (final_background_blue)
);




title_rom title_rom (
	.clock   (vga_clk),
	.address (title_address),
	.q       (title_q)
);

title_palette title_palette (
	.index (title_q),
	.red   (title_red),
	.green (title_green),
	.blue  (title_blue)
);


left_map_rom left_map_rom (
	.clock   (vga_clk),
	.address (left_map_address),
	.q       (left_map_q)
);

left_map_palette left_map_palette (
	.index (left_map_q),
	.red   (left_map_red),
	.green (left_map_green),
	.blue  (left_map_blue)
);



right_map_rom right_map_rom (
	.clock   (vga_clk),
	.address (right_map_address),
	.q       (right_map_q)
);

right_map_palette right_map_palette (
	.index (right_map_q),
	.red   (right_map_red),
	.green (right_map_green),
	.blue  (right_map_blue)
);






	
endmodule 