//
//	
//	
//	enum logic [2:0] {  Start,
//							Main,
//							Menu,
//							Left,
//							Right,
//							Boss
//							}   State, Next_state;
//							
//							
//		
//	always_ff @ (posedge vga_clk or posedge Reset)
//	begin
//		if (Reset) 
//			State <= Start;
//		else 
//			State <= Next_state;
//	end
//	
//	
//always_ff @ (posedge vga_clk)
//	begin
//	// Default next state is staying at current state
//	Next_state = State;
//	// Default controls signal values
//	//red = red_start;
//	//green = green_start;
//	//blue = blue_start;
////	BallXCenter = 645;
////	BallYCenter = 490;
//	unique case (State)
//		Start :
//			if(keycode == 8'h28) 
//				Next_state = Main;
//		Main :
//			Next_state = Menu;
//	
//		Menu :
//			case(color_main)
//				2'b10:
//					Next_state = Right;
//				default:
//					Next_state = Menu;
//			endcase
//	
//		
//		Right:
//			if(color_main != 2'b10)
//				Next_state = Menu;
//		
//				
//		default: ;
//			
//	endcase
//	
//	case (State)
//		Start: 
//			begin
//				red = title_red;
//				green = title_green;
//				blue = title_blue;
////				BallXCenter = 645;
////				BallYCenter = 490;
//			end
//		Main:
//			begin 
//				red = final_bc_red;
//				green = final_bc_green;
//				blue = final_bc_blue;
////				BallXCenter = 320;
////				BallYCenter = 240;
//			end
//		Menu: 
//			begin 
//				red = final_bc_red;
//				green = final_bc_green;
//				blue = final_bc_blue;
////				BallXCenter = 320;
////				BallYCenter = 240;
//			end
//		
//		Right:
//			begin
//				red = background_2_red;
//				green = background_2_green;
//				blue = background_2_blue;
////				BallXCenter = 320;
////				BallYCenter = 240;
//			end
//		
//	default: ;
//	
//	endcase
//end
//	
//	
	
