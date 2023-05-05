module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
	//output 			p,
	//output 			g
	
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	   
	  
	  //combines each of the four-four bit ripple adders - 16 bit CLA
	  
	  //carry in next
	  //logic PG0, PG1, PG2, PG3;
	  //logic GG0, GG1, GG2, GG3;
	  
	  //logic P0, P1, P2, P3;
	  //logic G0, G1, G2, G3; 
	  
	  //
	  //pg = P0 & P1 & P2 & P3 
	  //gg = G3 | (G2 & P3) | (G1 & P3 & P2) | (G0 & P3 & P2 & P1) 
	  //four_bit_ra2 FRA1(.x(A[7:4]), .y(B[7:4]), .cin(C0), .s(S[7:4]), .cout(C1));
	  
	  //each 4x1 adder 
	  
			logic GG_0, GG_4, GG_8, GG_12;
			logic PG_0, PG_4, PG_8, PG_12; 
			logic cin_next4, cin_next8, cin_next12; 
			logic PG, GG; 
	  
			assign cin_next4 = GG_0 | (PG_0 & cin)  ;
			assign cin_next8 = GG_4 | (GG_0 & PG_4) | (PG_0 & cin & PG_4)  ;
			assign cin_next12 = GG_8| (GG_4 & PG_8) | (GG_0 & PG_8 & PG_4) | (cin & PG_8 & PG_4 & PG_0);
			assign PG = (PG_0 & PG_4 & PG_8 & PG_12);
			assign GG = GG_12 | (GG_8 & PG_12) | (GG_4 & PG_12 & PG_8) | (GG_0 & PG_12 & PG_8 & PG_4);
			assign cout = GG | (PG & cin_next12);
			
			
			//assign PG = p0 & p1 & p2 & p3;
			//assign GG = g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1);
			//assign cout = GG & PG;
			
			//add PG and GG connect ports 
	  
	  four_bit_ra2 FRA0(.x(A[3:0]), .y(B[3:0]), .cin(cin), .s(S[3:0]), .PG(PG_0), .GG(GG_0));
		four_bit_ra2 FRA1(.x(A[7:4]), .y(B[7:4]), .cin(cin_next4), .s(S[7:4]), .PG(PG_4), .GG(GG_4));
		four_bit_ra2 FRA2(.x(A[11:8]), .y(B[11:8]), .cin(cin_next8), .s(S[11:8]), .PG(PG_8), .GG(GG_8));
		four_bit_ra2 FRA3(.x(A[15:12]), .y(B[15:12]), .cin(cin_next12), .s(S[15:12]), .PG(PG_12), .GG(GG_12));
		
	
endmodule 	

//
		
		
		
		
		
		
		
		
		
module four_bit_ra2( //single 4-bit adder block
			input [3:0] x,
			input [3:0] y,
			input cin,
			output logic [3:0] s,
			output logic cout,
			//output logic p,
			//output logic g,
			output logic PG,
			output logic GG
			
			);
			
			
	
	
	
	
	
	logic p0, p1, p2, p3; 
	logic g0, g1, g2, g3; 
	logic cnext1, cnext2, cnext3; 
	
	//assign cin_next = GG | (PG & cin)  ;
			assign PG = p0 & p1 & p2 & p3;
			assign GG = g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1);
			//logic c0, c1, c2; 
	
	assign cnext1 = (cin & p0) | g0;
	assign cnext2 = (cin & p0 & p1) | (g0 & p1) | g1;
	assign cnext3 = (cin & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;
		
		//each is for 1-bit of the 4-bit adder
	full_adder2 fa0(.x(x[0]), .y(y[0]), .cin(cin), .s(s[0]), .p(p0), .g(g0)); 
	full_adder2 fa1(.x(x[1]), .y(y[1]), .cin(cnext1), .s(s[1]), .p(p1), .g(g1));
	full_adder2 fa2(.x(x[2]), .y(y[2]), .cin(cnext2), .s(s[2]), .p(p2), .g(g2));
	full_adder2 fa3(.x(x[3]), .y(y[3]), .cin(cnext3), .s(s[3]), .p(p3), .g(g3));
		
endmodule		
		
		
		
		
		
		
		
		
		
		
		
module full_adder2( // 1-bit adder 
		//define variables - inputs, carry in, sum, and carry out 
			input x,
			input y,
			input cin,
			output logic s,
			//output logic cout,
			output logic p,
			output logic g 
			);
	
	assign s = x ^ y ^ cin; //XOR the inputs 
	//assign cout = (x & y) | (y & cin) | (cin & x); //AND the inputs and OR each combination
	assign p = x ^ y; 
	assign g = x & y; 
	
	


endmodule