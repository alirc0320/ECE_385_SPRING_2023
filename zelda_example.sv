module zelda_example (
	input logic [9:0] DrawX, DrawY, spriteX, spriteY, sprite_size, //added spriteX, spriteY, sprite_size
	input logic [9:0] DrawX_enemy, DrawY_enemy, enemy_X, enemy_Y, enemy_size, //added for enemy 
	input logic [9:0] DrawX_enemy1, DrawY_enemy1, enemy_X1, enemy_Y1, enemy_size1,
	input logic [9:0] DrawX_enemy2, DrawY_enemy2, enemy_X2, enemy_Y2, enemy_size2,
	input [7:0] keycode, 
	input Reset,
	input [32:0] color_main,
	input logic vga_clk, blank,
   output logic [3:0] red, green, blue, // ouput
	output logic collision,
	output logic dead, 
	output logic flag_for_dying,
	output logic sword_collision,
	output logic enemy_dead_flag,
	output logic enemy1_dead_flag,
	output logic enemy2_dead_flag,
	output logic enemy4_dead_flag,
	output logic pedro,
	output logic positionX, positionY,
	output logic right_map_so_link_should_reposition,
	output logic [32:0] first_map_flag,
	output logic [32:0] second_map_flag,
//	output logic [32:0] link_position,
//	output logic [32:0] link_position_Y,
	output logic [3:0] red_debug, green_debug, blue_debug,
	output logic debugger,
 output logic everyone_is_dead,
 input logic debug_enemy_dead,
 input logic debug_enemy_dead_2,
 input logic debug_enemy_dead_3,
	
	output logic [32:0] they_all_dead
			
);

logic [10:0] rom_address;
logic [9:0]  right_1_rom_address;
//logic [9:0]  up_1_rom_address; 
logic [17:0]  bc_2_rom_address; 
logic [9:0]  left_1_rom_address;
logic [9:0]  zelda_right_2_rom_address;
logic [17:0] background_col_rom_address;
logic [17:0] final_bc_address;
logic pink;
logic link_should_not_be_on_title_screen;


/////////////////////////////////////////////////////////////////
logic [9:0]  up1_address;
logic [3:0]  up1_q;
logic [3:0]  up1_red, up1_green, up1_blue;
assign up1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
logic [9:0]  down1_address;
logic [3:0]  down1_q;
logic [3:0]  down1_red, down1_green, down1_blue;
assign down1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
logic [9:0]  right1_address;
logic [3:0]  right1_q;
logic [3:0]  right1_red, right1_green, right1_blue;
assign right1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
logic [9:0]  left1_address;
logic [3:0]  left1_q;
logic [3:0]  left1_red, left1_green, left1_blue;
assign left1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
logic [9:0]  left2_address;
logic [3:0]  left2_q;
logic [3:0]  left2_red, left2_green, left2_blue;
assign left2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
logic [9:0]  final_up2_address;
logic [3:0]  final_up2_q;
logic [3:0]  final_up2_red, final_up2_green, final_up2_blue;
assign final_up2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////
logic [9:0]  final_down2_address;
logic [3:0]  final_down2_q;
logic [3:0]  final_down2_red, final_down2_green, final_down2_blue;
assign final_down2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
logic [9:0]  final_right2_address;
logic [3:0]  final_right2_q;
logic [3:0]  final_right2_red, final_right2_green, final_right2_blue;
assign final_right2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_right1_address;
logic [3:0]  sword_right1_q;
logic [3:0]  sword_right1_red, sword_right1_green, sword_right1_blue;
assign sword_right1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_right2_address;
logic [3:0]  sword_right2_q;
logic [3:0]  sword_right2_red, sword_right2_green, sword_right2_blue;
assign sword_right2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_right3_address;
logic [3:0]  sword_right3_q;
logic [3:0]  sword_right3_red, sword_right3_green, sword_right3_blue;
assign sword_right3_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_right4_address;
logic [3:0]  sword_right4_q;
logic [3:0]  sword_right4_red, sword_right4_green, sword_right4_blue;
assign sword_right4_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_up1_address;
logic [3:0]  sword_up1_q;
logic [3:0]  sword_up1_red, sword_up1_green, sword_up1_blue;
assign sword_up1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_up2_address;
logic [3:0]  sword_up2_q;
logic [3:0]  sword_up2_red, sword_up2_green, sword_up2_blue;
assign sword_up2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_up3_address;
logic [3:0]  sword_up3_q;
logic [3:0]  sword_up3_red, sword_up3_green, sword_up3_blue;
assign sword_up3_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_up4_address;
logic [3:0]  sword_up4_q;
logic [3:0]  sword_up4_red, sword_up4_green, sword_up4_blue;
assign sword_up4_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////
logic [9:0]  sword_down1_address;
logic [3:0]  sword_down1_q;
logic [3:0]  sword_down1_red, sword_down1_green, sword_down1_blue;
assign sword_down1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_down2_address;
logic [3:0]  sword_down2_q;
logic [3:0]  sword_down2_red, sword_down2_green, sword_down2_blue;
assign sword_down2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_down3_address;
logic [3:0]  sword_down3_q;
logic [3:0]  sword_down3_red, sword_down3_green, sword_down3_blue;
assign sword_down3_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_down4_address;
logic [3:0]  sword_down4_q;
logic [3:0]  sword_down4_red, sword_down4_green, sword_down4_blue;
assign sword_down4_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
logic [9:0]  sword_left1_address;
logic [3:0]  sword_left1_q;
logic [3:0]  sword_left1_red, sword_left1_green, sword_left1_blue;
assign sword_left1_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_left2_address;
logic [3:0]  sword_left2_q;
logic [3:0]  sword_left2_red, sword_left2_green, sword_left2_blue;
assign sword_left2_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_left3_address;
logic [3:0]  sword_left3_q;
logic [3:0]  sword_left3_red, sword_left3_green, sword_left3_blue;
assign sword_left3_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////




/////////////////////////////////////////////////////////////////
logic [9:0]  sword_left4_address;
logic [3:0]  sword_left4_q;
logic [3:0]  sword_left4_red, sword_left4_green, sword_left4_blue;
assign sword_left4_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
///////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////


logic [9:0]DistX_enemy, DistY_enemy;
logic [9:0] enemy_1_address;
logic [3:0] enemy_1_q;
logic [3:0] enemy1_red, enemy1_green, enemy1_blue;
assign DistX_enemy = DrawX - enemy_X;
assign DistY_enemy = DrawY - enemy_Y;
assign enemy_1_address = ((DrawX-enemy_X) + (DrawY-enemy_Y)*32); 



////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////
logic [9:0]DistX_enemy1, DistY_enemy1;
logic [9:0] enemy_2_address;
logic [3:0] enemy_2_q;
logic [3:0] enemy2_red, enemy2_green, enemy2_blue;
assign DistX_enemy1 = DrawX - enemy_X1;
assign DistY_enemy1 = DrawY - enemy_Y1;
assign enemy_2_address = ((DrawX-enemy_X1) + (DrawY-enemy_Y1)*32); 
///////////////////////////////////////////////////////////






///////////////////////////////////////////////////////////////
logic [9:0]DistX_enemy2, DistY_enemy2;
logic [10:0] enemy_3_address;
logic [4:0] enemy_3_q;
logic [3:0] enemy3_red, enemy3_green, enemy3_blue;
assign DistX_enemy2 = DrawX - enemy_X2;
assign DistY_enemy2 = DrawY - enemy_Y2;
assign enemy_3_address = ((DrawX-enemy_X2) + (DrawY-enemy_Y2)*32); 
///////////////////////////////////////////////////////////








/////////////////////////////////////////////////////////////////////////
logic [17:0] background_2_address;
logic [5:0] background_2_q;
logic [3:0] background_2_red, background_2_green, background_2_blue;
assign background_2_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);
///////////////////////////////////////////////////////////////////////////






/////////////////////////////////////////////////////////////////////////
logic [15:0] title_address;
logic [4:0] title_q;
logic [3:0] title_red, title_green, title_blue;
assign title_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200);
///////////////////////////////////////////////////////////////////////////

















/////////////////////////////////////////////////////////////////////////////////////////////////////////
logic [6:0] rom_q;
logic [3:0] right_1_rom_q;
logic [3:0] bc_2_rom_q;
logic [3:0] left_1_rom_q;
logic [3:0] zelda_right_2_rom_q;
logic [6:0] background_col_rom_q;
logic [6:0] final_bc_q;
logic [3:0] palette_red, palette_green, palette_blue;
logic [3:0] right_1_palette_red, right_1_palette_green, right_1_palette_blue;
logic [3:0] left_1_palette_red, left_1_palette_green, left_1_palette_blue;
logic [3:0] zelda_right_2_palette_red, zelda_right_2_palette_green, zelda_right_2_palette_blue;
logic [3:0] bc_red, bc_green, bc_blue;
logic [3:0] bc_red1, bc_green1, bc_blue1;
logic [3:0] final_bc_red, final_bc_green, final_bc_blue;
assign rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign right_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign left_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign zelda_right_2_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign final_bc_address = ((DrawX * 200) / 640) + (((DrawY * 200) / 480) * 200); 
logic sprite_on;
logic up, right, down, left;
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
logic [9:0]DistX, DistY, Size;
assign DistX = DrawX - spriteX;
assign DistY = DrawY - spriteY;

enum logic [6:0] { not_moving, not_movingdown,not_movingup, not_movingright, not_movingleft,
 s_upone, s_uptwo, s_upthree, s_upfour,
						 s_downone, s_downtwo, s_downthree, s_downfour,
						 s_leftone, s_lefttwo, s_leftthree, s_leftfour,
						 s_rightone, s_righttwo, s_rightthree, s_rightfour,
						 sword_right1,
					sword_right2,
					sword_right3, sword_right4, 
						 sword_right5, 
						sword_right6, sword_right7, sword_right8,
						sword_up1,
					sword_up2,
					sword_up3, sword_up4, 
						 sword_up5, 
						sword_up6, sword_up7, sword_up8,
						sword_down1,
					sword_down2,
					sword_down3, sword_down4, 
						 sword_down5, 
						sword_down6, sword_down7, sword_down8,
						sword_left1,
					sword_left2,
					sword_left3, sword_left4, 
						 sword_left5, 
						sword_left6, sword_left7, sword_left8
						 } cur_state, next_state;
						 
						 
reg [31:0] count;

logic flag;




// similar to guard_control module set up
always@(posedge vga_clk)
begin
	
	if(flag) 
		count <= 0;
	
	else
		count <= count + 1;
end


always_ff @ (posedge vga_clk or posedge Reset)
begin

	if (Reset)
	begin
		cur_state <= not_moving;
		flag <= 1'b0;
	end
	
	else if(dead == 1)
	begin
		cur_state <= not_moving;
		flag <= 1'b0;
	end
	
	else if (count > 1200000)//100000
	begin
		cur_state <= next_state;
		flag <= 1'b1;
	end
	
	else
		flag <= 1'b0;		
end	





///////////////////////new

	enum logic [2:0] {  Start,
							Main,
							Menu,
							Left,
							Right,
							Boss
							}   State, Next_state;
							
							
		
	always_ff @ (posedge vga_clk or posedge Reset)
	begin
		if (Reset) 
			State <= Start;
		else 
			State <= Next_state;
	end

////////////////////////new



































always_ff @ (posedge vga_clk)

begin
//
//red <= 4'h0; //default black 
//	green <= 4'h0; //default black 
//	blue <= 4'h0; //default black 
//	if (DrawX == 0 && DrawY == 0)
//		collision <= 0;	
////stop deleting
//	
//	if(blank)
//	begin
//		   red <= final_bc_red;
//			green <= final_bc_green;
//			blue <= final_bc_blue; 
//	end

 if(debug_enemy_dead == 1 && debug_enemy_dead_2 == 1 && debug_enemy_dead_3 == 1)
 everyone_is_dead = 1;
 else
 everyone_is_dead = 0;






	// Default next state is staying at current state
	Next_state = State;
	// Default controls signal values
	red = 0;
	green = 0;
	blue = 0;
	 
