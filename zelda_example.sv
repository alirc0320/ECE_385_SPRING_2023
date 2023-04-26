module zelda_example (
	input logic [9:0] DrawX, DrawY, spriteX, spriteY, sprite_size, //added spriteX, spriteY, sprite_size
	input [7:0] keycode, 
	input Reset,
	input logic vga_clk, blank,
	output logic [3:0] red, green, blue,
	output logic collision,
	output logic [3:0] red_debug, green_debug, blue_debug
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
assign final_bc_address = ((DrawX * 500) / 640) + (((DrawY * 500) / 480) * 500); 
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
	else if (count > 1200000)//100000
	begin
		cur_state <= next_state;
		flag <= 1'b1;
	end
	
	else
		flag <= 1'b0;
end	


always_ff @ (posedge vga_clk)

	
	



begin

red <= 4'h0; //default black 
	green <= 4'h0; //default black 
	blue <= 4'h0; //default black 
	if (DrawX == 0 && DrawY == 0)
		collision <= 0;	
//stop deleting
	
	if(blank)  
	begin
		   red <= final_bc_red; //if blank draw background
			green <= final_bc_green;
			blue <= final_bc_blue; 
	end
	
	
if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
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

	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
begin
red <= 4'hE; 
green <= 4'hD;
blue <= 4'hA;
end
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
	if (DistX < sprite_size && DistY < sprite_size)
	if(final_down2_red != 4'hF && final_down2_green != 4'hF && final_down2_blue != 4'hF )
	 begin
	  down = 1;
  right = 0;
	  up = 0;
	  left = 0;
		red <= final_down2_red;
		green <= final_down2_green;
		blue <= final_down2_blue;	
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
	
	
	
	not_movingdown:
		
		begin
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
else 
down = 0; 	
			
		end
	
	
	
	
	not_movingleft:
		
		begin
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
		if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 )))
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
		
		
		
	not_movingright:
		
		begin
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
		if ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 )))
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
	
	not_movingup:
		
		begin
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
		
		if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	

	end
