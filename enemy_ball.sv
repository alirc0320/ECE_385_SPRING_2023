module  enemy_ball ( input Reset, frame_clk,
					input [7:0] keycode,
               output [9:0]  enemy_X, enemy_Y, enemy_S );
    
    logic [9:0] enemy_X_Pos, enemy_X_Motion, enemy_Y_Pos, enemy_Y_Motion, enemy_Size;
	 
    parameter [9:0] enemy_X_Center=320;  // Center position on the X axis
    parameter [9:0] enemy_Y_Center=240;  // Center position on the Y axis
    parameter [9:0] enemy_X_Min=0;       // Leftmost point on the X axis
    parameter [9:0] enemy_X_Max=639;     // Rightmost point on the X axis
    parameter [9:0] enemy_Y_Min=0;       // Topmost point on the Y axis
    parameter [9:0] enemy_Y_Max=479;     // Bottommost point on the Y axis
    parameter [9:0] enemy_X_Step=1;      // Step size on the X axis
    parameter [9:0] enemy_Y_Step=1;      // Step size on the Y axis

    assign enemy_Size = 32;  // assigns the value 4 as a 10-digit binary number, ie "0000000100"
   
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
					  
				  else if ( (enemy_X_Pos + enemy_Size) >= enemy_X_Max )  // enemy is at the Right edge, BOUNCE!
					  enemy_X_Motion <= (~ (enemy_X_Step) + 1'b1);  // 2's complement.
					  
				 else if ( (enemy_X_Pos - enemy_Size) <= enemy_X_Min )  // enemy is at the Left edge, BOUNCE!
					  enemy_X_Motion <= enemy_X_Step;
					  //added this begin
				 else begin
					  enemy_Y_Motion <= enemy_Y_Motion;  // enemy is somewhere in the middle, don't bounce, just keep moving
					  
				 
				 case (keycode)
					8'h04 : begin

								enemy_X_Motion <= -1;//A
								enemy_Y_Motion<= 0;
							  end
					        
					8'h07 : begin
								
					        enemy_X_Motion <= 1;//D
							  enemy_Y_Motion <= 0;
							  end

							  
					8'h16 : begin

					        enemy_Y_Motion <= 1;//S
							  enemy_X_Motion <= 0;
							 end
							  
					8'h1A : begin
					        enemy_Y_Motion <= -1;//W
							  enemy_X_Motion <= 0;
							 end	  
					default: ;
			   endcase
				 end//added this end
				 enemy_Y_Pos <= (enemy_Y_Pos + enemy_Y_Motion);  // Update enemy position
				 enemy_X_Pos <= (enemy_X_Pos + enemy_X_Motion);
			
		
      
			
		end  
    end
       
    assign enemyX = enemy_X_Pos;
   
    assign enemyY = enemy_Y_Pos;
   
    assign enemyS = enemy_Size;
    

endmodule