//	BallXCenter = 645;
//	BallYCenter = 490;
	unique case (State)
		Start :
			if(keycode == 8'h28) 
			  
			 begin
			 pedro <=1;
				Next_state = Main;
				end
				
		Main :
			begin
			Next_state = Menu;
			pedro <=1;
	end
		Menu :
			if(color_main == 8'h0A)
			begin
					Next_state = Right;
					pedro <= 1;
			end
				
				else
				begin
					Next_state = Menu;
					pedro <= 1;
				end
			
	
		
		Right:
		 
			if(color_main != 8'h0A)
				Next_state = Menu;
			else 
			begin
				Next_state = Right;
				pedro <= 1;
				end
		
				
		default: ;
			
	endcase
	
	case (State)
		Start: 
			begin
			link_should_not_be_on_title_screen = 0; 
			if(blank)
			begin
				red = title_red;
				green = title_green;
				blue = title_blue;
				
				end
				end
//				BallXCenter = 645;
//				BallYCenter = 490;
			
		Main:
			begin 
//			link_position = 320;
//			link_position_Y = 240;	
			link_should_not_be_on_title_screen = 1;
		right_map_so_link_should_reposition = 0;	
			first_map_flag = 2'b01;
			second_map_flag = 2'b11;
			if(blank)
			begin
				red = final_bc_red;
				green = final_bc_green;
				blue = final_bc_blue;
				end
				
				
	
if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
begin
if(blank)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
end

	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
begin
if(blank)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
end
				
				if(first_map_flag == 2'b01)
			if (DistX_enemy2-3 < enemy_size2 && DistY_enemy2 - 3 < enemy_size2)
if(enemy3_red != 4'hF && enemy3_green != 4'h6 && enemy3_blue != 4'hB)
//if(enemy3_red != 4'hF && enemy3_green != 4'hD && enemy3_blue != 4'hC)
	//if(enemy_dead_flag != 1)
	begin
	
	red <= enemy3_red;
	green <= enemy3_green;
	blue <= enemy3_blue;
	end 	
	
	
	if(first_map_flag == 2'b01)
	if (DistX_enemy1-3 < enemy_size1 && DistY_enemy1 - 3 < enemy_size1)
if(enemy2_red != 4'h0 && enemy2_green != 4'h0 && enemy2_blue != 4'h0)
	//if(enemy_dead_flag != 1)
	begin
	
	red <= enemy2_red;
	green <= enemy2_green;
	blue <= enemy2_blue;
	end 
	
	if(first_map_flag == 2'b01)
if (DistX_enemy-3 < enemy_size && DistY_enemy - 3 < enemy_size)
if(enemy1_red != 4'hF && enemy1_green != 4'hF && enemy1_blue != 4'hF)	
	begin
	red <= enemy1_red;
	green <= enemy1_green;
	blue <= enemy1_blue;
	end 
	
else if(enemy_dead_flag == 1)
begin
red <= final_bc_red;
	green <= final_bc_green;
	blue <= final_bc_blue;
	end

				
				end
//				BallXCenter = 320;
//				BallYCenter = 240;
			
		Menu: 
			begin 
//			link_position = 320;
//			link_position_Y = 240;	
			link_should_not_be_on_title_screen = 1;
		right_map_so_link_should_reposition = 0;		
			first_map_flag = 2'b01; 
			second_map_flag = 2'b11;
			if(blank)
			begin
				red = final_bc_red;
				green = final_bc_green;
				blue = final_bc_blue;
			end
			
			
	
if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end

	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end


	
			if (DistX_enemy2-3 < enemy_size2 && DistY_enemy2 - 3 < enemy_size2)
if(enemy3_red != 4'hF && enemy3_green != 4'h6 && enemy3_blue != 4'hB)
//if(enemy3_red != 4'hF && enemy3_green != 4'hD && enemy3_blue != 4'hC)
	//if(enemy_dead_flag != 1)
	begin
	
	red <= enemy3_red;
	green <= enemy3_green;
	blue <= enemy3_blue;
	end 	
	
	if (DistX_enemy1-3 < enemy_size1 && DistY_enemy1 - 3 < enemy_size1)
if(enemy2_red != 4'h0 && enemy2_green != 4'h0 && enemy2_blue != 4'h0)
	//if(enemy_dead_flag != 1)
	begin
	
	red <= enemy2_red;
	green <= enemy2_green;
	blue <= enemy2_blue;
	end 
	
	
if (DistX_enemy-3 < enemy_size && DistY_enemy - 3 < enemy_size)
if(enemy1_red != 4'hF && enemy1_green != 4'hF && enemy1_blue != 4'hF)	
	begin
	red <= enemy1_red;
	green <= enemy1_green;
	blue <= enemy1_blue;
	end 
else if(enemy_dead_flag == 1)
begin
red <= final_bc_red;
	green <= final_bc_green;
	blue <= final_bc_blue;
	end
			
			
			end
		
		Right:
			begin
			
			
			right_map_so_link_should_reposition = 1;	
			first_map_flag = 2'b11;
			second_map_flag = 2'b01;
			if(blank)
			begin
				red = background_2_red;
				green = background_2_green;
				blue = background_2_blue;
				
end


	
if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
begin
if(blank)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
end



	
if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
begin
if(blank)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
end


	
if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
begin
if(blank)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
end



	
if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
begin
if(blank)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
end





				
				
				
				
				end
		
			
		
	
	
	default: ;
	
	endcase
	
	
	
	
////////////////NEW_ENEMY/////////////////////

// 

	
/////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
////////////////NEWER_ENEMY/////////////////////

//if (DistX_enemy2-3 < enemy_size2 && DistY_enemy2 - 3 < enemy_size2)
//if(enemy3_red != 4'hF && enemy3_green != 4'h6 && enemy3_blue != 4'hB)
////if(enemy3_red != 4'hF && enemy3_green != 4'hD && enemy3_blue != 4'hC)
//	//if(enemy_dead_flag != 1)
//	begin
//	
//	red <= enemy3_red;
//	green <= enemy3_green;
//	blue <= enemy3_blue;
//	end 

	
/////////////////////////////////////////////////////////////////////	
	
	
	
	
	
	
////////////////ENEMY/////////////////////
//
//if (DistX_enemy-3 < enemy_size && DistY_enemy - 3 < enemy_size)
//if(enemy1_red != 4'hF && enemy1_green != 4'hF && enemy1_blue != 4'hF)	
//	begin
//	red <= enemy1_red;
//	green <= enemy1_green;
//	blue <= enemy1_blue;
//	end 
//else if(enemy_dead_flag == 1)
//begin
//red <= final_bc_red;
//	green <= final_bc_green;
//	blue <= final_bc_blue;
//	end
/////////////////////////////////////////////////////////////////////	
	
	
	

	if(first_map_flag == 2'b01)
	if(sword_collision == 0)
	
if( 
((enemy_X == spriteX) && (enemy_Y == spriteY)) 
|| ((enemy_X + 4 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 8 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 2 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 6 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 8== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 10== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 12 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 14 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 16== spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 18 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 22== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 2 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 6 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 8== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 10== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 14== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 18== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 20 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 22== spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y + 4 == spriteY))
|| ((enemy_X + 8 == spriteX) && (enemy_Y + 8== spriteY))
|| ((enemy_X + 12 == spriteX) && (enemy_Y + 12== spriteY))
||((enemy_X + 16== spriteX) && (enemy_Y + 16== spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y+20  == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y + 24 == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y + 28== spriteY))
|| ((enemy_X + 2 == spriteX) && (enemy_Y + 2 == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y + 4== spriteY))
|| ((enemy_X + 6 == spriteX) && (enemy_Y + 6== spriteY))
||((enemy_X + 8== spriteX) && (enemy_Y + 8== spriteY))
||((enemy_X + 10== spriteX) && (enemy_Y+10  == spriteY))
||((enemy_X + 12 == spriteX) && (enemy_Y + 12 == spriteY))
||((enemy_X + 14== spriteX) && (enemy_Y + 14== spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y + 4== spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y + 8 == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y + 12== spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y +16 == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y +20== spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y +24== spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y +28== spriteY))
||((enemy_X - 2 == spriteX) && (enemy_Y + 2== spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y + 4 == spriteY))
||((enemy_X - 6 == spriteX) && (enemy_Y + 6== spriteY))
||((enemy_X - 8== spriteX) && (enemy_Y +8 == spriteY))
||((enemy_X - 10== spriteX) && (enemy_Y +10== spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y +12== spriteY))
||((enemy_X - 14== spriteX) && (enemy_Y +14== spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y - 4 == spriteY))
|| ((enemy_X + 8 == spriteX) && (enemy_Y - 8== spriteY))
|| ((enemy_X + 12 == spriteX) && (enemy_Y - 12== spriteY))
||((enemy_X + 16== spriteX) && (enemy_Y - 16== spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y-20  == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y - 24 == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y - 28== spriteY))
|| ((enemy_X + 2 == spriteX) && (enemy_Y - 2 == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y - 4== spriteY))
|| ((enemy_X + 6 == spriteX) && (enemy_Y - 6== spriteY))
||((enemy_X + 8== spriteX) && (enemy_Y - 8== spriteY))
||((enemy_X + 10== spriteX) && (enemy_Y-10  == spriteY))
||((enemy_X + 12 == spriteX) && (enemy_Y - 12 == spriteY))
||((enemy_X + 14== spriteX) && (enemy_Y - 14 == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y - 4== spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y - 8 == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y - 12== spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y -16 == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y -20== spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y -24== spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y -28== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 4 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +8  == spriteY))
||((enemy_X == spriteX) && (enemy_Y +12 == spriteY))
||((enemy_X== spriteX) && (enemy_Y + 16== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 20== spriteY))
||((enemy_X  == spriteX) && (enemy_Y +24 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +28 == spriteY))
||((enemy_X == spriteX) && (enemy_Y - 4 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -8  == spriteY))
||((enemy_X == spriteX) && (enemy_Y -12 == spriteY))
||((enemy_X== spriteX) && (enemy_Y -16== spriteY))
||((enemy_X == spriteX) && (enemy_Y - 20== spriteY))
||((enemy_X  == spriteX) && (enemy_Y -24 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -28 == spriteY))
||((enemy_X == spriteX) && (enemy_Y - 2 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -4  == spriteY))
||((enemy_X == spriteX) && (enemy_Y -6 == spriteY))
||((enemy_X== spriteX) && (enemy_Y -8== spriteY))
||((enemy_X == spriteX) && (enemy_Y - 10== spriteY))
||((enemy_X  == spriteX) && (enemy_Y -12 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -14 == spriteY))
||((enemy_X == spriteX) && (enemy_Y - 16 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -18  == spriteY))
||((enemy_X == spriteX) && (enemy_Y -20 == spriteY))
||((enemy_X== spriteX) && (enemy_Y -22== spriteY))
||((enemy_X == spriteX) && (enemy_Y - 24== spriteY))
||((enemy_X  == spriteX) && (enemy_Y -26 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -28 == spriteY))
||((enemy_X == spriteX) && (enemy_Y + 2 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +4  == spriteY))
||((enemy_X == spriteX) && (enemy_Y +6 == spriteY))
||((enemy_X== spriteX) && (enemy_Y + 8== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 10== spriteY))
||((enemy_X  == spriteX) && (enemy_Y +12 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +14== spriteY))
||((enemy_X== spriteX) && (enemy_Y + 16== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 18== spriteY))
||((enemy_X  == spriteX) && (enemy_Y +20 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +22== spriteY))

)
begin
flag_for_dying <= 1;
dead <= 1;
end
else 
begin
flag_for_dying<=0;
dead <= 0;
end

if(sword_collision)
	begin
	if( 
((enemy_X == spriteX) && (enemy_Y == spriteY)) 
|| ((enemy_X + 4 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 8 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 2 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 6 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 8== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 10== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 12 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 14 == spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 16== spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 18 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 22== spriteX) && (enemy_Y == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 2 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 6 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 8== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 10== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 14== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 18== spriteX) && (enemy_Y == spriteY))
||((enemy_X - 20 == spriteX) && (enemy_Y == spriteY))
||((enemy_X - 22== spriteX) && (enemy_Y == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y + 4 == spriteY))
|| ((enemy_X + 8 == spriteX) && (enemy_Y + 8== spriteY))
|| ((enemy_X + 12 == spriteX) && (enemy_Y + 12== spriteY))
||((enemy_X + 16== spriteX) && (enemy_Y + 16== spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y+20  == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y + 24 == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y + 28== spriteY))
|| ((enemy_X + 2 == spriteX) && (enemy_Y + 2 == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y + 4== spriteY))
|| ((enemy_X + 6 == spriteX) && (enemy_Y + 6== spriteY))
||((enemy_X + 8== spriteX) && (enemy_Y + 8== spriteY))
||((enemy_X + 10== spriteX) && (enemy_Y+10  == spriteY))
||((enemy_X + 12 == spriteX) && (enemy_Y + 12 == spriteY))
||((enemy_X + 14== spriteX) && (enemy_Y + 14== spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y + 4== spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y + 8 == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y + 12== spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y +16 == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y +20== spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y +24== spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y +28== spriteY))
||((enemy_X - 2 == spriteX) && (enemy_Y + 2== spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y + 4 == spriteY))
||((enemy_X - 6 == spriteX) && (enemy_Y + 6== spriteY))
||((enemy_X - 8== spriteX) && (enemy_Y +8 == spriteY))
||((enemy_X - 10== spriteX) && (enemy_Y +10== spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y +12== spriteY))
||((enemy_X - 14== spriteX) && (enemy_Y +14== spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y - 4 == spriteY))
|| ((enemy_X + 8 == spriteX) && (enemy_Y - 8== spriteY))
|| ((enemy_X + 12 == spriteX) && (enemy_Y - 12== spriteY))
||((enemy_X + 16== spriteX) && (enemy_Y - 16== spriteY))
||((enemy_X + 20== spriteX) && (enemy_Y-20  == spriteY))
||((enemy_X + 24 == spriteX) && (enemy_Y - 24 == spriteY))
||((enemy_X + 28== spriteX) && (enemy_Y - 28== spriteY))
|| ((enemy_X + 2 == spriteX) && (enemy_Y - 2 == spriteY))
|| ((enemy_X + 4 == spriteX) && (enemy_Y - 4== spriteY))
|| ((enemy_X + 6 == spriteX) && (enemy_Y - 6== spriteY))
||((enemy_X + 8== spriteX) && (enemy_Y - 8== spriteY))
||((enemy_X + 10== spriteX) && (enemy_Y-10  == spriteY))
||((enemy_X + 12 == spriteX) && (enemy_Y - 12 == spriteY))
||((enemy_X + 14== spriteX) && (enemy_Y - 14 == spriteY))
||((enemy_X - 4 == spriteX) && (enemy_Y - 4== spriteY))
||((enemy_X - 8 == spriteX) && (enemy_Y - 8 == spriteY))
||((enemy_X - 12 == spriteX) && (enemy_Y - 12== spriteY))
||((enemy_X - 16== spriteX) && (enemy_Y -16 == spriteY))
||((enemy_X - 20== spriteX) && (enemy_Y -20== spriteY))
||((enemy_X - 24 == spriteX) && (enemy_Y -24== spriteY))
||((enemy_X - 28== spriteX) && (enemy_Y -28== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 4 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +8  == spriteY))
||((enemy_X == spriteX) && (enemy_Y +12 == spriteY))
||((enemy_X== spriteX) && (enemy_Y + 16== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 20== spriteY))
||((enemy_X  == spriteX) && (enemy_Y +24 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +28 == spriteY))
||((enemy_X == spriteX) && (enemy_Y - 4 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -8  == spriteY))
||((enemy_X == spriteX) && (enemy_Y -12 == spriteY))
||((enemy_X== spriteX) && (enemy_Y -16== spriteY))
||((enemy_X == spriteX) && (enemy_Y - 20== spriteY))
||((enemy_X  == spriteX) && (enemy_Y -24 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -28 == spriteY))
||((enemy_X == spriteX) && (enemy_Y - 2 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -4  == spriteY))
||((enemy_X == spriteX) && (enemy_Y -6 == spriteY))
||((enemy_X== spriteX) && (enemy_Y -8== spriteY))
||((enemy_X == spriteX) && (enemy_Y - 10== spriteY))
||((enemy_X  == spriteX) && (enemy_Y -12 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -14 == spriteY))
||((enemy_X == spriteX) && (enemy_Y - 16 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -18  == spriteY))
||((enemy_X == spriteX) && (enemy_Y -20 == spriteY))
||((enemy_X== spriteX) && (enemy_Y -22== spriteY))
||((enemy_X == spriteX) && (enemy_Y - 24== spriteY))
||((enemy_X  == spriteX) && (enemy_Y -26 == spriteY))
||((enemy_X == spriteX) && (enemy_Y -28 == spriteY))
||((enemy_X == spriteX) && (enemy_Y + 2 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +4  == spriteY))
||((enemy_X == spriteX) && (enemy_Y +6 == spriteY))
||((enemy_X== spriteX) && (enemy_Y + 8== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 10== spriteY))
||((enemy_X  == spriteX) && (enemy_Y +12 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +14== spriteY))
||((enemy_X== spriteX) && (enemy_Y + 16== spriteY))
||((enemy_X == spriteX) && (enemy_Y + 18== spriteY))
||((enemy_X  == spriteX) && (enemy_Y +20 == spriteY))
||((enemy_X == spriteX) && (enemy_Y +22== spriteY))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 2))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 4))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 6))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 8))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 10))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 12))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 14))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 16))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 18))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 20))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 22))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 24))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 26))
||((enemy_X == spriteX) && (enemy_Y == spriteY - 28))
||((enemy_X == spriteX) && (enemy_Y == spriteY  + 2))
||((enemy_X == spriteX) && (enemy_Y == spriteY +  4))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 6))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 8))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 10))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 12))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 14))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 16))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 18))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 20))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 22))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 24))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 26))
||((enemy_X == spriteX) && (enemy_Y == spriteY + 28))
||((enemy_X + 2 == spriteX) && (enemy_Y == spriteY - 2))
||((enemy_X +2 == spriteX) && (enemy_Y == spriteY - 4))
||((enemy_X + 2 == spriteX) && (enemy_Y == spriteY - 6))
||((enemy_X + 2 == spriteX) && (enemy_Y == spriteY - 8))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY - 10))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY - 12))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY - 14))
||((enemy_X + 2 == spriteX) && (enemy_Y == spriteY - 16))
||((enemy_X + 2 == spriteX) && (enemy_Y == spriteY - 18))
||((enemy_X + 2 == spriteX) && (enemy_Y == spriteY - 20))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY - 22))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY - 24))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY - 26))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY - 28))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY  + 2))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY +  4))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 6))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 8))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY + 10))
||((enemy_X + 2== spriteX) && (enemy_Y == spriteY + 12))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 14))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 16))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 18))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 20))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 22))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 24))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 26))
||((enemy_X+ 2 == spriteX) && (enemy_Y == spriteY + 28))
||((enemy_X + 4 == spriteX) && (enemy_Y == spriteY - 2))
||((enemy_X +4 == spriteX) && (enemy_Y == spriteY - 4))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY - 6))
||((enemy_X + 4 == spriteX) && (enemy_Y == spriteY - 8))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY - 10))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY - 12))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY - 14))
||((enemy_X + 4 == spriteX) && (enemy_Y == spriteY - 16))
||((enemy_X + 4 == spriteX) && (enemy_Y == spriteY - 18))
||((enemy_X + 4 == spriteX) && (enemy_Y == spriteY - 20))
||((enemy_X+ 4== spriteX) && (enemy_Y == spriteY - 22))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY - 24))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY - 26))
||((enemy_X+ 4== spriteX) && (enemy_Y == spriteY - 28))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY  + 2))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY +  4))
||((enemy_X+ 4== spriteX) && (enemy_Y == spriteY + 6))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 8))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY + 10))
||((enemy_X + 4== spriteX) && (enemy_Y == spriteY + 12))
||((enemy_X+ 4== spriteX) && (enemy_Y == spriteY + 14))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 16))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 18))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 20))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 22))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 24))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 26))
||((enemy_X+ 4 == spriteX) && (enemy_Y == spriteY + 28))
||((enemy_X + 6 == spriteX) && (enemy_Y == spriteY - 2))
||((enemy_X +6== spriteX) && (enemy_Y == spriteY - 4))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY - 6))
||((enemy_X + 6 == spriteX) && (enemy_Y == spriteY - 8))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY - 10))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY - 12))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY - 14))
||((enemy_X + 6 == spriteX) && (enemy_Y == spriteY - 16))
||((enemy_X + 6 == spriteX) && (enemy_Y == spriteY - 18))
||((enemy_X + 6 == spriteX) && (enemy_Y == spriteY - 20))
||((enemy_X+ 6== spriteX) && (enemy_Y == spriteY - 22))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY - 24))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY - 26))
||((enemy_X+ 6== spriteX) && (enemy_Y == spriteY - 28))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY  + 2))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY +  4))
||((enemy_X+ 6== spriteX) && (enemy_Y == spriteY + 6))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 8))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY + 10))
||((enemy_X + 6== spriteX) && (enemy_Y == spriteY + 12))
||((enemy_X+ 6== spriteX) && (enemy_Y == spriteY + 14))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 16))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 18))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 20))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 22))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 24))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 26))
||((enemy_X+ 6 == spriteX) && (enemy_Y == spriteY + 28))


)
begin
enemy_dead_flag = 1; 

