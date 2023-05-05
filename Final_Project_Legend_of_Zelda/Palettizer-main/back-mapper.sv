module back_mapper (
	input logic [9:0] DrawX, DrawY, LinkX, LinkY, LinkS,
	input logic vga_clk, blank,
	input logic [7:0] keycode,
	output logic [3:0] red, green, blue
);

// logic instantiation for the backround 

logic [19:0] rom_address;
logic [4:0] rom_q;

logic [3:0] palette_red, palette_green, palette_blue;

assign rom_address = (DrawX*640/640) + (DrawY*480/480 * 640);

logic [9:0] Link_DistX, Link_DistY;
assign Link_DistX = DrawX - LinkX;
assign Link_DistY = DrawY - LinkY;



//This will ne used universally throught all of the sprites. 
/////////////////////////////////////
always_ff @ (posedge vga_clk) begin
	red <= 4'h0;
	green <= 4'h0;
	blue <= 4'h0;
	if (blank) begin
		red <= palette_red;
		green <= palette_green;
		blue <= palette_blue;
		case(keycode)
		8'h16:begin //down  
			if(Link_DistX < LinkS && Link_DistY < LinkS) begin
				red <= link_red;
				green <= link_green;
				blue <= link_blue;
			end
		end
		8'h1A: begin //up
			if(Link_DistX < LinkS && Link_DistY < LinkS) begin
				red <= linkup_red;
				green <= linkup_green;
				blue <= linkup_blue;
			end
		end
		8'h07: begin //right
			if(Link_DistX < LinkS && Link_DistY < LinkS) begin
				red <= linkright_red;
				green <= linkright_green;
				blue <= linkright_blue;
			end
		end
		8'h04: begin //left
			if(Link_DistX < LinkS && Link_DistY < LinkS) begin
				red <= linkleft_red;
				green <= linkleft_green;
				blue <= linkleft_blue;
			end
		end
		default: begin
			if(Link_DistX < LinkS && Link_DistY < LinkS) begin
				red <= link_red;
				green <= link_green;
				blue <= link_blue;
			end
		end
	endcase
end
	
end

///////////////////////////////////

//placeholder
//always_ff @ (posedge vga_clk) begin
//	red <= 4'h0;
//	green <= 4'h0;
//	blue <= 4'h0;
//	if (blank) begin
//		red <= palette_red;
//		green <= palette_green;
//		blue <= palette_blue;
//		if(Link_DistX < LinkS && Link_DistY < LinkS) begin
//			red <= link_red;
//			green <= link_green;
//			blue <= link_blue;
//		end
//	end
//	
//end

/////////////////////////
back_rom back_rom (
	.clock   (vga_clk),
	.address (rom_address),
	.q       (rom_q)
);

back_palette back_palette (
	.index (rom_q),
	.red   (palette_red),
	.green (palette_green),
	.blue  (palette_blue)
);


//logic instantiation for link DOWN AND STATIONARY

logic [3:0] link_red, link_green, link_blue;
logic [10:0] rom_address_link;
logic [6:0] rom_q_link;


assign rom_address_link = ((DrawX-LinkX) + (DrawY - LinkY) * 32);
//assign rom_address_link = (DrawX) + (DrawY);


link32_rom link_rom(
	.clock	(vga_clk),
	.address	(rom_address_link),
	.q			(rom_q_link)
);

link32_palette link_palette(
	.index  (rom_q_link),
	.red	  (link_red),
	.green  (link_green),
	.blue   (link_blue)
);



//logic instantiation for link UP 
logic [3:0] linkup_red, linkup_green, linkup_blue;
logic [10:0] rom_address_linkup;
logic [6:0] rom_q_linkup;

assign rom_address_linkup = ((DrawX-LinkX) + (DrawY - LinkY) * 32);

linkUp_rom linkUp_rom (
	.clock   (vga_clk),
	.address (rom_address_linkup),
	.q       (rom_q_linkup)
);

linkUp_palette linkUp_palette (
	.index (rom_q_linkup),
	.red   (linkup_red),
	.green (linkup_green),
	.blue  (linkup_blue)
);




//logic instantiation for link RIGHT

logic [3:0] linkright_red, linkright_green, linkright_blue;
logic [10:0] rom_address_linkright;
logic [6:0] rom_q_linkright;


assign rom_address_linkright = ((DrawX-LinkX) + (DrawY - LinkY) * 32);


linkRight_rom linkRight_rom (
	.clock   (vga_clk),
	.address (rom_address_linkright),
	.q       (rom_q_linkright)
);

linkRight_palette linkRight_palette (
	.index (rom_q_linkright),
	.red   (linkright_red),
	.green (linkright_green),
	.blue  (linkright_blue)
);



//logic instantiation for link LEFT
logic [3:0] linkleft_red, linkleft_green, linkleft_blue;
logic [10:0] rom_address_linkleft;
logic [6:0] rom_q_linkleft;

assign rom_address_linkleft = ((DrawX-LinkX) + (DrawY - LinkY) * 32);


linkLeft_rom linkLeft_rom (
	.clock   (vga_clk),
	.address (rom_address_linkleft),
	.q       (rom_q_linkleft)
);

linkLeft_palette linkLeft_palette (
	.index (rom_q_linkleft),
	.red   (linkleft_red),
	.green (linkleft_green),
	.blue  (linkleft_blue)
);




endmodule 