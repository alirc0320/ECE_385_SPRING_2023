

module  sprite ( input Reset, frame_clk,
					input [7:0] keycode,
               output [9:0]  spriteX, spriteY, spriteS,
					input [3:0] red, green, blue, //new stop deleting 
					input logic collision,
					input logic dead,
					input logic [3:0] up_1_palette_red, up_1_palette_green, up_1_palette_blue
					);
    
    logic [9:0] sprite_X_Pos, sprite_X_Motion, sprite_Y_Pos, sprite_Y_Motion, sprite_Size;
	// logic [3:0] bc_red, bc_green, bc_blue;
    parameter [9:0] sprite_X_Center=320;  // Center position on the X axis
    parameter [9:0] sprite_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] sprite_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] sprite_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] sprite_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] sprite_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] sprite_X_Step=8;      // Step size on the X axis
    parameter [9:0] sprite_Y_Step=8;      // Step size on the Y axis
//was 30 before sword stuff
    assign sprite_Size = 30; // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_sprite
        if (Reset)  // Asynchronous Reset
        begin 
            sprite_Y_Motion <= 10'd0; //sprite_Y_Step;
				sprite_X_Motion <= 10'd0; //sprite_X_Step;
				sprite_Y_Pos <= sprite_Y_Center;
				sprite_X_Pos <= sprite_X_Center;
        end
          