end
else  
//enemy_dead_flag = 0;


enemy_dead_flag = 0;
	end
		
//////////////////////////////////////////////

	
	if(first_map_flag == 2'b01)
	if(sword_collision == 0)
	
if( 
((enemy_X1 == spriteX) && (enemy_Y1 == spriteY)) 
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 8 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 8== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 10== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 12 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 14 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 16== spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 18 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 22== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 2 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 6 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 8== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 10== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 14== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 18== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 20 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 22== spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 + 4 == spriteY))
|| ((enemy_X1 + 8 == spriteX) && (enemy_Y1 + 8== spriteY))
|| ((enemy_X1 + 12 == spriteX) && (enemy_Y1 + 12== spriteY))
||((enemy_X1 + 16== spriteX) && (enemy_Y1 + 16== spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1+20  == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 + 24 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 + 28== spriteY))
|| ((enemy_X1 + 2 == spriteX) && (enemy_Y1 + 2 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 + 4== spriteY))
|| ((enemy_X1 + 6 == spriteX) && (enemy_Y1 + 6== spriteY))
||((enemy_X1 + 8== spriteX) && (enemy_Y1 + 8== spriteY))
||((enemy_X1 + 10== spriteX) && (enemy_Y1+10  == spriteY))
||((enemy_X1 + 12 == spriteX) && (enemy_Y1 + 12 == spriteY))
||((enemy_X1 + 14== spriteX) && (enemy_Y1 + 14== spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 + 4== spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 + 8 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 + 12== spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 +16 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 +20== spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 +24== spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 +28== spriteY))
||((enemy_X1 - 2 == spriteX) && (enemy_Y1 + 2== spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 + 4 == spriteY))
||((enemy_X1 - 6 == spriteX) && (enemy_Y1 + 6== spriteY))
||((enemy_X1 - 8== spriteX) && (enemy_Y1 +8 == spriteY))
||((enemy_X1 - 10== spriteX) && (enemy_Y1 +10== spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 +12== spriteY))
||((enemy_X1 - 14== spriteX) && (enemy_Y1 +14== spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 - 4 == spriteY))
|| ((enemy_X1 + 8 == spriteX) && (enemy_Y1 - 8== spriteY))
|| ((enemy_X1 + 12 == spriteX) && (enemy_Y1 - 12== spriteY))
||((enemy_X1 + 16== spriteX) && (enemy_Y1 - 16== spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1-20  == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 - 24 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 - 28== spriteY))
|| ((enemy_X1 + 2 == spriteX) && (enemy_Y1 - 2 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 - 4== spriteY))
|| ((enemy_X1 + 6 == spriteX) && (enemy_Y1 - 6== spriteY))
||((enemy_X1 + 8== spriteX) && (enemy_Y1 - 8== spriteY))
||((enemy_X1 + 10== spriteX) && (enemy_Y1-10  == spriteY))
||((enemy_X1 + 12 == spriteX) && (enemy_Y1 - 12 == spriteY))
||((enemy_X1 + 14== spriteX) && (enemy_Y1 - 14 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 - 4== spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 - 8 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 - 12== spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 -16 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 -20== spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 -24== spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 -28== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 4 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +8  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +12 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 + 16== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 20== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 +24 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +28 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 4 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -8  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -12 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 -16== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 20== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 -24 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -28 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 2 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -4  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -6 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 -8== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 10== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 -12 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -14 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 16 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -18  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -20 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 -22== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 24== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 -26 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -28 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 2 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +4  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +6 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 + 8== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 10== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 +12 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +14== spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 + 16== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 18== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 +20 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +22== spriteY))

)
begin
flag_for_dying <= 1;
dead <= 1;
end
else 
begin
flag_for_dying<=0;
//dead <= 0;
end

