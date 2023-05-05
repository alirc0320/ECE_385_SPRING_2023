//module select_adder (
//	input  [15:0] A, B,
//	input         cin,
//	output [15:0] S,
//	output        cout
//);
////
////    /* TODO
////     *
////     * Insert code here to implement a CSA adder.
////     * Your code should be completly combinational (don't use always_ff or always_latch).
// /    * Feel free to create sub-modules or other files. */
////	  
//	  
//  
//  
//
//endmodule















module select_adder(
								input  [15:0] A, B,
								input         cin,
								output [15:0] S,
								output        cout





);
				
		
		logic [3:0] s0 ,s1_0, s1_1, s2_0, s2_1, s3_0, s3_1;
		
		
		logic C4, C8, C12; 
		logic cout13_1, cout13_0, cout21_1, cout21_0, cout29_1, cout29_0;
		assign C8  = (cout13_1 & C4) | cout13_0;
		assign C12 = (cout21_1 & C8) | cout21_0;
		assign cout =(cout29_1 & C12) | cout29_0; 
		
    	four_bit_ra1 FRA0(.x(A[3:0]), .y(B[3:0]), .cin(cin), .s(S[3:0]), .cout(C4));
	
	
    	four_bit_ra1 FRA1(.x(A[7:4]), .y(B[7:4]), .cin(0), .s(s1_0),  .cout(cout13_0)); 
		four_bit_ra1 FRA4(.x(A[7:4]), .y(B[7:4]), .cin(1), .s(s1_1),  .cout(cout13_1));
		
		four_bit_ra1 FRA2(.x(A[11:8]), .y(B[11:8]), .cin(0), .s(s2_0), .cout(cout21_0));
		four_bit_ra1 FRA5(.x(A[11:8]), .y(B[11:8]), .cin(1), .s(s2_1), .cout(cout21_1));
		
		four_bit_ra1 FRA3(.x(A[15:12]), .y(B[15:12]), .cin(0), .s(s3_0), .cout(cout29_0));
		four_bit_ra1 FRA6(.x(A[15:12]), .y(B[15:12]), .cin(1), .s(s3_1), .cout(cout29_1));

		muxUnit mux0(.S(C4), .A_In(s1_0), .B_In(s1_1), .Q_Out(S[7:4]) );
		muxUnit mux1(.S(C8), .A_In(s2_0), .B_In(s2_1), .Q_Out(S[11:8]) );
		muxUnit mux2(.S(C12), .A_In(s3_0), .B_In(s3_1), .Q_Out(S[15:12])  );


endmodule 

//Q_Out?
//Output of adder is only instantiated with the mux 




 module four_bit_ra1(
						input[3:0] x,
						input[3:0] y, 
						input cin,
						output logic [3:0] s,
						output logic cout
						); 
									
			logic c0, c1, c2; 		
					
		full_adder1 fa0(.x(x[0]), .y(y[0]), .cin(cin), .s(s[0]), .cout(c0));
		full_adder1 fa1(.x(x[1]), .y(y[1]), .cin(c0), .s(s[1]), .cout(c1));
		full_adder1 fa2(.x(x[2]), .y(y[2]), .cin(c1), .s(s[2]), .cout(c2));
		full_adder1 fa3(.x(x[3]), .y(y[3]), .cin(c2), .s(s[3]), .cout(cout));
		
		
		endmodule
		
		
		
			  
	  
	  
	  

	  module full_adder1(
							input x,
							input y,
							input cin,
							output logic s,
							output logic cout
							);
							
							assign s = x^y^cin;
							assign cout = (x&y) | (y&cin) | (cin&x);					   
endmodule







module muxUnit(input	logic	 S,
					input	logic  [3:0] A_In,
					input logic	 [3:0] B_In,
					output logic [3:0] Q_Out);
						
		// 4 bit parallel multiplexer implemented using case statement
		
		
		
		always_comb
		begin 
				unique case(S)
						1'b0	:	Q_Out = A_In;
						1'b1	:	Q_Out = B_In;
				endcase
		end




endmodule 
