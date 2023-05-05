module  testbench();

timeunit 10ns;
timeprecision 1ns;

/*

//Module lookahead_adder
logic Clk = 0;
logic   [15:0] A, B;
logic   cin;
logic   [15:0] S;
logic   cout;

//logic   p;
//logic   g;

lookahead_adder lookahead0(.*);

	
// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 
	initial begin: TEST_VECTORS
	

	   A = 16'b1111111111111111;
		B = 16'b0000000000000000;
	   cin = 1;

end
	
*/


/*
	
//ripple adder 	
	
logic Clk = 0;	
logic   [15:0] A, B;
logic   cin;
logic   [15:0] S;
logic   cout;


ripple_adder ripple0(.*);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end


initial begin: TEST_VECTORS


		A = 16'b1111111111111111;
		B = 16'b0000000000000000;
	   cin = 1;

	end
	
*/



//select adder



logic Clk = 0; 
logic [16:1] A, B;
logic cin;
logic [16:1] S;
logic cout;
								
								
					
select_adder select0(.*);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end


	initial begin: TEST_VECTORS


	   A = 16'b1111111111111110;
		B = 16'b0000000000000000;
	   cin = 1;

	end











endmodule

	





       