if(sword_collision)
	begin
	if( 
((enemy_X1 == spriteX) && (enemy_Y1 == spriteY)) 
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 8 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 8== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 10== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 12 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 14 == spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 16== spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 18 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 22== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 2 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 6 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 8== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 10== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 14== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 18== spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 20 == spriteX) && (enemy_Y1 == spriteY))
||((enemy_X1 - 22== spriteX) && (enemy_Y1 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 + 4 == spriteY))
|| ((enemy_X1 + 8 == spriteX) && (enemy_Y1 + 8== spriteY))
|| ((enemy_X1 + 12 == spriteX) && (enemy_Y1 + 12== spriteY))
||((enemy_X1 + 16== spriteX) && (enemy_Y1 + 16== spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1+20  == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 + 24 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 + 28== spriteY))
|| ((enemy_X1 + 2 == spriteX) && (enemy_Y1 + 2 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 + 4== spriteY))
|| ((enemy_X1 + 6 == spriteX) && (enemy_Y1 + 6== spriteY))
||((enemy_X1 + 8== spriteX) && (enemy_Y1 + 8== spriteY))
||((enemy_X1 + 10== spriteX) && (enemy_Y1+10  == spriteY))
||((enemy_X1 + 12 == spriteX) && (enemy_Y1 + 12 == spriteY))
||((enemy_X1 + 14== spriteX) && (enemy_Y1 + 14== spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 + 4== spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 + 8 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 + 12== spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 +16 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 +20== spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 +24== spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 +28== spriteY))
||((enemy_X1 - 2 == spriteX) && (enemy_Y1 + 2== spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 + 4 == spriteY))
||((enemy_X1 - 6 == spriteX) && (enemy_Y1 + 6== spriteY))
||((enemy_X1 - 8== spriteX) && (enemy_Y1 +8 == spriteY))
||((enemy_X1 - 10== spriteX) && (enemy_Y1 +10== spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 +12== spriteY))
||((enemy_X1 - 14== spriteX) && (enemy_Y1 +14== spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 - 4 == spriteY))
|| ((enemy_X1 + 8 == spriteX) && (enemy_Y1 - 8== spriteY))
|| ((enemy_X1 + 12 == spriteX) && (enemy_Y1 - 12== spriteY))
||((enemy_X1 + 16== spriteX) && (enemy_Y1 - 16== spriteY))
||((enemy_X1 + 20== spriteX) && (enemy_Y1-20  == spriteY))
||((enemy_X1 + 24 == spriteX) && (enemy_Y1 - 24 == spriteY))
||((enemy_X1 + 28== spriteX) && (enemy_Y1 - 28== spriteY))
|| ((enemy_X1 + 2 == spriteX) && (enemy_Y1 - 2 == spriteY))
|| ((enemy_X1 + 4 == spriteX) && (enemy_Y1 - 4== spriteY))
|| ((enemy_X1 + 6 == spriteX) && (enemy_Y1 - 6== spriteY))
||((enemy_X1 + 8== spriteX) && (enemy_Y1 - 8== spriteY))
||((enemy_X1 + 10== spriteX) && (enemy_Y1-10  == spriteY))
||((enemy_X1 + 12 == spriteX) && (enemy_Y1 - 12 == spriteY))
||((enemy_X1 + 14== spriteX) && (enemy_Y1 - 14 == spriteY))
||((enemy_X1 - 4 == spriteX) && (enemy_Y1 - 4== spriteY))
||((enemy_X1 - 8 == spriteX) && (enemy_Y1 - 8 == spriteY))
||((enemy_X1 - 12 == spriteX) && (enemy_Y1 - 12== spriteY))
||((enemy_X1 - 16== spriteX) && (enemy_Y1 -16 == spriteY))
||((enemy_X1 - 20== spriteX) && (enemy_Y1 -20== spriteY))
||((enemy_X1 - 24 == spriteX) && (enemy_Y1 -24== spriteY))
||((enemy_X1 - 28== spriteX) && (enemy_Y1 -28== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 4 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +8  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +12 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 + 16== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 20== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 +24 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +28 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 4 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -8  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -12 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 -16== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 20== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 -24 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -28 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 2 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -4  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -6 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 -8== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 10== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 -12 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -14 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 16 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -18  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -20 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 -22== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 - 24== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 -26 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 -28 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 2 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +4  == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +6 == spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 + 8== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 10== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 +12 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +14== spriteY))
||((enemy_X1== spriteX) && (enemy_Y1 + 16== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 + 18== spriteY))
||((enemy_X1  == spriteX) && (enemy_Y1 +20 == spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 +22== spriteY))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 2))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 4))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 6))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 8))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 10))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 12))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 14))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 16))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 18))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 20))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 22))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 24))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 26))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY - 28))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY  + 2))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY +  4))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 6))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 8))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 10))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 12))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 14))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 16))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 18))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 20))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 22))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 24))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 26))
||((enemy_X1 == spriteX) && (enemy_Y1 == spriteY + 28))
||((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY - 2))
||((enemy_X1 +2 == spriteX) && (enemy_Y1 == spriteY - 4))
||((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY - 6))
||((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY - 8))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY - 10))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY - 12))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY - 14))
||((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY - 16))
||((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY - 18))
||((enemy_X1 + 2 == spriteX) && (enemy_Y1 == spriteY - 20))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY - 22))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY - 24))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY - 26))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY - 28))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY  + 2))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY +  4))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 6))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 8))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY + 10))
||((enemy_X1 + 2== spriteX) && (enemy_Y1 == spriteY + 12))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 14))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 16))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 18))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 20))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 22))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 24))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 26))
||((enemy_X1+ 2 == spriteX) && (enemy_Y1 == spriteY + 28))
||((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY - 2))
||((enemy_X1 +4 == spriteX) && (enemy_Y1 == spriteY - 4))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY - 6))
||((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY - 8))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY - 10))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY - 12))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY - 14))
||((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY - 16))
||((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY - 18))
||((enemy_X1 + 4 == spriteX) && (enemy_Y1 == spriteY - 20))
||((enemy_X1+ 4== spriteX) && (enemy_Y1 == spriteY - 22))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY - 24))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY - 26))
||((enemy_X1+ 4== spriteX) && (enemy_Y1 == spriteY - 28))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY  + 2))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY +  4))
||((enemy_X1+ 4== spriteX) && (enemy_Y1 == spriteY + 6))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 8))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY + 10))
||((enemy_X1 + 4== spriteX) && (enemy_Y1 == spriteY + 12))
||((enemy_X1+ 4== spriteX) && (enemy_Y1 == spriteY + 14))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 16))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 18))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 20))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 22))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 24))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 26))
||((enemy_X1+ 4 == spriteX) && (enemy_Y1 == spriteY + 28))
||((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY - 2))
||((enemy_X1 +6== spriteX) && (enemy_Y1 == spriteY - 4))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY - 6))
||((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY - 8))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY - 10))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY - 12))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY - 14))
||((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY - 16))
||((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY - 18))
||((enemy_X1 + 6 == spriteX) && (enemy_Y1 == spriteY - 20))
||((enemy_X1+ 6== spriteX) && (enemy_Y1 == spriteY - 22))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY - 24))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY - 26))
||((enemy_X1+ 6== spriteX) && (enemy_Y1 == spriteY - 28))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY  + 2))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY +  4))
||((enemy_X1+ 6== spriteX) && (enemy_Y1 == spriteY + 6))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 8))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY + 10))
||((enemy_X1 + 6== spriteX) && (enemy_Y1 == spriteY + 12))
||((enemy_X1+ 6== spriteX) && (enemy_Y1 == spriteY + 14))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 16))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 18))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 20))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 22))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 24))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 26))
||((enemy_X1+ 6 == spriteX) && (enemy_Y1 == spriteY + 28))


)
begin
enemy1_dead_flag = 1; 
end
else 
enemy1_dead_flag = 0;
	end

////////////////////////////////////////////////



		
//////////////////////////////////////////////
if(first_map_flag == 2'b01)
	if(sword_collision == 0)
if( 
((enemy_X2 == spriteX) && (enemy_Y2 == spriteY)) 
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 8 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 8== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 10== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 12 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 14 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 16== spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 18 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 22== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 2 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 6 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 8== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 10== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 14== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 18== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 20 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 22== spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 + 4 == spriteY))
|| ((enemy_X2 + 8 == spriteX) && (enemy_Y2 + 8== spriteY))
|| ((enemy_X2 + 12 == spriteX) && (enemy_Y2 + 12== spriteY))
||((enemy_X2 + 16== spriteX) && (enemy_Y2 + 16== spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2+20  == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 + 24 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 + 28== spriteY))
|| ((enemy_X2 + 2 == spriteX) && (enemy_Y2 + 2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 + 4== spriteY))
|| ((enemy_X2 + 6 == spriteX) && (enemy_Y2 + 6== spriteY))
||((enemy_X2 + 8== spriteX) && (enemy_Y2 + 8== spriteY))
||((enemy_X2 + 10== spriteX) && (enemy_Y2+10  == spriteY))
||((enemy_X2 + 12 == spriteX) && (enemy_Y2 + 12 == spriteY))
||((enemy_X2 + 14== spriteX) && (enemy_Y2 + 14== spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 + 4== spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 + 8 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 + 12== spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 +16 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 +20== spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 +24== spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 +28== spriteY))
||((enemy_X2 - 2 == spriteX) && (enemy_Y2 + 2== spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 + 4 == spriteY))
||((enemy_X2 - 6 == spriteX) && (enemy_Y2 + 6== spriteY))
||((enemy_X2 - 8== spriteX) && (enemy_Y2 +8 == spriteY))
||((enemy_X2 - 10== spriteX) && (enemy_Y2 +10== spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 +12== spriteY))
||((enemy_X2 - 14== spriteX) && (enemy_Y2 +14== spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 - 4 == spriteY))
|| ((enemy_X2 + 8 == spriteX) && (enemy_Y2 - 8== spriteY))
|| ((enemy_X2 + 12 == spriteX) && (enemy_Y2 - 12== spriteY))
||((enemy_X2 + 16== spriteX) && (enemy_Y2 - 16== spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2-20  == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 - 24 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 - 28== spriteY))
|| ((enemy_X2 + 2 == spriteX) && (enemy_Y2 - 2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 - 4== spriteY))
|| ((enemy_X2 + 6 == spriteX) && (enemy_Y2 - 6== spriteY))
||((enemy_X2 + 8== spriteX) && (enemy_Y2 - 8== spriteY))
||((enemy_X2 + 10== spriteX) && (enemy_Y2-10  == spriteY))
||((enemy_X2 + 12 == spriteX) && (enemy_Y2 - 12 == spriteY))
||((enemy_X2 + 14== spriteX) && (enemy_Y2 - 14 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 - 4== spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 - 8 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 - 12== spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 -16 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 -20== spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 -24== spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 -28== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 4 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +8  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +12 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 + 16== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 20== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 +24 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +28 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 4 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -8  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -12 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 -16== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 20== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 -24 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -28 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 2 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -4  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -6 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 -8== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 10== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 -12 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -14 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 16 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -18  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -20 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 -22== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 24== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 -26 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -28 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 2 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +4  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +6 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 + 8== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 10== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 +12 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +14== spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 + 16== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 18== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 +20 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +22== spriteY))

)
begin
flag_for_dying <= 1;
dead <= 1;
end
else 
begin
flag_for_dying<=0;
//dead <= 0;
end

