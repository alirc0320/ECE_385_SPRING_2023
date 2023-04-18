

module  sprite ( input Reset, frame_clk,
					input [7:0] keycode,
               output [9:0]  spriteX, spriteY, spriteS,
					input [3:0] red, green, blue, //new stop deleting 
					input logic collision,
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
    parameter [9:0] sprite_X_Step=5;      // Step size on the X axis
    parameter [9:0] sprite_Y_Step=5;      // Step size on the Y axis

    assign sprite_Size = 30;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
    always_ff @ (posedge Reset or posedge frame_clk )
    begin: Move_sprite
        if (Reset)  // Asynchronous Reset
        begin 
            sprite_Y_Motion <= 10'd0; //sprite_Y_Step;
				sprite_X_Motion <= 10'd0; //sprite_X_Step;
				sprite_Y_Pos <= sprite_Y_Center;
				sprite_X_Pos <= sprite_X_Center;
        end
           
        else 
        begin 
				
			
			if (collision)
					begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
				 end
				 
				
			
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
					8'h04 : begin

								sprite_X_Motion <= -1;//A
								sprite_Y_Motion<= 0;
				 
			if (collision)
					begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
				 end
								
							  end
					        
					8'h07 : begin
								
					        sprite_X_Motion <= 1;//D
							  sprite_Y_Motion <= 0;
							   if (collision)
					begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
				 end
				  
	
							 
							  end

							  
					8'h16 : begin

					        sprite_Y_Motion <= 1;//S
							  sprite_X_Motion <= 0;
				if (collision)
					begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
				 end
							 
							  
							 end
							  
					8'h1A : begin
					        sprite_Y_Motion <= -1;//W
							  sprite_X_Motion <= 0;
							   
				if (collision)
					begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
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
				 
				if (collision)
					begin			
					sprite_Y_Motion <= 0;
				   sprite_X_Motion <=  0;
				 end
				  
				
				 
				 
				 sprite_Y_Pos <= (sprite_Y_Pos + sprite_Y_Motion);  // Update sprite position
				 sprite_X_Pos <= (sprite_X_Pos + sprite_X_Motion);
			
			
	  /**************************************************************************************
	    ATTENTION! Please answer the following quesiton in your lab report! Points will be allocated for the answers!
		 Hidden Question #2/2:
          Note that sprite_Y_Motion in the above statement may have been changed at the same clock edge
          that is causing the assignment of sprite_Y_pos.  Will the new value of sprite_Y_Motion be used,
          or the old?  How will this impact behavior of the sprite during a bounce, and how might that 
          interact with a response to a keypress?  Can you fix it?  Give an answer in your Post-Lab.
      **************************************************************************************/
      
			
		end  
    end
       
    assign spriteX = sprite_X_Pos;
   
    assign spriteY = sprite_Y_Pos;
   
    assign spriteS = sprite_Size;
    

endmodule

