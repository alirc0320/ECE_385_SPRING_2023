


module ISDU(   input logic Clk, dead,//if we've collided, comes from color mapper
					input [7:0] keycode, 
				output die_reset //resets in ball file
				);

				
//collision output inputted into ball file to determine reset
//collision determined by color mapper
	enum logic [4:0] {//Idle,
						S_01, // Game state
						S_02 // Reset state
						} State, Next_state;
	
	
	always_ff @ (posedge Clk)
	begin
			State <= Next_state;
	end
   
	///////////////////////////////////////////////////////////
	
	always_comb
	begin 
		// Default next state is staying at current state
		
		Next_state = State;
	
		// Assign next state
		unique case (State)                      
			S_01 : 
				if(dead)
				Next_state = S_02;
//				
				else
				Next_state = S_01; 
			S_02 : 
				Next_state = S_01;
			
		endcase
		
		case (State)
			
			
			S_01 : 
				begin 
				die_reset = 1'b0;  
				

				end
			S_02 : 
				begin
				die_reset = 1'b1; 
				
				end
			default : ;
		endcase
	end 

	
endmodule