if(sword_collision)
	begin
	if( 
((enemy_X2 == spriteX) && (enemy_Y2 == spriteY)) 
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 8 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 8== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 10== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 12 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 14 == spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 16== spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 18 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 22== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 2 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 6 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 8== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 10== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 14== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 18== spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 20 == spriteX) && (enemy_Y2 == spriteY))
||((enemy_X2 - 22== spriteX) && (enemy_Y2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 + 4 == spriteY))
|| ((enemy_X2 + 8 == spriteX) && (enemy_Y2 + 8== spriteY))
|| ((enemy_X2 + 12 == spriteX) && (enemy_Y2 + 12== spriteY))
||((enemy_X2 + 16== spriteX) && (enemy_Y2 + 16== spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2+20  == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 + 24 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 + 28== spriteY))
|| ((enemy_X2 + 2 == spriteX) && (enemy_Y2 + 2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 + 4== spriteY))
|| ((enemy_X2 + 6 == spriteX) && (enemy_Y2 + 6== spriteY))
||((enemy_X2 + 8== spriteX) && (enemy_Y2 + 8== spriteY))
||((enemy_X2 + 10== spriteX) && (enemy_Y2+10  == spriteY))
||((enemy_X2 + 12 == spriteX) && (enemy_Y2 + 12 == spriteY))
||((enemy_X2 + 14== spriteX) && (enemy_Y2 + 14== spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 + 4== spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 + 8 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 + 12== spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 +16 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 +20== spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 +24== spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 +28== spriteY))
||((enemy_X2 - 2 == spriteX) && (enemy_Y2 + 2== spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 + 4 == spriteY))
||((enemy_X2 - 6 == spriteX) && (enemy_Y2 + 6== spriteY))
||((enemy_X2 - 8== spriteX) && (enemy_Y2 +8 == spriteY))
||((enemy_X2 - 10== spriteX) && (enemy_Y2 +10== spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 +12== spriteY))
||((enemy_X2 - 14== spriteX) && (enemy_Y2 +14== spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 - 4 == spriteY))
|| ((enemy_X2 + 8 == spriteX) && (enemy_Y2 - 8== spriteY))
|| ((enemy_X2 + 12 == spriteX) && (enemy_Y2 - 12== spriteY))
||((enemy_X2 + 16== spriteX) && (enemy_Y2 - 16== spriteY))
||((enemy_X2 + 20== spriteX) && (enemy_Y2-20  == spriteY))
||((enemy_X2 + 24 == spriteX) && (enemy_Y2 - 24 == spriteY))
||((enemy_X2 + 28== spriteX) && (enemy_Y2 - 28== spriteY))
|| ((enemy_X2 + 2 == spriteX) && (enemy_Y2 - 2 == spriteY))
|| ((enemy_X2 + 4 == spriteX) && (enemy_Y2 - 4== spriteY))
|| ((enemy_X2 + 6 == spriteX) && (enemy_Y2 - 6== spriteY))
||((enemy_X2 + 8== spriteX) && (enemy_Y2 - 8== spriteY))
||((enemy_X2 + 10== spriteX) && (enemy_Y2-10  == spriteY))
||((enemy_X2 + 12 == spriteX) && (enemy_Y2 - 12 == spriteY))
||((enemy_X2 + 14== spriteX) && (enemy_Y2 - 14 == spriteY))
||((enemy_X2 - 4 == spriteX) && (enemy_Y2 - 4== spriteY))
||((enemy_X2 - 8 == spriteX) && (enemy_Y2 - 8 == spriteY))
||((enemy_X2 - 12 == spriteX) && (enemy_Y2 - 12== spriteY))
||((enemy_X2 - 16== spriteX) && (enemy_Y2 -16 == spriteY))
||((enemy_X2 - 20== spriteX) && (enemy_Y2 -20== spriteY))
||((enemy_X2 - 24 == spriteX) && (enemy_Y2 -24== spriteY))
||((enemy_X2 - 28== spriteX) && (enemy_Y2 -28== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 4 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +8  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +12 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 + 16== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 20== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 +24 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +28 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 4 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -8  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -12 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 -16== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 20== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 -24 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -28 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 2 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -4  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -6 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 -8== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 10== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 -12 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -14 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 16 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -18  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -20 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 -22== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 - 24== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 -26 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 -28 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 2 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +4  == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +6 == spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 + 8== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 10== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 +12 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +14== spriteY))
||((enemy_X2== spriteX) && (enemy_Y2 + 16== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 + 18== spriteY))
||((enemy_X2  == spriteX) && (enemy_Y2 +20 == spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 +22== spriteY))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 2))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 4))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 6))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 8))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 10))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 12))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 14))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 16))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 18))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 20))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 22))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 24))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 26))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY - 28))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY  + 2))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY +  4))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 6))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 8))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 10))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 12))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 14))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 16))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 18))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 20))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 22))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 24))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 26))
||((enemy_X2 == spriteX) && (enemy_Y2 == spriteY + 28))
||((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY - 2))
||((enemy_X2 +2 == spriteX) && (enemy_Y2 == spriteY - 4))
||((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY - 6))
||((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY - 8))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY - 10))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY - 12))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY - 14))
||((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY - 16))
||((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY - 18))
||((enemy_X2 + 2 == spriteX) && (enemy_Y2 == spriteY - 20))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY - 22))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY - 24))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY - 26))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY - 28))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY  + 2))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY +  4))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 6))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 8))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY + 10))
||((enemy_X2 + 2== spriteX) && (enemy_Y2 == spriteY + 12))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 14))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 16))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 18))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 20))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 22))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 24))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 26))
||((enemy_X2+ 2 == spriteX) && (enemy_Y2 == spriteY + 28))
||((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY - 2))
||((enemy_X2 +4 == spriteX) && (enemy_Y2 == spriteY - 4))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY - 6))
||((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY - 8))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY - 10))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY - 12))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY - 14))
||((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY - 16))
||((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY - 18))
||((enemy_X2 + 4 == spriteX) && (enemy_Y2 == spriteY - 20))
||((enemy_X2+ 4== spriteX) && (enemy_Y2 == spriteY - 22))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY - 24))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY - 26))
||((enemy_X2+ 4== spriteX) && (enemy_Y2 == spriteY - 28))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY  + 2))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY +  4))
||((enemy_X2+ 4== spriteX) && (enemy_Y2 == spriteY + 6))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 8))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY + 10))
||((enemy_X2 + 4== spriteX) && (enemy_Y2 == spriteY + 12))
||((enemy_X2+ 4== spriteX) && (enemy_Y2 == spriteY + 14))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 16))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 18))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 20))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 22))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 24))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 26))
||((enemy_X2+ 4 == spriteX) && (enemy_Y2 == spriteY + 28))
||((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY - 2))
||((enemy_X2 +6== spriteX) && (enemy_Y2 == spriteY - 4))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY - 6))
||((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY - 8))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY - 10))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY - 12))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY - 14))
||((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY - 16))
||((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY - 18))
||((enemy_X2 + 6 == spriteX) && (enemy_Y2 == spriteY - 20))
||((enemy_X2+ 6== spriteX) && (enemy_Y2 == spriteY - 22))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY - 24))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY - 26))
||((enemy_X2+ 6== spriteX) && (enemy_Y2 == spriteY - 28))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY  + 2))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY +  4))
||((enemy_X2+ 6== spriteX) && (enemy_Y2 == spriteY + 6))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 8))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY + 10))
||((enemy_X2 + 6== spriteX) && (enemy_Y2 == spriteY + 12))
||((enemy_X2+ 6== spriteX) && (enemy_Y2 == spriteY + 14))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 16))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 18))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 20))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 22))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 24))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 26))
||((enemy_X2+ 6 == spriteX) && (enemy_Y2 == spriteY + 28))


)
begin
enemy2_dead_flag = 1; 
end
else 
enemy2_dead_flag = 0;
	end




//////////////////////////////////////////////////















//if we go into any sword animation, we will check if its drawx or y touching sprite and if so kill sprite.

//Aleena Idea:
//have a flag that is only set high in the running sprites 
//if that run_flag is high, then you can set death = 1 in conditions
//have a flag for the sword sprites 
//if that attack_flag is high, then when they touch the enemy dies 




///////////////////////////////////////////

