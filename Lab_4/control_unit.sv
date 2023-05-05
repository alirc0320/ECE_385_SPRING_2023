module control_unit(

input logic clk, reset, run,
//reset is like loading  

 
input logic M,

output logic Shift_En, SUB, ADD, CLR, LD



);
//ADD load signal 
//ADD first state with loading then clear, where do you put reset

enum logic [4:0] {A1, A2, A3, A4, A5, A6, A7, 
S1, S2, S3, S4, S5, S6, S7, S8, Sub, Halt, Hold, CLR_LD_State} curr_state, next_state;
//A = add, S=shift, R=reset, E=enable, H=halt

//updates flip flop, current state is the only one
    always_ff @ (posedge clk)  
    begin
        if (reset)
            curr_state <= CLR_LD_State;
        else 
            curr_state <= next_state;
    end
	 
	 //clr your a register when you click run 

always_comb
	begin 
	
	next_state = curr_state; //stay in the same state unless...
	
   unique case(curr_state)
	
	 
		
		CLR_LD_State: next_state = Hold;
		
		
		Hold:if(run)
				next_state = A1;
	
		
	
		
		
		A1: next_state = S1;
		
		S1: next_state = A2;
		
		A2: next_state = S2;
			
		S2:next_state = A3;

		A3: next_state = S3;
		
		S3: next_state = A4;
		
		A4: next_state = S4;
		
		S4: next_state = A5;
		
		A5: next_state = S5;
		
		S5: next_state = A6;
		
		A6: next_state = S6;
		
		S6: next_state = A7;
		
		A7: next_state = S7;
		
		S7: next_state = Sub;

		Sub: next_state = S8;
		
		S8: next_state = Halt;
	
		
		Halt: 
		if (~run)
			next_state = Hold;
			
		
		
		
			
		
		
		//else
			
			
		
	endcase	
		end
		
	always_comb
		begin
		
		
				
				
				case(curr_state)
						
						CLR_LD_State:
						begin
							ADD = 1'b0; 
							Shift_En = 1'b0; 
							SUB = 1'b0 ;
							CLR = 1'b1;  ///we gonna change both these to 
							LD = 1'b1; 
						end
						
//						CLR_LD : 
//						begin
//							ADD = 1'b0; 
//							Shift_En = 1'b0; 
//							SUB = 1'b0 ;
//							CLR = 1'b1;
//							LD = 1'b0; 
//						end
						
						 A2, A3, A4, A5, A6, A7: 
							begin
								if(M == 1'b1)
								ADD = 1'b1;
								else
								ADD = 1'b0;
								
								LD = 1'b0; 
								Shift_En = 1'b0;
								SUB = 1'b0; 
								CLR = 1'b0;																	
							end
							A1:
							begin
								if(M == 1'b1)
								ADD = 1'b1;
								else
								ADD = 1'b0;
								
								LD = 1'b0; 
								Shift_En = 1'b0;
								SUB = 1'b0; 
								CLR = 1'b0;		
							end
						
						S1, S2, S3, S4, S5, S6, S7, S8:
							begin
								ADD = 1'b0 ;
								Shift_En = 1'b1; 
								SUB = 1'b0 ;
								CLR = 1'b0;
								LD = 1'b0; 
								
							end
							
						Sub:
							begin
								if(M == 1'b1)
									SUB = 1'b1;
								else
									SUB = 1'b0;
								 	
								ADD = 1'b0; 
								Shift_En = 1'b0; 
								CLR = 1'b0;
								LD = 1'b0; 
								
							end
						
						 Halt:
							begin
									
								ADD = 1'b0 ;
								Shift_En = 1'b0 ;
								SUB = 1'b0 ;
								CLR = 1'b0;
								LD = 1'b0; 
								
								
							end
							Hold:
							begin
									
								ADD = 1'b0 ;
								Shift_En = 1'b0 ;
								SUB = 1'b0 ;
								CLR = run;
								LD = 1'b0; 
								
								
							end
							
//							R:
//							begin
//									
//								ADD = 1'b0; 
//								Shift_En = 1'b0; 
//								SUB = 1'b0;
//								CLR = 1'b0;
//								LD = 1'b0; 
//								
//								
//							end
							
							default:
				begin
					ADD = 1'b0; 
					Shift_En = 1'b0; 
					SUB = 1'b0 ;
					CLR = 1'b0;
					LD = 1'b0; 
				end
						
				endcase
			end
		
		
		



endmodule 