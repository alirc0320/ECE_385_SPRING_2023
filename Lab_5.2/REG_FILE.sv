


module DR_MUX( 
input logic  DR,
input logic [2:0]IR_11,
output logic [2:0] DRMUX
);


always_comb

		begin
					//this unique case takes care of the if/else statements 
					
				if(DR == 1'b0)
				     DRMUX = IR_11;
				else if(DR == 1'b1)
						DRMUX = 3'b111;
				else
				     DRMUX = 3'bxxx;
		end


endmodule
		
		
		
		
		
		module SR1MUX( 
		input logic SR1MUX,
		input logic [2:0]IR_11, IR_8,
		output logic [2:0]SR1_OUT
		);

		
		always_comb
		begin
					//this unique case takes care of the if/else statements 
					
				if(SR1MUX == 1'b0)
				     SR1_OUT =IR_11;
				else if(SR1MUX == 1'b1)
						SR1_OUT = IR_8;
				else
				     SR1_OUT = 3'bxxx;
		end
	endmodule
	
	 
	 
	 
	 
	 
	 
module Load_Reg_Decoder(


input logic [2:0]DR_MUX,
input logic LD_REG,
output logic LD0, LD1, LD2, LD3, LD4, LD5, LD6, LD7



);
	always_comb
		begin
			LD0 = 0; 
			LD1 = 0; 
			LD2 = 0; 
			LD3 = 0; 
			LD4 = 0; 
			LD5 = 0; 
			LD6 = 0; 
			LD7 = 0; 
		case(DR_MUX) //if S is ____, then Q_Out will = some In value 
						3'b000 :	LD0 = LD_REG;
						3'b001 : LD1 = LD_REG;
						3'b010 : LD2 = LD_REG;
						3'b011 : LD3 = LD_REG;
						3'b100 :	LD4 = LD_REG;
						3'b101 : LD5 = LD_REG;
						3'b110 : LD6 = LD_REG;
						3'b111 : LD7 = LD_REG;
			endcase
		end
	 
endmodule 



	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	
/////////////////////////SR1 INTERNAL MUX///////////////////////

module SR1_INTERNAL_MUX(

input logic [2:0] S,
input logic [15:0] Data_Out0, Data_Out1, Data_Out2, Data_Out3, Data_Out4, Data_Out5, Data_Out6, Data_Out7, 
output logic [15:0] OUTPUT
);
		always_comb
		begin
					//this unique case takes care of the if/else statements 
					
				if(S == 3'b000)
				     OUTPUT = Data_Out0 ;
				else if(S == 3'b001)
						OUTPUT = Data_Out1 ;
				else if(S == 3'b010)
						OUTPUT = Data_Out2;
				else if(S == 3'b011)
						OUTPUT = Data_Out3;
				else if(S == 3'b100)
						OUTPUT = Data_Out4;
				else if(S == 3'b101)
						OUTPUT = Data_Out5;
				else if(S == 3'b110)
						OUTPUT = Data_Out6;
				else if(S == 3'b111)
						OUTPUT = Data_Out7 ;
				else
				    OUTPUT = 16'bxxxx;
		end
		
		
		
	endmodule	
		
		
		
//		
/////////////SR2 INTERNAL MUX//////////////////////////

module SR2_INTERNAL_MUX(

		input logic [2:0] S,
		input logic [15:0] Data_Out0, Data_Out1, Data_Out2, Data_Out3, Data_Out4, Data_Out5, Data_Out6, Data_Out7,
		output logic [15:0] OUTPUT
		
);
	
		always_comb
		begin
		
		
					
				if(S == 3'b000)
				     OUTPUT = Data_Out0 ;
				else if(S == 3'b001)
						OUTPUT = Data_Out1 ;
				else if(S == 3'b010)
						OUTPUT = Data_Out2;
				else if(S == 3'b011)
						OUTPUT = Data_Out3;
				else if(S == 3'b100)
						OUTPUT = Data_Out4;
				else if(S == 3'b101)
						OUTPUT = Data_Out5;
				else if(S == 3'b110)
						OUTPUT = Data_Out6;
				else if(S == 3'b111)
						OUTPUT = Data_Out7 ;
				else
				    OUTPUT = 16'bxxxx;
		end
		
		
		endmodule 
		