//
//	
//if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
//begin
//red <= 4'hE; 
//green <= 4'hD;
//blue <= 4'hA;
//end
//
//	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
//begin
//red <= 4'hE; 
//green <= 4'hD;
//blue <= 4'hA;
//end
//
//	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
//begin
//red <= 4'hE; 
//green <= 4'hD;
//blue <= 4'hA;
//end
	// Maintain position at default state
	next_state = cur_state;
	
	
	unique case (cur_state)
	not_moving :
	
		case(keycode)
		
		// left
		8'h04 : begin	
			next_state = s_leftone;
		end
		
		// right
		8'h07 : begin
			next_state = s_rightone;
		end
		
		// down	
		8'h16 : begin
			next_state = s_downone;
		end
		
		// up 
		8'h1A : begin
			next_state = s_upone;
		end	
		
		
		//sword_right
		8'h2c : begin
			next_state = sword_right1;
		end
		
		
		default: begin
			next_state = not_moving;//down for unique 
			
		end
	endcase
	 
	// Left movement sprite: one -> two -> three -> four
	s_leftone:
		if (keycode == 8'h04)
			next_state = s_lefttwo;
			
		else
			next_state = not_movingleft;
			
	s_lefttwo:
		if (keycode == 8'h04)
			next_state = s_leftthree;
			
		else
			next_state = not_movingleft;
			
	s_leftthree:
		if (keycode == 8'h04)
			next_state = s_leftfour;
			
		else
			next_state = not_movingleft;
			
	s_leftfour:
		if (keycode == 8'h04)
			next_state = s_leftone;
			
		else
			next_state = not_movingleft;
	
	// Right movement sprite: one -> two -> three -> four
	s_rightone:
		if (keycode == 8'h07)
			next_state = s_righttwo;
			
		else
			next_state = not_movingright;
			
	s_righttwo:
		if (keycode == 8'h07)
			next_state = s_rightthree;
			
		else
			next_state = not_movingright;
			
	s_rightthree:
		if (keycode == 8'h07)
			next_state = s_rightfour;
			
		else
			next_state = not_movingright;
			
	s_rightfour:
		if (keycode == 8'h07)
			next_state = s_rightone;
			
		else
			next_state = not_movingright;
			
	// Up movement sprite: one -> two -> three -> four
	s_upone:
		if (keycode == 8'h1A)
			next_state = s_uptwo;
			
		else
			next_state = not_movingup;
			
	s_uptwo:
		if (keycode == 8'h1A)
			next_state = s_upthree;
			
		else
			next_state = not_movingup;
			
	s_upthree:
		if (keycode == 8'h1A)
			next_state = s_upfour;
			
		else
			next_state = not_movingup;
			
	s_upfour:
		if (keycode == 8'h1A)
			next_state = s_upone;
			
		else
			next_state = not_movingup;
		
			
			
			
	// Down movement sprite: one -> two -> three -> four
	s_downone:
		if (keycode == 8'h16)
			next_state = s_downtwo;
			
		else
			next_state = not_movingdown;
			
	s_downtwo:
		if (keycode == 8'h16)
			next_state = s_downthree;
			
		else
			next_state = not_movingdown;
			
	s_downthree:
		if (keycode == 8'h16)
			next_state = s_downfour;
			
		else
			next_state = not_movingdown;
			
	s_downfour:
		if (keycode == 8'h16)
			next_state = s_downone;
			
		else
			next_state = not_movingdown;
			
			
			
			
			
	
	//Sword Animation right sprite: one -> two -> three -> four -> five -> six -> seven -> eight

	sword_right1:
		if (keycode == 8'h2c)
			next_state = sword_right2;
			
		else
			next_state = not_movingright;
			


			
	sword_right2:
		if (keycode == 8'h2c)
			next_state = sword_right3;
			
		else
			next_state = not_movingright;
			
	sword_right3:
		if (keycode == 8'h2c)
			next_state = sword_right4;
			
		else
			next_state = not_movingright;
			
	sword_right4:
		if (keycode == 8'h2c)
			next_state = sword_right5;
			
		else
			next_state = not_movingright;
			
			
			sword_right5:
		if (keycode == 8'h2c)
			next_state = sword_right6;
			
		else
			next_state = not_movingright;

			
			
			sword_right6:
		if (keycode == 8'h2c)
			next_state = sword_right7;
			
		else
			next_state = not_movingright;
			
			
			sword_right7:
		if (keycode == 8'h2c)
			next_state = sword_right8;
			
		else
			next_state = not_movingright;
			
			
			sword_right8:
		if (keycode == 8'h2c)
			next_state = sword_right1;
			
		else
			next_state = not_movingright;
		///////////////////////////upsword////////////////////
		
		
		
	//Sword Animation sprite: one -> two -> three -> four -> five -> six -> seven -> eight

	sword_up1:
		if (keycode == 8'h2c)
			next_state = sword_up2;
			
		else
			next_state = not_movingup;
			


			
	sword_up2:
		if (keycode == 8'h2c)
			next_state = sword_up3;
			
		else
			next_state = not_movingup;
			
	sword_up3:
		if (keycode == 8'h2c)
			next_state = sword_up4;
			
		else
			next_state = not_movingup;
			
	sword_up4:
		if (keycode == 8'h2c)
			next_state = sword_up5;
			
		else
			next_state = not_movingup;
			
			
			sword_up5:
		if (keycode == 8'h2c)
			next_state = sword_up6;
			
		else
			next_state = not_movingup;

			
			
			sword_up6:
		if (keycode == 8'h2c)
			next_state = sword_up7;
			
		else
			next_state = not_movingup;
			
			
			sword_up7:
		if (keycode == 8'h2c)
			next_state = sword_up8;
			
		else
			next_state = not_movingup;
			
			
			sword_up8:
		if (keycode == 8'h2c)
			next_state = sword_up1;
			
		else
			next_state = not_movingup;
		
		
		
		
		
		
		
		////////////////////////upsword//////////////////////////////
	
	
	
	
	
	///////////////////////////downsword////////////////////
		
		
		
	//Sword Animation sprite: one -> two -> three -> four -> five -> six -> seven -> eight

	sword_down1:
		if (keycode == 8'h2c)
			next_state = sword_down2;
			
		else
			next_state = not_movingdown;
			


			
	sword_down2:
		if (keycode == 8'h2c)
			next_state = sword_down3;
			
		else
			next_state = not_movingdown;
			
	sword_down3:
		if (keycode == 8'h2c)
			next_state = sword_down4;
			
		else
			next_state = not_movingdown;
			
	sword_down4:
		if (keycode == 8'h2c)
			next_state = sword_down5;
			
		else
			next_state = not_movingdown;
			
			
			sword_down5:
		if (keycode == 8'h2c)
			next_state = sword_down6;
			
		else
			next_state = not_movingdown;

			
			
			sword_down6:
		if (keycode == 8'h2c)
			next_state = sword_down7;
			
		else
			next_state = not_movingdown;
			
			
			sword_down7:
		if (keycode == 8'h2c)
			next_state = sword_down8;
			
		else
			next_state = not_movingdown;
			
			
			sword_down8:
		if (keycode == 8'h2c)
			next_state = sword_down1;
			
		else
			next_state = not_movingdown;
		
		
		
		
		
		
		
		////////////////////////downsword//////////////////////////////
		
		
		
		
		
		
	
	///////////////////////////leftsword////////////////////
		
		
		
	//Sword Animation sprite: one -> two -> three -> four -> five -> six -> seven -> eight

	sword_left1:
		if (keycode == 8'h2c)
			next_state = sword_left2;
			
		else
			next_state = not_movingleft;
			


			
	sword_left2:
		if (keycode == 8'h2c)
			next_state = sword_left3;
			
		else
			next_state = not_movingleft;
			
	sword_left3:
		if (keycode == 8'h2c)
			next_state = sword_left4;
			
		else
			next_state = not_movingleft;
			
	sword_left4:
		if (keycode == 8'h2c)
			next_state = sword_left5;
			
		else
			next_state = not_movingleft;
			
			
			sword_left5:
		if (keycode == 8'h2c)
			next_state = sword_left6;
			
		else
			next_state = not_movingleft;

			
			
			sword_left6:
		if (keycode == 8'h2c)
			next_state = sword_left7;
			
		else
			next_state = not_movingleft;
			
			
			sword_left7:
		if (keycode == 8'h2c)
			next_state = sword_left8;
			
		else
			next_state = not_movingleft;
			
			
			sword_left8:
		if (keycode == 8'h2c)
			next_state = sword_left1;
			
		else
			next_state = not_movingleft;
		
		
		
		
		
		
		
		////////////////////////leftsword//////////////////////////////
	
	not_movingup:			
	
	if (keycode == 8'h07 )
			next_state = s_rightone;
			
		
	else if (keycode == 8'h04)
			next_state = s_leftone;
			
	
	else if (keycode == 8'h16)
			next_state = s_downone;
	
	else if (keycode == 8'h1A)
		next_state = s_upone;
		
			
	else if (keycode == 8'h2c)
	begin
	if (right == 1)
		next_state = sword_right1;
	if (up == 1)
		next_state = sword_up1;
	if (down == 1)
		next_state = sword_down1;
	if (left == 1)
		next_state = sword_left1;
			
	end 
		
			
		
		
		else
			next_state = not_movingup;
			
	
	not_movingdown:			
	
	if (keycode == 8'h07)
			next_state = s_rightone;
			
		
	else if (keycode == 8'h04)
			next_state = s_leftone;
			
	
	else if (keycode == 8'h16)
			next_state = s_downone;
	
	else if (keycode == 8'h1A)
		next_state = s_upone;
		
			
	else if (keycode == 8'h2c)
	begin
	if (right == 1)
		next_state = sword_right1;
	if (up == 1)
		next_state = sword_up1;
	if (down == 1)
		next_state = sword_down1;
	if (left == 1)
		next_state = sword_left1;
			
	end 
		
		
		else
			next_state = not_movingdown;
			
			
			
			
			
			not_movingright:			
	
	if (keycode == 8'h07)
			next_state = s_rightone;
			
		
	else if (keycode == 8'h04)
			next_state = s_leftone;
			
	
	else if (keycode == 8'h16)
			next_state = s_downone;
	
	else if (keycode == 8'h1A)
		next_state = s_upone;
		
			
	else if (keycode == 8'h2c)
	begin
	if (right == 1)
		next_state = sword_right1;
	if (up == 1)
		next_state = sword_up1;
	if (down == 1)
		next_state = sword_down1;
	if (left == 1)
		next_state = sword_left1;
			
			
	end 
		
		
		else
			next_state = not_movingright;
			
			
			
			not_movingleft:			
	
	if (keycode == 8'h07)
			next_state = s_rightone;
			
		
	else if (keycode == 8'h04)
			next_state = s_leftone;
			
	
	else if (keycode == 8'h16)
			next_state = s_downone;
	
	else if (keycode == 8'h1A)
		next_state = s_upone;
		
		
	else if (keycode == 8'h2c)
	begin
	if (right == 1)
		next_state = sword_right1;
	if (up == 1)
		next_state = sword_up1;
	if (down == 1)
		next_state = sword_down1;
	if (left == 1)
		next_state = sword_left1;
			
			
	end 
	
		
		
		else
			next_state = not_movingleft;










	
					
	endcase
	
	
	
		
	
	case(cur_state)
	
	// Stationary one
	
	not_moving:
		
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
	if (DistX < sprite_size && DistY < sprite_size)
	if(final_down2_red != 4'hF && final_down2_green != 4'hF && final_down2_blue != 4'hF )
	 begin
	 sword_collision = 0;
	  down = 1;
  right = 0;
	  up = 0;
	  left = 0;
		red <= final_down2_red;
		green <= final_down2_green;
		blue <= final_down2_blue;	
		//instead of drawx, check boundaries 
	
	
	end
		
			
		end
		
	
	
	
	end//
	
	
	not_movingdown:
		
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 0;
		up = 0; 
		left = 0;
		down = 1;
	if (DistX < sprite_size && DistY < sprite_size)
	if(final_down2_red != 4'hF && final_down2_green != 4'hF && final_down2_blue != 4'hF )
	 begin
	  
		red <= final_down2_red;
		green <= final_down2_green;
		blue <= final_down2_blue;	
		//instead of drawx, check boundaries 
	
	
	end
else 
down = 0; 	
			
		end
		end//
	
	
	
	
	not_movingleft:
		
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 0;
	 left = 1;
	 up = 0; 
	 down = 0;
	if (DistX - 3 < sprite_size && DistY - 3   < sprite_size)
	if(left2_red != 4'hF && left2_green != 4'hF && left2_blue != 4'hF )
	 begin
	  
		red <= left2_red;
		green <= left2_green;
		blue <= left2_blue;
		
		//if(spriteX == DrawX && spriteY == DrawY) 
		//if((sprite_size == DrawX) && (sprite_size == DrawY))
			 

	end
	
			
		end
	end	
		
		
	not_movingright:
		
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 1;
		up = 0;
		down = 0; 
		left = 0;
	if (DistX < sprite_size && DistY < sprite_size)
	if(final_right2_red != 4'hF && final_right2_green != 4'hF && final_right2_blue != 4'hF )
	 begin 
		red <= final_right2_red;
		green <= final_right2_green;
		blue <= final_right2_blue;
		

	end	
			
		end
		end
	
	not_movingup:
		
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 0;
		up = 1; 
		down = 0;
		left = 0;
	if (DistX < sprite_size && DistY < sprite_size)
	if(final_up2_red != 4'hF && final_up2_green != 4'hF && final_up2_blue != 4'hF )
	 begin 
	 up = 1; 
		red <= final_up2_red;
		green <= final_up2_green;
		blue <= final_up2_blue;
		
		

	end
else 
up = 0;	
		end
	end
	
	
	
	// add first motion palette RGB
	s_leftone:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(left1_red != 4'h0 && left1_green != 4'h0 && left1_blue != 4'h0 )
	 begin
	 left = 1;
		red <= left1_red;
		green <= left1_green;
		blue <= left1_blue;
		
		//if(spriteX == DrawX && spriteY == DrawY) 
		//if((sprite_size == DrawX) && (sprite_size == DrawY))
		//if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 )))
		if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY)) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY)) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		begin
	if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 

	if(keycode != 8'h04)
	collision <= 0;
	end
	///////////////////////////
	if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY)) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY)) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		begin
	if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end		

	if(keycode != 8'h04)
	collision <= 0;
	end
	
	//////////////////////////////
	end //ends the coloring

		
		
		
		end
		end
	s_lefttwo:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(left1_red != 4'h0 && left1_green != 4'h0 && left1_blue != 4'h0 )
	 begin
	 left = 1; 
		red <= left1_red;
		green <= left1_green;
		blue <= left1_blue;
		
		//if(spriteX == DrawX && spriteY == DrawY) 
		//if((sprite_size == DrawX) && (sprite_size == DrawY))
		if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 )) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 
	if(keycode != 8'h04)
	collision <= 0;
	end
	///////////////////////
		
		
		if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 )) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	 
	if(keycode != 8'h04)
	collision <= 0;
	end
	
		
		
		
	//////////////////////////	
		end//ends the coloring
		end
	end
   // add second motion palette RGB	
	s_leftthree:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX - 3 < sprite_size && DistY - 3   < sprite_size)
	if(left2_red != 4'hF && left2_green != 4'hF && left2_blue != 4'hF )
	 begin
	 left = 1; 
		red <= left2_red;
		green <= left2_green;
		blue <= left2_blue;
		
		//if(spriteX == DrawX && spriteY == DrawY) 
		//if((sprite_size == DrawX) && (sprite_size == DrawY))
		
		if( 	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 			) 
	
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 
	if(keycode != 8'h04)
	collision <= 0;
	end
	//////////////////////////////////////////
		
	if( 	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 			) 
	
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	 
	if(keycode != 8'h04)
	collision <= 0;
	end	
		
		
	/////////////////////////////////////////	
		end //ends the coloring 
		end
		end
	
	s_leftfour:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX - 3 < sprite_size && DistY - 3   < sprite_size)
	if(left2_red != 4'hF && left2_green != 4'hF && left2_blue != 4'hF )
	 begin
	 left = 1; 
		red <= left2_red;
		green <= left2_green;
		blue <= left2_blue;
		
		//if(spriteX == DrawX && spriteY == DrawY) 
		//if((sprite_size == DrawX) && (sprite_size == DrawY))
		
		if( 	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		
		
		
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 
	if(keycode != 8'h04)
	collision <= 0;
	end
	/////////////////////////////////////////// 
		if( 	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		
		
		
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	 
	if(keycode != 8'h04)
	collision <= 0;
	end
		
		
		
		
	///////////////////////////////////////////////////	
		end //ends the coloring 
		end
		end
		
		
		
		
		
		
	// add first motion palette RGB		
	s_rightone:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_right2_red != 4'hF && final_right2_green != 4'hF && final_right2_blue != 4'hF )
	 begin 
		red <= final_right2_red;
		green <= final_right2_green;
		blue <= final_right2_blue;
		if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	if(keycode != 8'h07)
	collision <= 0;
	end
	/////////////////////////////////////////////////
	if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
	if(keycode != 8'h07)
	collision <= 0;
	end
		
	/////////////////////////////////////////////////	
		end //ends the coloring 
		end
		end
		
		
		
		
	s_righttwo:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_right2_red != 4'hF && final_right2_green != 4'hF && final_right2_blue != 4'hF )
	 begin 
	 
		red <= final_right2_red;
		green <= final_right2_green;
		blue <= final_right2_blue;
		if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
if(keycode != 8'h07)
	collision <= 0;
	end 
	/////////////////////////////////////////////////////
	if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
if(keycode != 8'h07)
	collision <= 0;
	end 
	
	//////////////////////////////////////////////////////
		end //ends coloring 
		end
		end
		
   // add second motion palette RGB
	s_rightthree:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 1;
	if (DistX< sprite_size && DistY< sprite_size)
	if(right1_red != 4'h0 && right1_green != 4'h0 && right1_blue != 4'h0 )
	 begin 
	 
		red <= right1_red;
		green <= right1_green;
		blue <= right1_blue;
		if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
if(keycode != 8'h07)
	collision <= 0;
	end 
	/////////////////////////////////////////////
	if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
if(keycode != 8'h07)
	collision <= 0;
	end 
		
	/////////////////////////////////////////	
		
		end //coloring ends here 
		end
		end
		
	s_rightfour:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		right = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(right1_red != 4'h0 && right1_green != 4'h0 && right1_blue != 4'h0 )
	 begin 
	 right = 1;
		red <= right1_red;
		green <= right1_green;
		blue <= right1_blue;
		if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
if(keycode != 8'h07)
	collision <= 0;
	end 
//////////////////////////////////

if (
		(spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY)
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size -26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 0 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 26 ) == DrawY))
		|| ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 24 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 22 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 20 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 18 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 16 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 14 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 12 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 10 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 8 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 6 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 4 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 2 ) == DrawY))
		||((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size + 0 ) == DrawY))
		)
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
if(keycode != 8'h07)
	collision <= 0;
	end 

/////////////////////////////////////////
		
		
		end //ends the coloring 
		end
		end
	// add first motion palette RGB	
	s_upone:
		begin
		begin
		if (link_should_not_be_on_title_screen == 1)
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(up1_red != 4'h7 && up1_green != 4'h7 && up1_blue != 4'h7 )
	 begin
	up = 1; 
		red <= up1_red;
		green <= up1_green;
		blue <= up1_blue;
		
		if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
 if(keycode != 8'h1A)
	collision <= 0;
	end
	//////////////////////////////////////////////////
	if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
 if(keycode != 8'h1A)
	collision <= 0;
	end
	
	///////////////////////////////////////////////
	
		end
		end
		end
		
		
		
	s_uptwo:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(up1_red != 4'h7 && up1_green != 4'h7 && up1_blue != 4'h7 )
	 begin 
	 up = 1;
		red <= up1_red;
		green <= up1_green;
		blue <= up1_blue;
		
		if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
if(keycode != 8'h1A)
	collision <= 0;
	end
	///////////////////////////////
	if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
if(keycode != 8'h1A)
	collision <= 0;
	end
	
	
	///////////////////////////////
		
		
		
		
		end //ends the coloring 
		end
		end
   // add second motion palette RGB		
	s_upthree:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_up2_red != 4'hF && final_up2_green != 4'hF && final_up2_blue != 4'hF )
	 begin 
	 up = 1; 
		red <= final_up2_red;
		green <= final_up2_green;
		blue <= final_up2_blue;
		
		if( 	((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 		) 
	
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
if(keycode != 8'h1A)
	collision <= 0;
	end
	//////////////////////////////////////
	if( 	((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 		) 
	
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
if(keycode != 8'h1A)
	collision <= 0;
	end
	
	
	//////////////////////////////////////
		
		
		end //ends the coloring
		end
		end
		
	s_upfour:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_up2_red != 4'hF && final_up2_green != 4'hF && final_up2_blue != 4'hF )
	 begin 
	 up = 1;
		red <= final_up2_red;
		green <= final_up2_green;
		blue <= final_up2_blue;
		
		
		if( 	((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 		) 
	
		begin
		if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
if(keycode != 8'h1A)
	collision <= 0;
	end	
////////////////////////////////////
if( 	((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 		) 
	
		begin
		if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
if(keycode != 8'h1A)
	collision <= 0;
	end	


//////////////////////////////
		
		
		end //ends the coloring
		end
	end
	// add first motion palette RGB		
	s_downone:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(down1_red != 4'h0 && down1_green != 4'h0 && down1_blue != 4'h0 )
	if(down1_red != 4'h1 && down1_green != 4'h0 && down1_blue != 4'h0 )
	 begin
	  down = 1;
		red <= down1_red;
		green <= down1_green;
		blue <= down1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end	
///////////////////////////
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end		
		
		
/////////////////////////////////////		
		end //ends the coloring
		end
		end
		
		
	s_downtwo:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(down1_red != 4'h0 && down1_green != 4'h0 && down1_blue != 4'h0 )
	if(down1_red != 4'h1 && down1_green != 4'h0 && down1_blue != 4'h0 )
	 begin
	  down = 1;
		red <= down1_red;
		green <= down1_green;
		blue <= down1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end	
	/////////////////////
	
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end	
	
	
	//////////////////////////
		
		
		end  //ends the coloring
		end
		end
		
   // add second motion palette RGB	
	s_downthree:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_down2_red != 4'hF && final_down2_green != 4'hF && final_down2_blue != 4'hF )
	 begin
	  down = 1;
		red <= final_down2_red;
		green <= final_down2_green;
		blue <= final_down2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end
	///////////////////////////////
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end
	
	
	
	//////////////////////////////////
		
		
		
		
		end//ends the coloring
		end
		end
		
		
	s_downfour:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin//
		 sword_collision = 0;
	if (DistX < sprite_size && DistY < sprite_size)
	if(final_down2_red != 4'hF && final_down2_green != 4'hF && final_down2_blue != 4'hF )
	 begin
	  down = 1;
		red <= final_down2_red;
		green <= final_down2_green;
		blue <= final_down2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(first_map_flag == 2'b01)
	begin
	if(final_bc_red == 4'hE && final_bc_green == 4'hA && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end
	///////////////////////////
	
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(second_map_flag == 2'b01)
	begin
	if(background_2_red == 4'hF && background_2_green == 4'hB && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hE && background_2_green == 4'h8 && background_2_blue == 4'hA)
	collision <= 1;
	
	if(background_2_red == 4'hF && background_2_green == 4'hC && background_2_blue == 4'hB)
	collision <= 1;	

	if(background_2_red == 4'hE && background_2_green == 4'h9 && background_2_blue == 4'hA)
	collision <= 1;
	end	
	if(keycode != 8'h16)
	collision <= 0;
	end
	
	
	
	///////////////////////////
		
		
		end //ends the coloring
		end
		end
	
	
	
	
	
	
	
	
	sword_right1:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
		 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_right1_red != 4'hF && sword_right1_green != 4'hF && sword_right1_blue!= 4'hF )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_right1_red;
		green <= sword_right1_green;
		blue <= sword_right1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
	end
	

	
	
	
	

	
	
	
	
	
	
	
	sword_right2:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY -1 < sprite_size)
	if(sword_right1_red != 4'hF && sword_right1_green != 4'hF && sword_right1_blue!= 4'hF )
	 //if(right == 1)
	 begin
	 
		red <= sword_right1_red;
		green <= sword_right1_green;
		blue <= sword_right1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
		
		
		
		
		
		
		
		
		
	sword_right3:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX - 3 < sprite_size && DistY -1 < sprite_size)
	if(sword_right2_red != 4'h0 && sword_right2_green != 4'h0 && sword_right2_blue!= 4'h0 )
	// if(right == 1)
	//if(red != down1_red && green != down1_green && blue != down1_blue )
	 begin
	 
		red <= sword_right2_red;
		green <= sword_right2_green;
		blue <= sword_right2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
	end
	
	
	
	
	sword_right4:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX - 3  < sprite_size && DistY -1  < sprite_size)
	if(sword_right2_red != 4'h0 && sword_right2_green != 4'h0 && sword_right2_blue!= 4'h0 )
	// if(right == 1)
	//if(red != down1_red && green != down1_green && blue != down1_blue )
	 begin
	 
		red <= sword_right2_red;
		green <= sword_right2_green;
		blue <= sword_right2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end			
		end
		end
	
	
	
	sword_right5:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX - 2 < sprite_size && DistY  < sprite_size)
	if(sword_right3_red != 4'h0 && sword_right3_green != 4'h0 && sword_right3_blue!= 4'h0 )
	 //if(right == 1)
	//if(red != down1_red && green != down1_green && blue != down1_blue )
	 begin
	 
		red <= sword_right3_red;
		green <= sword_right3_green;
		blue <= sword_right3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end			
		end
		end
		

	
	
	
	sword_right6:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX - 2 < sprite_size && DistY  < sprite_size)
	if(sword_right3_red != 4'h0 && sword_right3_green != 4'h0 && sword_right3_blue!= 4'h0 )
	//if(right == 1)
	//if(red != down1_red && green != down1_green && blue != down1_blue )
	 begin
	 
		red <= sword_right3_red;
		green <= sword_right3_green;
		blue <= sword_right3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end	
		end
	end
	
	
	
	
	
	
	sword_right7:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(sword_right4_red != 4'h0 && sword_right4_green != 4'h0 && sword_right4_blue!= 4'h0 )
	//if(right == 1)
	//if(red != down1_red && green != down1_green && blue != down1_blue )
	 begin
	 
		red <= sword_right4_red;
		green <= sword_right4_green;
		blue <= sword_right4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
	
	
	
	
	
	sword_right8:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(sword_right4_red != 4'h0 && sword_right4_green != 4'h0 && sword_right4_blue!= 4'h0 )
	// if(right == 1)
	//if(red != down1_red && green != down1_green && blue != down1_blue )
	 begin
	 
		red <= sword_right4_red;
		green <= sword_right4_green;
		blue <= sword_right4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	end			
		end
		end
		
///////////////////////////upsword//////////////////////////////////////////////	
		
		
	sword_up1:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up1_red != 4'h0 && sword_up1_green != 4'h0 && sword_up1_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up1_red;
		green <= sword_up1_green;
		blue <= sword_up1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
	
	

	
	
	
	

	
	
	
	
	
	
	
	sword_up2:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up1_red != 4'h0 && sword_up1_green != 4'h0 && sword_up1_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up1_red;
		green <= sword_up1_green;
		blue <= sword_up1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
		
		
		
		
		
		
		
		
		
	sword_up3:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up2_red != 4'h0 && sword_up2_green != 4'h0 && sword_up2_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up2_red;
		green <= sword_up2_green;
		blue <= sword_up2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
	end
	
	
	
	
	sword_up4:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up2_red != 4'h0 && sword_up2_green != 4'h0 && sword_up2_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up2_red;
		green <= sword_up2_green;
		blue <= sword_up2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end			
		end
	end
	
	
	sword_up5:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up3_red != 4'h0 && sword_up3_green != 4'h0 && sword_up3_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up3_red;
		green <= sword_up3_green;
		blue <= sword_up3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end				
		end
		end
		

	
	
	
	sword_up6:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up3_red != 4'h0 && sword_up3_green != 4'h0 && sword_up3_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up3_red;
		green <= sword_up3_green;
		blue <= sword_up3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
	
	
	
	
	
	
	
	sword_up7:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up4_red != 4'h0 && sword_up4_green != 4'h0 && sword_up4_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up4_red;
		green <= sword_up4_green;
		blue <= sword_up4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end			
		end
		end
	
	
	
	
	
	sword_up8:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_up4_red != 4'h0 && sword_up4_green != 4'h0 && sword_up4_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_up4_red;
		green <= sword_up4_green;
		blue <= sword_up4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end					
		end
		end
		
//////////////////////upsword////////////////////////////////////////////////////////	
		
		
		
		
		
		
		
///////////////////////////downsword//////////////////////////////////////////////	
		
		
	sword_down1:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down1_red != 4'h0 && sword_down1_green != 4'h0 && sword_down1_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down1_red;
		green <= sword_down1_green;
		blue <= sword_down1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
	end
	

	
	
	
	

	
	
	
	
	
	
	
	sword_down2:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down1_red != 4'h0 && sword_down1_green != 4'h0 && sword_down1_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down1_red;
		green <= sword_down1_green;
		blue <= sword_down1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
		
		
		
		
		
		
		
		
	sword_down3:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down2_red != 4'h0 && sword_down2_green != 4'h0 && sword_down2_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down2_red;
		green <= sword_down2_green;
		blue <= sword_down2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end
		end
		end
	
	
	
	
	
	sword_down4:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down2_red != 4'h0 && sword_down2_green != 4'h0 && sword_down2_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down2_red;
		green <= sword_down2_green;
		blue <= sword_down2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end	
		end
	end
	
	
	sword_down5:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down3_red != 4'h0 && sword_down3_green != 4'h0 && sword_down3_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down3_red;
		green <= sword_down3_green;
		blue <= sword_down3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end				
		end
		end
		

	
	
	
	sword_down6:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down3_red != 4'h0 && sword_down3_green != 4'h0 && sword_down3_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down3_red;
		green <= sword_down3_green;
		blue <= sword_down3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end				
		end
		end
	
	
	
	
	
	
	
	sword_down7:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down4_red != 4'h0 && sword_down4_green != 4'h0 && sword_down4_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down4_red;
		green <= sword_down4_green;
		blue <= sword_down4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end					
		end
		end
	
	
	
	
	
	sword_down8:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_down4_red != 4'h0 && sword_down4_green != 4'h0 && sword_down4_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_down4_red;
		green <= sword_down4_green;
		blue <= sword_down4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end					
		end
		end
				
	
//////////////////////downsword////////////////////////////////////////////////////////	
		
		

		
///////////////////////////leftsword//////////////////////////////////////////////	
		
		
	sword_left1:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left1_red != 4'hF && sword_left1_green != 4'hF && sword_left1_blue!= 4'hF )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left1_red;
		green <= sword_left1_green;
		blue <= sword_left1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
	
	

	
	
	
	

	
	
	
	
	
	
	
	sword_left2:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
	if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left1_red != 4'hF && sword_left1_green != 4'hF && sword_left1_blue!= 4'hF )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left1_red;
		green <= sword_left1_green;
		blue <= sword_left1_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end		
		end
		end
		
		
		
		
		
		
		
		
		
	sword_left3:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left2_red != 4'h0 && sword_left2_green != 4'h0 && sword_left2_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left2_red;
		green <= sword_left2_green;
		blue <= sword_left2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end	
		end
		end
	
	
	
	
	
	sword_left4:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left2_red != 4'h0 && sword_left2_green != 4'h0 && sword_left2_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left2_red;
		green <= sword_left2_green;
		blue <= sword_left2_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end	
		end
		end
	
	
	
	sword_left5:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left3_red != 4'h0 && sword_left3_green != 4'h0 && sword_left3_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left3_red;
		green <= sword_left3_green;
		blue <= sword_left3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end				
		end
		end
		

	
	
	
	sword_left6:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left3_red != 4'h0 && sword_left3_green != 4'h0 && sword_left3_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left3_red;
		green <= sword_left3_green;
		blue <= sword_left3_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end					
		end
		end
	
	
	
	
	
	
	
	sword_left7:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left4_red != 4'h0 && sword_left4_green != 4'h0 && sword_left4_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left4_red;
		green <= sword_left4_green;
		blue <= sword_left4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end					
		end
	end
	
	
	
	
	sword_left8:
		begin
		if (link_should_not_be_on_title_screen == 1)
		begin
			 sword_collision = 1;
		if (DistX -3  < sprite_size && DistY- 1< sprite_size)
	if(sword_left4_red != 4'h0 && sword_left4_green != 4'h0 && sword_left4_blue!= 4'h0 )
	 //if(right == 1) //basically checking if the right sprite is bein
	 begin
	 
		red <= sword_left4_red;
		green <= sword_left4_green;
		blue <= sword_left4_blue;	
		//instead of drawx, check boundaries 
	if ((spriteX + (sprite_size-15) == DrawX) && (spriteY + (sprite_size + 15 )))
	begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end					
		end
		end
				
	
//////////////////////leftsword////////////////////////////////////////////////////////	
				
		
		
	
		
	endcase
end

final_background_rom final_background_rom (
	.clock   (vga_clk),
	.address (final_bc_address),
	.q       (final_bc_q)
);

final_background_palette final_background_palette (
	.index (final_bc_q),
	.red   (final_bc_red),
	.green (final_bc_green),
	.blue  (final_bc_blue)
);



zelda_rom zelda_rom (
	.clock   (vga_clk),
	.address (rom_address),
	.q       (rom_q)
);

zelda_palette zelda_palette (
	.index (rom_q),
	.red   (palette_red),
	.green (palette_green),
	.blue  (palette_blue)
	
);




zelda_right_2_rom zelda_right_2_rom (
	.clock   (vga_clk),
	.address (zelda_right_2_rom_address),
	.q       (zelda_right_2_rom_q)
);

zelda_right_2_palette zelda_right_2_palette (
	.index (zelda_right_2_rom_q),
	.red   (zelda_right_2_palette_red),
	.green (zelda_right_2_palette_green),
	.blue  (zelda_right_2_palette_blue)
);



up1_palette up1_palette(
	.index (up1_q),
	.red   (up1_red),
	.green (up1_green),
	.blue  (up1_blue)
	);

	
up1_rom up1_rom (
	.clock   (vga_clk),
	.address (up1_address),
	.q       (up1_q)
);




final_final_right_sprite_palette right1_palette(
	.index (right1_q),
	.red   (right1_red),
	.green (right1_green),
	.blue  (right1_blue)
	);

	
final_final_right_sprite_rom right1_rom (
	.clock   (vga_clk),
	.address (right1_address),
	.q       (right1_q)
);




final_down1_palette down1_palette(
	.index (down1_q),
	.red   (down1_red),
	.green (down1_green),
	.blue  (down1_blue)
	);

	
final_down1_rom down1_rom (
	.clock   (vga_clk),
	.address (down1_address),
	.q       (down1_q)
);




final_final_sprite_left_palette left1_palette(
	.index (left1_q),
	.red   (left1_red),
	.green (left1_green),
	.blue  (left1_blue)
	);

	
final_final_sprite_left_rom left1_rom(
	.clock   (vga_clk),
	.address (left1_address),
	.q       (left1_q)
);






final_left2_rom final_left2_rom (
	.clock   (vga_clk),
	.address (left2_address),
	.q       (left2_q)
);

final_left2_palette final_left2_palette (
	.index (left2_q),
	.red   (left2_red),
	.green (left2_green),
	.blue  (left2_blue)
);



final_up2_rom final_up2_rom (
	.clock   (vga_clk),
	.address (final_up2_address),
	.q       (final_up2_q)
);

final_up2_palette final_up2_palette (
	.index (final_up2_q),
	.red   (final_up2_red),
	.green (final_up2_green),
	.blue  (final_up2_blue)
);



final_down2_rom final_down2_rom (
	.clock   (vga_clk),
	.address (final_down2_address),
	.q       (final_down2_q)
);

final_down2_palette final_down2_palette (
	.index (final_down2_q),
	.red   (final_down2_red),
	.green (final_down2_green),
	.blue  (final_down2_blue)
);


aleena_rom ALI_rom (
	.clock   (vga_clk),
	.address (final_right2_address),
	.q       (final_right2_q)
);

aleena_palette ALI_palette (
	.index (final_right2_q),
	.red   (final_right2_red),
	.green (final_right2_green),
	.blue  (final_right2_blue)
);


sword_right_1_rom sword_right_1_rom (
	.clock   (vga_clk),
	.address (sword_right1_address),
	.q       (sword_right1_q)
);

sword_right_1_palette sword_right_1_palette (
	.index (sword_right1_q),
	.red   (sword_right1_red),
	.green (sword_right1_green),
	.blue  (sword_right1_blue)
);



sword_right_2_rom sword_right_2_rom (
	.clock   (vga_clk),
	.address (sword_right2_address),
	.q       (sword_right2_q)
);

sword_right_2_palette sword_right_2_palette (
	.index (sword_right2_q),
	.red   (sword_right2_red),
	.green (sword_right2_green),
	.blue  (sword_right2_blue)
);



sword_right_3_rom sword_right_3_rom (
	.clock   (vga_clk),
	.address (sword_right3_address),
	.q       (sword_right3_q)
);

sword_right_3_palette sword_right_3_palette (
	.index (sword_right3_q),
	.red   (sword_right3_red),
	.green (sword_right3_green),
	.blue  (sword_right3_blue)
);


sword_right_4_rom sword_right_4_rom (
	.clock   (vga_clk),
	.address (sword_right4_address),
	.q       (sword_right4_q)
);

sword_right_4_palette sword_right_4_palette (
	.index (sword_right4_q),
	.red   (sword_right4_red),
	.green (sword_right4_green),
	.blue  (sword_right4_blue)
);



sword_up_1_rom sword_up_1_rom (
	.clock   (vga_clk),
	.address (sword_up1_address),
	.q       (sword_up1_q)
);

sword_up_1_palette sword_up_1_palette (
	.index (sword_up1_q),
	.red   (sword_up1_red),
	.green (sword_up1_green),
	.blue  (sword_up1_blue)
);


sword_up_2_rom sword_up_2_rom (
	.clock   (vga_clk),
	.address (sword_up2_address),
	.q       (sword_up2_q)
);

sword_up_2_palette sword_up_2_palette (
	.index (sword_up2_q),
	.red   (sword_up2_red),
	.green (sword_up2_green),
	.blue  (sword_up2_blue)
);



sword_up_3_rom sword_up_3_rom (
	.clock   (vga_clk),
	.address (sword_up3_address),
	.q       (sword_up3_q)
);

sword_up_3_palette sword_up_3_palette (
	.index (sword_up3_q),
	.red   (sword_up3_red),
	.green (sword_up3_green),
	.blue  (sword_up3_blue)
);


sword_up_4_rom sword_up_4_rom (
	.clock   (vga_clk),
	.address (sword_up4_address),
	.q       (sword_up4_q)
);

sword_up_4_palette sword_up_4_palette (
	.index (sword_up4_q),
	.red   (sword_up4_red),
	.green (sword_up4_green),
	.blue  (sword_up4_blue)
);




sword_down_1_rom sword_down_1_rom (
	.clock   (vga_clk),
	.address (sword_down1_address),
	.q       (sword_down1_q)
);

sword_down_1_palette sword_down_1_palette (
	.index (sword_down1_q),
	.red   (sword_down1_red),
	.green (sword_down1_green),
	.blue  (sword_down1_blue)
);




sword_down_2_rom sword_down_2_rom (
	.clock   (vga_clk),
	.address (sword_down2_address),
	.q       (sword_down2_q)
);

sword_down_2_palette sword_down_2_palette (
	.index (sword_down2_q),
	.red   (sword_down2_red),
	.green (sword_down2_green),
	.blue  (sword_down2_blue)
);


sword_down_3_rom sword_down_3_rom (
	.clock   (vga_clk),
	.address (sword_down3_address),
	.q       (sword_down3_q)
);

sword_down_3_palette sword_down_3_palette (
	.index (sword_down3_q),
	.red   (sword_down3_red),
	.green (sword_down3_green),
	.blue  (sword_down3_blue)
);



sword_down_4_rom sword_down_4_rom (
	.clock   (vga_clk),
	.address (sword_down4_address),
	.q       (sword_down4_q)
);

sword_down_4_palette sword_down_4_palette (
	.index (sword_down4_q),
	.red   (sword_down4_red),
	.green (sword_down4_green),
	.blue  (sword_down4_blue)
);








sword_left_1_rom sword_left_1_rom(
	.clock   (vga_clk),
	.address (sword_left1_address),
	.q       (sword_left1_q)
);

sword_left_1_palette sword_left_1_palette (
	.index (sword_left1_q),
	.red   (sword_left1_red),
	.green (sword_left1_green),
	.blue  (sword_left1_blue)
);






sword_left_2_rom sword_left_2_rom (
	.clock   (vga_clk),
	.address (sword_left2_address),
	.q       (sword_left2_q)
);

sword_left_2_palette sword_left_2_palette (
	.index (sword_left2_q),
	.red   (sword_left2_red),
	.green (sword_left2_green),
	.blue  (sword_left2_blue)
);





sword_left_3_rom sword_left_3_rom (
	.clock   (vga_clk),
	.address (sword_left3_address),
	.q       (sword_left3_q)
);

sword_left_3_palette sword_left_3_palette (
	.index (sword_left3_q),
	.red   (sword_left3_red),
	.green (sword_left3_green),
	.blue  (sword_left3_blue)
);







sword_left_4_rom sword_left_4_rom (
	.clock   (vga_clk),
	.address (sword_left4_address),
	.q       (sword_left4_q)
);

sword_left_4_palette sword_left_4_palette (
	.index (sword_left4_q),
	.red   (sword_left4_red),
	.green (sword_left4_green),
	.blue  (sword_left4_blue)
);



enemy_1_rom enemy_1_rom (
	.clock   (vga_clk),
	.address (enemy_1_address),
	.q       (enemy_1_q)
);

enemy_1_palette enemy_1_palette (
	.index (enemy_1_q),
	.red   (enemy1_red),
	.green (enemy1_green),
	.blue  (enemy1_blue)
);






knight_1_rom knight_1_rom (
	.clock   (vga_clk),
	.address (enemy_2_address),
	.q       (enemy_2_q)
);

knight_1_palette knight_1_palette (
	.index (enemy_2_q),
	.red   (enemy2_red),
	.green (enemy2_green),
	.blue  (enemy2_blue)
);






professor_rom professor_rom (
	.clock   (vga_clk),
	.address (enemy_3_address),
	.q       (enemy_3_q)
);

professor_palette professor_palette (
	.index (enemy_3_q),
	.red   (enemy3_red),
	.green (enemy3_green),
	.blue  (enemy3_blue)
);




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


















endmodule
