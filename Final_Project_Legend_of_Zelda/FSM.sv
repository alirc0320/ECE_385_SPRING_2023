//module fsm();
//
//enum logic [5:0] { not_moving, s_upone, s_uptwo, s_upthree, s_upfour,
//						 s_downone, s_downtwo, s_downthree, s_downfour,
//						 s_leftone, s_lefttwo, s_leftthree, s_leftfour,
//						 s_rightone, s_righttwo, s_rightthree, s_rightfour} cur_state, next_state;
//						 
//						 
//reg [31:0] count;
//
//logic flag;
//
//
//
//
//// similar to guard_control module set up
//always@(posedge vga_clk)
//begin
//	if(flag) 
//		count <= 0;
//	
//	else
//		count <= count + 1;
//end
//
//
//always_ff @ (posedge vga_clk or posedge Reset)
//begin
//	if (Reset)
//	begin
//		cur_state <= not_moving;
//		flag <= 1'b0;
//	end
//	else if (count > 100000)
//	begin
//		cur_state <= next_state;
//		flag <= 1'b1;
//	end
//	
//	else
//		flag <= 1'b0;
//end	
//
//
//always_comb
//begin
//	// Maintain position at default state
//	next_state = cur_state;
//	
//	// default variable instantiations
//	// for left sprite 
//	s_redleft 	 = slpalette_red;
//	s_greenleft = slpalette_green;
//	s_blueleft  = slpalette_blue;
//	
//	// for right sprite
//	s_redright   = srpalette_red;
//	s_greenright = srpalette_green; 
//	s_blueright  = srpalette_blue;
//	
//	// for up sprite
//	s_redup 	 = supalette_red;
//	s_greenup = supalette_green; 
//	s_blueup  = supalette_blue;	
//	
//	// for down sprite
//	s_reddown 	= sdpalette_red;
//	s_greendown = sdpalette_green; 
//	s_bluedown  = sdpalette_blue;	
//
//	
//
//
//	unique case (cur_state)
//	not_moving: 
//		case(keycode)
//		
//		// left
//		8'h04 : begin	
//			next_state = s_leftone;
//		end
//		
//		// right
//		8'h07 : begin
//			next_state = s_rightone;
//		end
//		
//		// down	
//		8'h16 : begin
//			next_state = s_downone;
//		end
//		
//		// up 
//		8'h1A : begin
//			next_state = s_upone;
//		end	
//		
//		default: begin
//			next_state = not_moving;
//			
//		end
//	endcase
//	
//	// Left movement sprite: one -> two -> three -> four
//	s_leftone:
//		if (keycode == 8'h04)
//			next_state = s_lefttwo;
//			
//		else
//			next_state = not_moving;
//			
//	s_lefttwo:
//		if (keycode == 8'h04)
//			next_state = s_leftthree;
//			
//		else
//			next_state = not_moving;
//			
//	s_leftthree:
//		if (keycode == 8'h04)
//			next_state = s_leftfour;
//			
//		else
//			next_state = not_moving;
//			
//	s_leftfour:
//		if (keycode == 8'h04)
//			next_state = s_leftone;
//			
//		else
//			next_state = not_moving;
//	
//	// Right movement sprite: one -> two -> three -> four
//	s_rightone:
//		if (keycode == 8'h07)
//			next_state = s_righttwo;
//			
//		else
//			next_state = not_moving;
//			
//	s_righttwo:
//		if (keycode == 8'h07)
//			next_state = s_rightthree;
//			
//		else
//			next_state = not_moving;
//			
//	s_rightthree:
//		if (keycode == 8'h07)
//			next_state = s_rightfour;
//			
//		else
//			next_state = not_moving;
//			
//	s_rightfour:
//		if (keycode == 8'h07)
//			next_state = s_rightone;
//			
//		else
//			next_state = not_moving;
//			
//	// Up movement sprite: one -> two -> three -> four
//	s_upone:
//		if (keycode == 8'h1A)
//			next_state = s_uptwo;
//			
//		else
//			next_state = not_moving;
//			
//	s_uptwo:
//		if (keycode == 8'h1A)
//			next_state = s_upthree;
//			
//		else
//			next_state = not_moving;
//			
//	s_upthree:
//		if (keycode == 8'h1A)
//			next_state = s_upfour;
//			
//		else
//			next_state = not_moving;
//			
//	s_upfour:
//		if (keycode == 8'h1A)
//			next_state = s_upone;
//			
//		else
//			next_state = not_moving;
//			
//			
//			
//	// Down movement sprite: one -> two -> three -> four
//	s_downone:
//		if (keycode == 8'h16)
//			next_state = s_downtwo;
//			
//		else
//			next_state = not_moving;
//			
//	s_downtwo:
//		if (keycode == 8'h16)
//			next_state = s_downthree;
//			
//		else
//			next_state = not_moving;
//			
//	s_downthree:
//		if (keycode == 8'h16)
//			next_state = s_downfour;
//			
//		else
//			next_state = not_moving;
//			
//	s_downfour:
//		if (keycode == 8'h16)
//			next_state = s_downone;
//			
//		else
//			next_state = not_moving;
//	endcase
//	
//	case(cur_state)
//	
//	// Stationary one
//	not_moving:
//		begin
//			s_reddown = sdpalette_red;
//			s_greendown = sdpalette_green;
//			s_bluedown = sdpalette_blue;
//		end
//	
//	// add first motion palette RGB
//	s_leftone:
//		begin
//		s_redleft  = slpalette_red;
//		s_greenleft = slpalette_green;
//		s_blueleft = slpalette_blue;
//		end
//		
//	s_lefttwo:
//		begin
//		s_redleft  = slpalette_red;
//		s_greenleft = slpalette_green;
//		s_blueleft = slpalette_blue;
//		end
//	
//   // add second motion palette RGB	
//	s_leftthree:
//		begin
//		s_redleft  = sl2palette_red;
//		s_greenleft = sl2palette_green;
//		s_blueleft = sl2palette_blue;
//		end
//		
//	s_leftfour:
//		begin
//		s_redleft  = sl2palette_red;
//		s_greenleft = sl2palette_green;
//		s_blueleft = sl2palette_blue;
//		end
//		
//	// add first motion palette RGB		
//	s_rightone:
//		begin
//		s_redright = srpalette_red;
//		s_greenright = srpalette_green;
//		s_blueright = srpalette_blue;
//		end
//		
//	s_righttwo:
//		begin
//		s_redright = srpalette_red;
//		s_greenright = srpalette_green;
//		s_blueright = srpalette_blue;
//		end
//		
//   // add second motion palette RGB
//	s_rightthree:
//		begin
//		s_redright = sr2palette_red;
//		s_greenright = sr2palette_green;
//		s_blueright = sr2palette_blue;
//		end
//		
//	s_rightfour:
//		begin
//		s_redright = sr2palette_red;
//		s_greenright = sr2palette_green;
//		s_blueright = sr2palette_blue;
//		end
//		
//	// add first motion palette RGB	
//	s_upone:
//		begin
//		s_redup = supalette_red;
//		s_greenup = supalette_green;
//		s_blueup = supalette_blue;
//		end
//		
//	s_uptwo:
//		begin
//		s_redup = supalette_red;
//		s_greenup = supalette_green;
//		s_blueup = supalette_blue;
//		end
//
//   // add second motion palette RGB		
//	s_upthree:
//		begin
//		s_redup = su2palette_red;
//		s_greenup = su2palette_green;
//		s_blueup = su2palette_blue;
//		end
//	
//	s_upfour:
//		begin
//		s_redup = su2palette_red;
//		s_greenup = su2palette_green;
//		s_blueup = su2palette_blue;
//		end
//
//	// add first motion palette RGB		
//	s_downone:
//		begin
//		s_reddown = sdpalette_red;
//		s_greendown = sdpalette_green;
//		s_bluedown = sdpalette_blue;
//		end
//		
//	s_downtwo:
//		begin
//		s_reddown = sdpalette_red;
//		s_greendown = sdpalette_green;
//		s_bluedown = sdpalette_blue;
//		end
//		
//   // add second motion palette RGB	
//	s_downthree:
//		begin
//		s_reddown = sd2palette_red;
//		s_greendown = sd2palette_green;
//		s_bluedown = sd2palette_blue;
//		end
//		
//	s_downfour:
//		begin
//		s_reddown = sd2palette_red;
//		s_greendown = sd2palette_green;
//		s_bluedown = sd2palette_blue;
//		end
//	
//	endcase
//	
//
//	
//
//	
//	
//end
//
//endmodule
//
//
//