//		else if(dead)	
//		
//		begin 
//            sprite_Y_Motion <= 10'd0; //sprite_Y_Step;
//				sprite_X_Motion <= 10'd0; //sprite_X_Step;
//				sprite_Y_Pos <= sprite_Y_Center;
//				sprite_X_Pos <= sprite_X_Center;
//        end
//          


	
        else 
        begin 
				
			
			
				 
				
			
				 if ( (sprite_Y_Pos - sprite_Size) <= sprite_Y_Min )  // sprite is at the top edge, BOUNCE!
					  sprite_Y_Motion <= sprite_Y_Step;
					  
				  else if ( (sprite_X_Pos + sprite_Size) >= sprite_X_Max )  // sprite is at the Right edge, BOUNCE!
					  sprite_X_Motion <= (~ (sprite_X_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (sprite_X_Pos - sprite_Size) <= sprite_X_Min )  // sprite is at the Left edge, BOUNCE!
					  sprite_X_Motion <= sprite_X_Step;
					  //added this begin
				 else begin
					  sprite_Y_Motion <= sprite_Y_Motion;  // sprite is somewhere in the middle, don't bounce, just keep moving
					  
				 
				 case (keycode)
					8'h04 : begin //left

								sprite_X_Motion <= -2;//A
								sprite_Y_Motion<= 0;
				 
			if (collision)
					begin			
					sprite_X_Motion <= 0;
					sprite_Y_Motion <= 0;
				 end
								
							  end
					        
					8'h07 : begin //right
								
					        sprite_X_Motion <= 2;//D
							  sprite_Y_Motion <= 0;
				
				
			if (collision)
					begin			
					sprite_X_Motion <= 0;
					sprite_Y_Motion <= 0;
				 end
				  
	
							 
							  end

							  
					8'h16 : begin //down

					        sprite_Y_Motion <= 2;//S
							  sprite_X_Motion <= 0;
			
			if (collision)
					begin			
					sprite_X_Motion <= 0;
					sprite_Y_Motion <= 0;
				 end
							 
							  
							 end
							  
					8'h1A : begin //up
					        sprite_Y_Motion <= -2;//W
							  sprite_X_Motion <= 0;
							   
				if (collision)
					begin			
					sprite_X_Motion <= 0;
					sprite_Y_Motion <= 0;
				 end
							
							 end	  
					default: ;
			   endcase
				//check if sprite is touching a certain color and if it is then stop
				
				
				
				
				
				
				
				 end//added this end
				 
				
				 
				 
				 if(sprite_Y_Motion != 0 || sprite_X_Motion != 0) //lets sprite move one pixel at a time
				 begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
				 end
				 
				
				
				 
				 
				 sprite_Y_Pos <= (sprite_Y_Pos + sprite_Y_Motion);  // Update sprite position
				 sprite_X_Pos <= (sprite_X_Pos + sprite_X_Motion);
			
			
			
		end  
    end
       
    assign spriteX = sprite_X_Pos;
   
    assign spriteY = sprite_Y_Pos;
   
    assign spriteS = sprite_Size;
    

endmodule

module  enemy_ball ( input Reset, frame_clk,
					input [7:0] keycode,
					input  dead, 
					input enemy_dead_flag,
               output [9:0]  enemy_X, enemy_Y, enemy_S );
    
    logic [9:0] enemy_X_Pos, enemy_X_Motion, enemy_Y_Pos, enemy_Y_Motion, enemy_Size;
	 
	 
	 
	 
	 
	 
    parameter [9:0] enemy_X_Center=350;  // Center position on the X axis
    parameter [9:0] enemy_Y_Center=50;  // Center position on the Y axis
    parameter [9:0] enemy_X_Min=255;       // Leftmost point on the X axis
    parameter [9:0] enemy_X_Max=350;     // Rightmost point on the X axis
    parameter [9:0] enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] enemy_Y_Max=550;     // Bottommost point on the Y axis
    parameter [9:0] enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] enemy_Y_Step=1;      // Step size on the Y axis

    assign enemy_Size = 30;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_enemy
        if (Reset)  // Asynchronous Reset
        begin 
            enemy_Y_Motion <= 10'd0; //enemy_Y_Step;
				enemy_X_Motion <= 10'd0; //enemy_X_Step;
				enemy_Y_Pos <= enemy_Y_Center;
				enemy_X_Pos <= enemy_X_Center;
        end
           
  
			  
			  
			  
			  
			  
			  
        else 
        begin 
				 if ( (enemy_Y_Pos + enemy_Size) >= enemy_Y_Max )  // enemy is at the bottom edge, BOUNCE!
					  enemy_Y_Motion <= (~ (enemy_Y_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (enemy_Y_Pos - enemy_Size) <= enemy_Y_Min )  // enemy is at the top edge, BOUNCE!
					  enemy_Y_Motion <= enemy_Y_Step;
				 	  
				  else if ( (enemy_X_Pos + enemy_Size) >= enemy_X_Max ) begin // enemy is at the Right edge, BOUNCE!
					  enemy_X_Motion <= (~ (enemy_X_Step) + 1'b1);  // 2's complement.
//					  enemy_X_Motion <= -1; 
//					  enemy_Y_Motion <= 0;
	
					  end 
				 else if ( (enemy_X_Pos - enemy_Size) <= enemy_X_Min )
			begin	 // enemy is at the Left edge, BOUNCE!
					  enemy_X_Motion <= enemy_X_Step;
					  //added this begin
//					  enemy_X_Motion <= 1; 
//					  enemy_Y_Motion <= 0;
					  end
					  
					 else if (enemy_dead_flag == 1)
					 begin
//					 // enemy_X_Motion <= 10;
					 //enemy_X_Motion <= 0;
					 //enemy_Y_Motion <= 0;
					 enemy_Y_Pos = 500;
					 enemy_X_Pos = 500; 
						end
			  
				 else begin
					  enemy_Y_Motion <= enemy_Y_Motion;  // enemy is somewhere in the middle, don't bounce, just keep moving
					  
				 
//				 case (keycode)
//					
//					default: 
//						begin
//						if((enemy_X_Pos != enemy_X_Min) || (enemy_X_Pos +(enemy_Size - 7)!= enemy_X_Max))
//						enemy_X_Motion <= 1; 
//						
//						end
//				endcase
				 end//added this end
				 enemy_Y_Pos <= (enemy_Y_Pos + enemy_Y_Motion);  // Update enemy position
				 enemy_X_Pos <= (enemy_X_Pos + enemy_X_Motion);
				 
				 
				 
				
				 
			
		
      
			
		end  
    end
       
    assign enemy_X = enemy_X_Pos;
   
    assign enemy_Y = enemy_Y_Pos;
   
    assign enemy_S = enemy_Size;
    

endmodule










module  enemy2_ball ( input Reset, frame_clk,
					input [7:0] keycode,
					input  dead, 
					input enemy_dead_flag,
               output [9:0]  enemy_X, enemy_Y, enemy_S );
    
    logic [9:0] enemy_X_Pos, enemy_X_Motion, enemy_Y_Pos, enemy_Y_Motion, enemy_Size;
	 
	 
	 
	 
	 
	 
    parameter [9:0] enemy_X_Center=749;  // Center position on the X axis
    parameter [9:0] enemy_Y_Center=180;  // Center position on the Y axis
    parameter [9:0] enemy_X_Min=700;       // Leftmost point on the X axis
    parameter [9:0] enemy_X_Max=750;     // Rightmost point on the X axis
    parameter [9:0] enemy_Y_Min=180;       // Topmost point on the Y axis
    parameter [9:0] enemy_Y_Max=270;     // Bottommost point on the Y axis
    parameter [9:0] enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] enemy_Y_Step=1;      // Step size on the Y axis

    assign enemy_Size = 30;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_enemy
        if (Reset)  // Asynchronous Reset
        begin 
            enemy_Y_Motion <= 10'd0; //enemy_Y_Step;
				enemy_X_Motion <= 10'd0; //enemy_X_Step;
				enemy_Y_Pos <= enemy_Y_Center;
				enemy_X_Pos <= 60;
        end
        else 
        begin 
				 if ( (enemy_Y_Pos + enemy_Size) >= enemy_Y_Max )  // enemy is at the bottom edge, BOUNCE!
					  enemy_Y_Motion <= (~ (enemy_Y_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (enemy_Y_Pos - enemy_Size) <= enemy_Y_Min )  // enemy is at the top edge, BOUNCE!
					  enemy_Y_Motion <= enemy_Y_Step;
				 	  
//				  else if ( (enemy_X_Pos + enemy_Size) >= enemy_X_Max ) begin // enemy is at the Right edge, BOUNCE!
//					  enemy_X_Motion <= (~ (enemy_X_Step) + 1'b1);  // 2's complement.

	
					 // end 
//				 else if ( (enemy_X_Pos - enemy_Size) <= enemy_X_Min )
//			begin	 // enemy is at the Left edge, BOUNCE!
//					  enemy_X_Motion <= enemy_X_Step;
					  //added this begin

					//  end
					  
					 else if (enemy_dead_flag == 1)
					 begin
					 
					enemy_X_Pos = 700;
					enemy_Y_Motion <= 0;
					enemy_X_Motion <= 0;
					end
			  
			  
				 else begin
					  enemy_Y_Motion <= enemy_Y_Motion;  // enemy is somewhere in the middle, don't bounce, just keep moving
					  
			
				 end//added this end
				 enemy_Y_Pos <= (enemy_Y_Pos + enemy_Y_Motion);  // Update enemy position
				 enemy_X_Pos <= (enemy_X_Pos + enemy_X_Motion);
				 
				 
				 
				
				 
			
		
      
			
		end  
    end
       
    assign enemy_X = enemy_X_Pos;
   
    assign enemy_Y = enemy_Y_Pos;
   
    assign enemy_S = enemy_Size;
    

endmodule










module  enemy3_ball ( input Reset, frame_clk,
					input [7:0] keycode,
					input  dead, 
					input enemy_dead_flag,
               output [9:0]  enemy_X, enemy_Y, enemy_S );
    
    logic [9:0] enemy_X_Pos, enemy_X_Motion, enemy_Y_Pos, enemy_Y_Motion, enemy_Size;
	 
	 
	 
	 
	 
	 
    parameter [9:0] enemy_X_Center=749;  // Center position on the X axis
    parameter [9:0] enemy_Y_Center=195;  // Center position on the Y axis
    parameter [9:0] enemy_X_Min=700;       // Leftmost point on the X axis
    parameter [9:0] enemy_X_Max=750;     // Rightmost point on the X axis
    parameter [9:0] enemy_Y_Min=195;       // Topmost point on the Y axis
    parameter [9:0] enemy_Y_Max=270;     // Bottommost point on the Y axis
    parameter [9:0] enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] enemy_Y_Step=1;      // Step size on the Y axis

    assign enemy_Size = 28;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_enemy
        if (Reset)  // Asynchronous Reset
        begin 
            enemy_Y_Motion <= 10'd0; //enemy_Y_Step;
				enemy_X_Motion <= 10'd0; //enemy_X_Step;
				enemy_Y_Pos <= enemy_Y_Center;
				enemy_X_Pos <= 510;
        end
        else 
        begin 
				 if ( (enemy_Y_Pos + enemy_Size) >= enemy_Y_Max )  // enemy is at the bottom edge, BOUNCE!
					  enemy_Y_Motion <= (~ (enemy_Y_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (enemy_Y_Pos - enemy_Size) <= enemy_Y_Min )  // enemy is at the top edge, BOUNCE!
					  enemy_Y_Motion <= enemy_Y_Step;
				 	  
//				  else if ( (enemy_X_Pos + enemy_Size) >= enemy_X_Max ) begin // enemy is at the Right edge, BOUNCE!
//					  enemy_X_Motion <= (~ (enemy_X_Step) + 1'b1);  // 2's complement.

	
					 // end 
//				 else if ( (enemy_X_Pos - enemy_Size) <= enemy_X_Min )
//			begin	 // enemy is at the Left edge, BOUNCE!
//					  enemy_X_Motion <= enemy_X_Step;
					  //added this begin

					//  end
					  
					 else if (enemy_dead_flag == 1)
					 begin
					 
					enemy_X_Pos = 700;
					enemy_Y_Motion <= 0;
					enemy_X_Motion <= 0;
					end
			  
			  
				 else begin
					  enemy_Y_Motion <= enemy_Y_Motion;  // enemy is somewhere in the middle, don't bounce, just keep moving
					  
			
				 end//added this end
				 enemy_Y_Pos <= (enemy_Y_Pos + enemy_Y_Motion);  // Update enemy position
				 enemy_X_Pos <= (enemy_X_Pos + enemy_X_Motion);
				 
				 
				 
				
				 
			
		
      
			
		end  
    end
       
    assign enemy_X = enemy_X_Pos;
   
    assign enemy_Y = enemy_Y_Pos;
   
    assign enemy_S = enemy_Size;
    

endmodule