



module nine_sw_Bit_adder( ////single 9-sw_Bit adder sw_Block - working with each individual sw_Bit 
			
			input [7:0] A, //input A
			input [7:0] sw_B, //input from switches -- lets call it sw_B
			input SUB,
			input cin, //carry in
			output logic [7:0] s, //sum 
			output logic X
			
			
			);
			//in the top level, assign X = S[8]
	logic c0, c1, c2, c3, c4, c5, c6, c7; 
		
 //we want S[8] To equal S[7] and we want to load X register with S[8]
 
		logic [7:0] sw_B_neg;
		logic cin_1;


	
	//manually sign extend - sw_By setting the 9th sw_Bit of A = to A[7], we are sign extending 

	
	//need to make new variable sw_B_neg and cin_1 because we cannot drive cin and sw_B two times 
	//in the same module 
	
	
	
	
	always_comb
	begin
	
	 
	if(SUB == 1'b1)begin //if 8th sw_Bit 1 (X), then we want to subtract - comes from control unit 
		cin_1 = 1'b1; // carry in of 1 
		
		sw_B_neg = ~sw_B;
	end
	else 	begin						//need this statement so that there are still values assigned even if "if" condition isnt met
		cin_1 = cin;
	
		sw_B_neg = sw_B;
	end
	
	end
	
	full_adder fa0(.A(A[0]), .sw_B(sw_B_neg[0]), .cin(cin_1), .s(s[0]), .cout(c0)); 
	full_adder fa1(.A(A[1]), .sw_B(sw_B_neg[1]), .cin(c0), .s(s[1]), .cout(c1));
	full_adder fa2(.A(A[2]), .sw_B(sw_B_neg[2]), .cin(c1), .s(s[2]), .cout(c2));
	full_adder fa3(.A(A[3]), .sw_B(sw_B_neg[3]), .cin(c2), .s(s[3]), .cout(c3));
	full_adder fa4(.A(A[4]), .sw_B(sw_B_neg[4]), .cin(c3), .s(s[4]), .cout(c4)); 
	full_adder fa5(.A(A[5]), .sw_B(sw_B_neg[5]), .cin(c4), .s(s[5]), .cout(c5));
	full_adder fa6(.A(A[6]), .sw_B(sw_B_neg[6]), .cin(c5), .s(s[6]), .cout(c6));
	full_adder fa7(.A(A[7]), .sw_B(sw_B_neg[7]), .cin(c6), .s(s[7]), .cout(c7));
	full_adder fa8(.A(A[7]), .sw_B(sw_B_neg[7]), .cin(c7), .s(X), .cout()); //8th sw_Bit of sum stored in X 
		
endmodule		
		
		
		
		
module full_adder(
		//define variables - inputs, carry in, sum, and carry out 
			input A,
			input sw_B,
			input cin,
			output logic s,
			output logic cout
			);
	
	assign s = A ^ sw_B ^ cin; //XOR the inputs 
	assign cout = (A & sw_B) | (sw_B & cin) | (cin & A); //AND the inputs and OR each combination

endmodule
