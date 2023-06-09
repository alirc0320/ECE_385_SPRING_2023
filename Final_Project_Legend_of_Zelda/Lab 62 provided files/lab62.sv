//-------------------------------------------------------------------------
//                                                                       --
//                                                                       --
//      For use with ECE 385 Lab 62                                       --
//      UIUC ECE Department                                              --
//-------------------------------------------------------------------------


module lab62 (
 
      ///////// Clocks /////////
      input     MAX10_CLK1_50, 

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,

      ///////// VGA /////////
      output             VGA_HS,
      output             VGA_VS,
      output   [ 3: 0]   VGA_R,
      output   [ 3: 0]   VGA_G,
      output   [ 3: 0]   VGA_B,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N 
		
		
	

);




logic Reset_h, vssig, blank, sync, VGA_Clk;


//=======================================================
//  REG/WIRE declarations
//=======================================================
	logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
	logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
	logic [1:0] signs;
	logic [1:0] hundreds;
	logic [9:0] drawxsig, drawysig, ballxsig, ballysig, ballsizesig;
	logic [7:0] Red, Blue, Green;
	logic [7:0] keycode;
	
	logic [9:0] drawxsig2, drawysig2, ballxsig2, ballysig2, ballsizesig2;
	logic [7:0] Red2, Blue2, Green2;
	
	
	
	
	logic [9:0] drawxsig3, drawysig3, ballxsig3, ballysig3, ballsizesig3;
	logic [7:0] Red3, Blue3, Green3;

	
	
	
	
	logic [9:0] drawxsig4, drawysig4, ballxsig4, ballysig4, ballsizesig4;
	logic [7:0] Red4, Blue4, Green4;
	
	
	
	
	logic [9:0] drawxsig5, drawysig5, ballxsig5, ballysig5, ballsizesig5;
	logic [7:0] Red5, Blue5, Green5;


//=======================================================
//  Structural coding
//=======================================================
	assign ARDUINO_IO[10] = SPI0_CS_N;
	assign ARDUINO_IO[13] = SPI0_SCLK;
	assign ARDUINO_IO[11] = SPI0_MOSI;
	assign ARDUINO_IO[12] = 1'bZ;
	assign SPI0_MISO = ARDUINO_IO[12];
	
	assign ARDUINO_IO[9] = 1'bZ; 
	assign USB_IRQ = ARDUINO_IO[9];
		
	//Assignments specific to Circuits At Home UHS_20
	assign ARDUINO_RESET_N = USB_RST;
	assign ARDUINO_IO[7] = USB_RST;//USB reset 
	assign ARDUINO_IO[8] = 1'bZ; //this is GPX (set to input)
	assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt
	
	//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
	assign ARDUINO_IO[6] = 1'b1;
	
	//HEX drivers to convert numbers to HEX output
	//HexDriver hex_driver4 (hex_num_4, HEX4[6:0]);
	//logic [3:0] red_debug;
