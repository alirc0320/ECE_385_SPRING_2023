module zelda_example (
	input logic [9:0] DrawX, DrawY, spriteX, spriteY, sprite_size, //added spriteX, spriteY, sprite_size
	input [7:0] keycode, 
	input logic vga_clk, blank,
	output logic [3:0] red, green, blue,
	output logic [3:0] up_1_palette_red, up_1_palette_green, up_1_palette_blue,
	output logic collision,
	output logic [3:0] red_debug, green_debug, blue_debug
);

logic [10:0] rom_address;
//logic [17:0] background_rom_address;
logic [9:0]  right_1_rom_address;
logic [9:0]  up_1_rom_address; 
logic [17:0]  bc_2_rom_address; 

logic [9:0]  left_1_rom_address;
logic [9:0]  zelda_right_2_rom_address;
logic [17:0] background_col_rom_address;
//////////////////////////////////////////////////////////
logic [6:0] rom_q;
//logic [6:0] background_rom_q;
logic [3:0] right_1_rom_q;
logic [3:0] up_1_rom_q;
logic [3:0] bc_2_rom_q;
logic [3:0] left_1_rom_q;
logic [3:0] zelda_right_2_rom_q;
logic variable;
logic [6:0] background_col_rom_q;
////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////
logic [3:0] palette_red, palette_green, palette_blue;
//logic [3:0] background_palette_red, background_palette_green, background_palette_blue;
logic [3:0] right_1_palette_red, right_1_palette_green, right_1_palette_blue;
//logic [3:0] up_1_palette_red, up_1_palette_green, up_1_palette_blue;
logic [3:0] left_1_palette_red, left_1_palette_green, left_1_palette_blue;
logic [3:0] zelda_right_2_palette_red, zelda_right_2_palette_green, zelda_right_2_palette_blue;
logic [3:0] bc_red, bc_green, bc_blue;
logic [3:0] bc_red1, bc_green1, bc_blue1;

logic sprite_on;//new
logic [9:0]DistX, DistY, Size;//new
assign DistX = DrawX - spriteX;//new
assign DistY = DrawY - spriteY;//new
//assign Size = sprite_size;//new




 always_comb
    begin:sprite_on_proc
        if ((DrawX >= spriteX - sprite_size) && (DrawX <= spriteX + sprite_size) && (DrawY >= spriteY - sprite_size) && (DrawY <= spriteY + sprite_size))

            sprite_on = 1'b1;
        else 
            sprite_on = 1'b0;
     end 



//assign rom_address = ((DrawX * 10) / 20) + (((DrawY * 10) / 15) * 10);
assign rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
//assign background_rom_address = ((DrawX * 500) / 640) + (((DrawY * 500) / 480) * 500);//background covers whole page
assign right_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
//assign up_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign left_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign zelda_right_2_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign up_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);

assign background_col_rom_address = ((DrawX * 500) / 640) + (((DrawY * 500) / 480) * 500);


assign bc_2_rom_address = ((spriteX * 500) / 640) + (((spriteY * 500) / 480) * 500);

assign red_debug = bc_red1;
assign green_debug = bc_green1;
assign blue_debug = bc_blue1;
 