else 
up = 0;	
		end
	
	
	
	
	// add first motion palette RGB
	s_leftone:
		begin
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
		if ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28 )) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 24 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 20 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 16 ))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 12 ))) ||
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 8 ))) ||	((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 4 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size))) || ((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-4) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-8) == DrawX) && (spriteY + (sprite_size - 28 ))) || ((spriteX + (sprite_size-12) == DrawX) && (spriteY + (sprite_size - 28 ))) ||
		((spriteX + (sprite_size-16) == DrawX) && (spriteY + (sprite_size - 28 ))) ||	((spriteX + (sprite_size-20) == DrawX) && (spriteY + (sprite_size - 28 )))	||													
		((spriteX + (sprite_size-24) == DrawX) && (spriteY + (sprite_size - 28))) || ((spriteX + (sprite_size-28) == DrawX) && (spriteY + (sprite_size - 28))) 	 		) 
	
		begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 

	end
	else 
	left = 0;
		end
		
	s_lefttwo:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 

	end
	else left = 0;
		end
	
   // add second motion palette RGB	
	s_leftthree:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 

	end
	else 
	left = 0;
		end
		
	s_leftfour:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	 

	end
	else 
	left = 0; 
		end
		
	// add first motion palette RGB		
	s_rightone:
		begin
		right = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_right2_red != 4'hF && final_right2_green != 4'hF && final_right2_blue != 4'hF )
	 begin 
		red <= final_right2_red;
		green <= final_right2_green;
		blue <= final_right2_blue;
		if ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 )))
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
		
	s_righttwo:
		begin
		right = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(final_right2_red != 4'hF && final_right2_green != 4'hF && final_right2_blue != 4'hF )
	 begin 
	 
		red <= final_right2_red;
		green <= final_right2_green;
		blue <= final_right2_blue;
		if ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 )))
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
		
   // add second motion palette RGB
	s_rightthree:
		begin
		right = 1;
	if (DistX< sprite_size && DistY< sprite_size)
	if(right1_red != 4'h0 && right1_green != 4'h0 && right1_blue != 4'h0 )
	 begin 
	 
		red <= right1_red;
		green <= right1_green;
		blue <= right1_blue;
		if ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 )))
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
		
	s_rightfour:
		begin
		right = 1;
		if (DistX < sprite_size && DistY < sprite_size)
	if(right1_red != 4'h0 && right1_green != 4'h0 && right1_blue != 4'h0 )
	 begin 
	 right = 1;
		red <= right1_red;
		green <= right1_green;
		blue <= right1_blue;
		if ((spriteX + (sprite_size-2) == DrawX) && (spriteY + (sprite_size - 28 )))
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
		
	// add first motion palette RGB	
	s_upone:
		begin
		if (DistX < sprite_size && DistY < sprite_size)
	if(up1_red != 4'h7 && up1_green != 4'h7 && up1_blue != 4'h7 )
	 begin
	up = 1; 
		red <= up1_red;
		green <= up1_green;
		blue <= up1_blue;
		
		if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		
		begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	

	end
else 
up = 0;	
		end
		
	s_uptwo:
		begin
		if (DistX < sprite_size && DistY < sprite_size)
	if(up1_red != 4'h7 && up1_green != 4'h7 && up1_blue != 4'h7 )
	 begin 
	 up = 1;
		red <= up1_red;
		green <= up1_green;
		blue <= up1_blue;
		
		if((spriteX + (sprite_size/2) == DrawX) && (spriteY + (sprite_size - 28 ) == DrawY))
		begin
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	

	end
else 
up = 0;	
		end

   // add second motion palette RGB		
	s_upthree:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	

	end
else 
up = 0;	
		end
	
	s_upfour:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	

	end	
else up = 0; 	
		end

	// add first motion palette RGB		
	s_downone:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end	
else 
down = 0;	
		end
		
	s_downtwo:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end	
else 
down = 0;	
		end
		
   // add second motion palette RGB	
	s_downthree:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end
else 
down = 0; 	
		end
		
	s_downfour:
		begin
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
	if(final_bc_red == 4'hB && final_bc_green == 4'h4 && final_bc_blue == 4'h7)
	collision <= 1;
	
	if(final_bc_red == 4'hD && final_bc_green == 4'h8 && final_bc_blue == 4'hA)
	collision <= 1;
	
	if(final_bc_red == 4'hF && final_bc_green == 4'hC && final_bc_blue == 4'hC)
	collision <= 1;
	end	
	
	end
else 
down = 0; 	
		end
	
	
	
	
	
	
	
	
	sword_right1:
		begin
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
	
	

	
	
	
	

	
	
	
	
	
	
	
	sword_right2:
		begin
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
		
		
		
		
		
		
		
		
		
	sword_right3:
		begin
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
	
	
	
	
	
	sword_right4:
		begin
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
	
	
	
	sword_right5:
		begin
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
		

	
	
	
	sword_right6:
		begin
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
	
	
	
	
	
	
	
	sword_right7:
		begin
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
	
	
	
	
	
	sword_right8:
		begin
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
		
///////////////////////////upsword//////////////////////////////////////////////	
		
		
	sword_up1:
		begin
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
	
	

	
	
	
	

	
	
	
	
	
	
	
	sword_up2:
		begin
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
		
		
		
		
		
		
		
		
		
	sword_up3:
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
	
	
	
	
	
	sword_up4:
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
	
	
	
	sword_up5:
		begin
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
		

	
	
	
	sword_up6:
		begin
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
	
	
	
	
	
	
	
	sword_up7:
		begin
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
	
	
	
	
	
	sword_up8:
		begin
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
		
//////////////////////upsword////////////////////////////////////////////////////////	
		
		
		
		
		
		
		
///////////////////////////downsword//////////////////////////////////////////////	
		
		
	sword_down1:
		begin
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
	
	

	
	
	
	

	
	
	
	
	
	
	
	sword_down2:
		begin
		
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
		
		
		
		
		
		
		
		
		
	sword_down3:
		begin
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
	
	
	
	
	
	sword_down4:
		begin
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
	
	
	
	sword_down5:
		begin
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
		

	
	
	
	sword_down6:
		begin
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
	
	
	
	
	
	
	
	sword_down7:
		begin
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
	
	
	
	
	
	sword_down8:
		begin
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
				
	
//////////////////////downsword////////////////////////////////////////////////////////	
		
		

		
///////////////////////////leftsword//////////////////////////////////////////////	
		
		
	sword_left1:
		begin
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
	
	

	
	
	
	

	
	
	
	
	
	
	
	sword_left2:
		begin
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
		
		
		
		
		
		
		
		
		
	sword_left3:
		begin
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
	
	
	
	
	
	sword_left4:
		begin
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
	
	
	
	sword_left5:
		begin
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
		

	
	
	
	sword_left6:
		begin
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
	
	
	
	
	
	
	
	sword_left7:
		begin
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
	
	
	
	
	
	sword_left8:
		begin
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
				
	
//////////////////////leftsword////////////////////////////////////////////////////////	
				
		
		
	
		
	endcase
end


Final_background_rom Final_background_rom (
	.clock   (vga_clk),
	.address (final_bc_address),
	.q       (final_bc_q)
);

Final_background_palette Final_background_palette (
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
























endmodule