//	HexDriver hex_driver4 (red_debug, HEX4[6:0]);
//	assign HEX4[7] = 1'b1;
//	
//	//HexDriver hex_driver3 (hex_num_3, HEX3[6:0]);
//	//logic [3:0] green_debug;
//	HexDriver hex_driver3 (flag_for_dying, HEX3[6:0]);
//	assign HEX3[7] = 1'b0;
//	
//	//HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
//	logic [3:0] blue_debug;
//	HexDriver hex_driver1 (blue_debug, HEX1[6:0]);
//	//assign HEX1[7] = 1'b1;
	//color_main before pedro
	logic debug;
	assign debug = 1;
	
	HexDriver hex_driver0 (debug_enemy_dead_4, HEX0[7:0]);
	//assign HEX0[7] = 1'b0;
	
	//fill in the hundreds digit as well as the negative sign
	assign HEX5 = {1'b1, ~signs[1], 3'b111, ~hundreds[1], ~hundreds[1], 1'b1};
	assign HEX2 = {1'b1, ~signs[0], 3'b111, ~hundreds[0], ~hundreds[0], 1'b1};
	
	
	//Assign one button to reset
	assign {Reset_h}=~ (KEY[0]);

	//Our A/D converter is only 12 bit
	assign VGA_R = Red[3:0]; //changed to bottom bit, from 7:4
	assign VGA_B = Blue[3:0];//changed to bottom bit, from 7:4
	assign VGA_G = Green[3:0];//changed to bottom bit, from 7:4
	
	
	lab62soc u0 (
		.clk_clk                           (MAX10_CLK1_50),  //clk.clk
		.reset_reset_n                     (1'b1),           //reset.reset_n
		.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
		.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
		.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
		.key_external_connection_export    (KEY),            //key_external_connection.export

		//SDRAM
		.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
		.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
		.sdram_wire_ba(DRAM_BA),                             //.ba
		.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
		.sdram_wire_cke(DRAM_CKE),                           //.cke
		.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
		.sdram_wire_dq(DRAM_DQ),                             //.dq
		.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
		.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
		.sdram_wire_we_n(DRAM_WE_N),                         //.we_n

		//USB SPI	
		.spi0_SS_n(SPI0_CS_N),
		.spi0_MOSI(SPI0_MOSI),
		.spi0_MISO(SPI0_MISO),
		.spi0_SCLK(SPI0_SCLK),
		
		//USB GPIO
		.usb_rst_export(USB_RST),
		.usb_irq_export(USB_IRQ),
		.usb_gpx_export(USB_GPX),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDR}),
		.keycode_export(keycode)
		
	 );
logic debugger;
logic collision;
logic dead;
logic LeReset;
logic flag_for_dying;
logic enemy_dead_flag;
logic enemy1_dead_flag;
logic enemy2_dead_flag;
logic enemy4_dead_flag; 
logic [32:0] color_main;
logic pedro; 
logic [32:0] first_map_flag;
logic [32:0] they_all_dead;
logic flag_for_game_over;
logic [32:0] flaggy_flag;
logic debug_enemy_dead;
logic debug_enemy_dead_2;
logic debug_enemy_dead_3;
logic everyone_is_dead;
logic debug_enemy_dead_4;

//logic [32:0] link_position;
//logic [32:0] link_position_Y;
//instantiate a vga_controller, ball, and color_mapper here with the ports.

//in the reset_h do not or it so remove this after this test
vga_controller vga(.Clk(MAX10_CLK1_50), .Reset(Reset_hs), .hs(VGA_HS), .vs(VGA_VS), .pixel_clk(VGA_Clk), 
.blank(blank), .sync(sync), .DrawX(drawxsig), .DrawY(drawysig));


sprite sprite0(.collision(collision), .red(Red), .green(Green), .blue(Blue), .Reset(Reset_h || LeReset), .frame_clk(VGA_VS), .keycode(keycode), 
.spriteX(ballxsig), .spriteY(ballysig), .spriteS(ballsizesig), .dead(dead),
.color_main(color_main), .first_map_flag(first_map_flag), .enemy_dead_flag(enemy_dead_flag),
.enemy1_dead_flag(enemy1_dead_flag), .enemy2_dead_flag(enemy2_dead_flag)

);
//.link_position(link_position), .link_position_Y(link_position_Y)
 

zelda_example zelda( .Reset(Reset_h || LeReset), .blue_debug(blue_debug), 
.green_debug(green_debug), .red_debug(red_debug), .collision(collision), 
.keycode(keycode), .spriteX(ballxsig), .spriteY(ballysig), 
.sprite_size(ballsizesig),  .blank(blank), .DrawX(drawxsig), 
.DrawY(drawysig), .vga_clk(VGA_Clk), .red(Red), .green(Green),
 .blue(Blue), .enemy_X(ballxsig2), .enemy_Y(ballysig2), 
 .enemy_size(ballsizesig2), .dead(dead), .flag_for_dying(flag_for_dying)
, .enemy_dead_flag(enemy_dead_flag), .enemy_X1(ballxsig3), .enemy_Y1(ballysig3), 
 .enemy_size1(ballsizesig3), .enemy1_dead_flag(enemy1_dead_flag),
 .enemy_X2(ballxsig4), .enemy_Y2(ballysig4), 
 .enemy_size2(ballsizesig4), .enemy2_dead_flag(enemy2_dead_flag), .color_main(color_main),
 .first_map_flag(first_map_flag), .they_all_dead(they_all_dead), .debugger(debugger),
 .debug_enemy_dead_3(debug_enemy_dead_3), .debug_enemy_dead_2(debug_enemy_dead_2),
 .debug_enemy_dead(debug_enemy_dead), .everyone_is_dead(everyone_is_dead),
 .enemy_X4(ballxsig5), .enemy_Y4(ballysig5), 
 .enemy_size4(ballsizesig5), .enemy4_dead_flag(enemy4_dead_flag),
 .debug_enemy_dead_4(debug_enemy_dead_4)
 
 ); 
	 //.link_position(link_position), .link_position_Y(link_position_Y)
 
	 
//enemy_1_example enemy(.DrawX(drawxsig2), .DrawY(drawysig2), .enemyX(ballxsig2), .enemyY(ballysig2), .enemy_size(ballsizesig2), .vga_clk(VGA_Clk), .Reset(Reset_h), .red(Red), .green(Green), .blue(Blue));	 

enemy_ball enemy0(.frame_clk(VGA_VS),.Reset(Reset_h || LeReset), 
.keycode(keycode), .enemy_X(ballxsig2), .enemy_Y(ballysig2), 
.enemy_S(ballsizesig2), .dead(dead), .enemy_dead_flag(enemy_dead_flag),
.debug_enemy_dead(debug_enemy_dead_3)


);



enemy2_ball enemy1(.frame_clk(VGA_VS),.Reset(Reset_h || LeReset), 
.keycode(keycode), .enemy_X(ballxsig3), .enemy_Y(ballysig3), 
.enemy_S(ballsizesig3), .dead(dead), .enemy_dead_flag(enemy1_dead_flag),
.debug_enemy_dead(debug_enemy_dead_2)

);



enemy3_ball enemy2(.frame_clk(VGA_VS),.Reset(Reset_h || LeReset), 
.keycode(keycode), .enemy_X(ballxsig4), .enemy_Y(ballysig4), 
.enemy_S(ballsizesig4), .dead(dead), .enemy_dead_flag(enemy2_dead_flag),
.debug_enemy_dead(debug_enemy_dead)

);




enemy4_ball enemy5(.frame_clk(VGA_VS),.Reset(Reset_h || LeReset), 
.keycode(keycode), .enemy_X(ballxsig5), .enemy_Y(ballysig5), 
.enemy_S(ballsizesig5), .dead(dead), .enemy_dead_flag(enemy4_dead_flag),
.debug_enemy_dead(debug_enemy_dead_4),
);

//.debug_enemy_dead(debug4_enemy_dead)
//
//.enemy_dead_flag(enemy2_dead_flag),
//.debug_enemy_dead(debug_enemy_dead)



ISDU dead0(.Clk(VGA_VS), .dead(dead), .keycode(keycode), .die_reset(LeReset));
	





endmodule 