always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;
	collision <= 0;	

	
	if(blank) 
	begin//draw background collision 
		   red <= bc_red;
			green <= bc_green;
			blue <= bc_blue;

				
	 
	end

	 case (keycode)
	8'h07 : begin
	while(1 == 1);
	begin
	variable = 1;
	if (DistX < sprite_size && DistY < sprite_size)
	 if (sprite_on == 1'b1 ) //draw sprite
	 begin
	 if(variable == 1'b1)
	 begin //changed blank
		red <= right_1_palette_red;
		green <= right_1_palette_green;
		blue <= right_1_palette_blue;
		variable = 1'b0;
	end
	
	if (variable == 1'b0);
	 begin //changed blank
		red <= zelda_right_2_palette_red;
		green <= zelda_right_2_palette_green;
		blue <= zelda_right_2_palette_blue;
	end
	
	end
	
	
	
	end							
		
		end //ends when u release key
		
		
		
		
	
	
	
	
		
	8'h1A : begin
	
	 if (bc_red1 == 4'hB && bc_green1 == 4'h3  && bc_blue1 == 4'hB  ) //not working
	   collision <= 1;
	
	if (DistX < sprite_size && DistY < sprite_size)
	 
	 //if(sprite_on == 1'b1)
	 begin 
		
		
		red <= up_1_palette_red;
		green <= up_1_palette_green;
		blue <= up_1_palette_blue;
		
	end
					       
	end
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	8'h04 : begin
		
	if (DistX < sprite_size && DistY < sprite_size)
	 if ((sprite_on == 1'b1)) //draw sprite
	 begin //changed blank
		red <= left_1_palette_red;
		green <= left_1_palette_green;
		blue <= left_1_palette_blue;
	end
					       
	end
	
		
	8'h16 : begin
		
	if (DistX < sprite_size && DistY < sprite_size)
	 if (sprite_on == 1'b1 && palette_red != 8'h07  && palette_green != 8'h07 && palette_blue != 8'h06 ) //draw sprite
	 begin //changed blank
		red <= palette_red;
		green <= palette_green;
		blue <= palette_blue;
	end
					       
	end
		
	default: begin 	
		

	if (DistX < sprite_size && DistY < sprite_size)
	 if (sprite_on == 1'b1 && palette_red != 8'h07  && palette_green != 8'h07 && palette_blue != 8'h06 ) //draw sprite

	begin //changed blank
		red <= palette_red;
		green <= palette_green;
		blue <= palette_blue;
	end
end




endcase 













end
	   
		
		
		
		
		
		


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




//background_rom background_rom (
//	.clock   (vga_clk),
//	.address (background_rom_address),
//	.q       (background_rom_q)
//);
//
//background_palette background_palette (
//	.index (background_rom_q),
//	.red   (background_palette_red),
//	.green (background_palette_green),
//	.blue  (background_palette_blue)
//);
	
background_collision_rom background_collision_rom (
	.clock   (vga_clk),
	.address (background_col_rom_address),
	.q       (background_col_rom_q),
	
	.q_collision(bc_2_rom_q),
	.collision_address(bc_2_rom_address)
);


background_collision_palette background_collision_palette (
	.index (background_col_rom_q),
	.red   (bc_red),
	.green (bc_green),
	.blue  (bc_blue),
	
	.index2 (bc_2_rom_q),
	.red1 (bc_red1),
	.green1(bc_green1),
	.blue1(bc_blue1)
);











zelda_right_1_rom zelda_right_1_rom (
	.clock   (vga_clk),
	.address (right_1_rom_address),
	.q       (right_1_rom_q)
);

zelda_right_1_palette zelda_right_1_palette (
	.index (right_1_rom_q),
	.red   (right_1_palette_red),
	.green (right_1_palette_green),
	.blue  (right_1_palette_blue)
);


zelda_up_1_rom zelda_up_1_rom (
	.clock   (vga_clk),
	.address (up_1_rom_address),
	.q       (up_1_rom_q),
);




zelda_up_1_palette zelda_up_1_palette (
	.index (up_1_rom_q),
	.red   (up_1_palette_red),
	.green (up_1_palette_green),
	.blue  (up_1_palette_blue)
	
	
	
);
	

zelda_left_1_rom zelda_left_1_rom (
	.clock   (vga_clk),
	.address (left_1_rom_address),
	.q       (left_1_rom_q)
	
	
	
	
);

zelda_left_1_palette zelda_left_1_palette (
	.index (left_1_rom_q),
	.red   (left_1_palette_red),
	.green (left_1_palette_green),
	.blue  (left_1_palette_blue)
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

endmodule


	 
    





