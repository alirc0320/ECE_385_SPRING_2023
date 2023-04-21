module zelda_example (
	input logic [9:0] DrawX, DrawY, spriteX, spriteY, sprite_size, //added spriteX, spriteY, sprite_size
	input [7:0] keycode, 
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

















logic [6:0] rom_q;
logic [3:0] right_1_rom_q;
//logic [3:0] up_1_rom_q;
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

logic sprite_on;
logic [9:0]DistX, DistY, Size;
assign DistX = DrawX - spriteX;
assign DistY = DrawY - spriteY;





 always_comb
    begin:sprite_on_proc
        if ((DrawX >= spriteX - sprite_size) && (DrawX <= spriteX + sprite_size) && (DrawY >= spriteY - sprite_size) && (DrawY <= spriteY + sprite_size))

            sprite_on = 1'b1;
        else 
            sprite_on = 1'b0;
     end 




assign rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign right_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign left_1_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign zelda_right_2_rom_address = ((DrawX-spriteX) + (DrawY-spriteY)*32);
assign final_bc_address = ((DrawX * 500) / 640) + (((DrawY * 500) / 480) * 500); 

//assign red_debug = final_bc_red;
//assign green_debug = final_bc_green;
//assign blue_debug = final_bc_blue;





always_ff @ (posedge vga_clk) begin
	red <= 4'h0; //default black 
	green <= 4'h0; //default black 
	blue <= 4'h0; //default black 
	if (DrawX == 0 && DrawY == 0)
		collision <= 0;	

	
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

	 case (keycode)
	
	8'h07 : begin //right
	
	if (DistX < sprite_size && DistY < sprite_size)
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
	
	end //ends when u release key
		
	
	
	
	8'h1A : begin //up
	if (DistX < sprite_size && DistY < sprite_size)
	if(up1_red != 4'h7 && up1_green != 4'h7 && up1_blue != 4'h7 )
	 begin 
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
	end
		
		
	
	
	8'h04 : begin //left
		
	if (DistX < sprite_size && DistY < sprite_size)
	if(left1_red != 4'h0 && left1_green != 4'h0 && left1_blue != 4'h0 )
	 begin
		red <= left1_red;
		green <= left1_green;
		blue <= left1_blue;
		
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
					       
	end //end keycode case
	
		
	8'h16 : begin //down
		
	if (DistX < sprite_size && DistY < sprite_size)
	if(down1_red != 4'h0 && down1_green != 4'h0 && down1_blue != 4'h0 )
	if(down1_red != 4'h1 && down1_green != 4'h0 && down1_blue != 4'h0 )
	 begin
	 
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
	
	end //end keycode case
		
	default: begin 	
		

		
	if (DistX < sprite_size && DistY < sprite_size)
	if(left1_red != 4'h0 && left1_green != 4'h0 && left1_blue != 4'h0 )
	if(left1_red != 4'h1 && left1_green != 4'h0 && left1_blue != 4'h0 )
	begin //changed blank
		red <= left1_red;
		green <= left1_green;
		blue <= left1_blue;
	end
end




endcase //end all the keycode cases 

end  //always_ff end 


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


endmodule


	 
    





