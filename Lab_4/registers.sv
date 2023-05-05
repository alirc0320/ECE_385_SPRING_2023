



module register_unit (input  logic Clk, Reset,  Ld_A, Ld_B, 
                            Shift_En, CLR, X_In,
                      input  logic [7:0]  A_In, B_In, 
							 input logic Shift_In_B,
							 output logic [7:0]A_out, B_out,
							 output logic Shift_Out_A
						
						);
			
				
//		logic X;
//		assign X = A[7]; //need to use in the top level 
				logic Shift_In_A;
logic Trash_B;
//Added a trash logic output^
logic Trash_X;
//do we want a shift en for a and B as well ?

    reg_A  reg_A (.Clk(Clk), .D_A(A_In), .Reset(Reset | CLR), .Shift_In_A(Shift_In_A), .Load_A(Ld_A),
	               .Shift_Out_A(Shift_Out_A), .Data_Out_A(A_out), .Shift_En_A(Shift_En));
    
	 reg_B  reg_B (.Clk(Clk), .D_B(B_In), .Reset(1'b0), .Shift_In_B(Shift_In_B), .Load_B(Ld_B),
	               .Shift_Out_B(Trash_X), .Data_Out_B(B_out), .Shift_En_B(Shift_En));
//						
		reg_X  regX (.Clk(Clk), .Reset(Reset | CLR), .Shift_In_X(1'b0), .Shift_En_X(Shift_En), 
		.D_X(X_In), .Shift_Out_X(Trash_B), .Data_Out_X(Shift_In_A),  .Load_X(Ld_A));

endmodule







//Used for register A
module reg_A (input  logic Clk, Reset, Load_A, Shift_En_A, Shift_In_A,
              input  logic [7:0]  D_A,
              output logic Shift_Out_A,
              output logic [7:0]  Data_Out_A);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out_A <= 8'h00;
		 else if (Load_A)
			  Data_Out_A <= D_A;
		 else if (Shift_En_A)
		 begin
			  //concatenate shifted in data to the previous left-most 3 bits
			  //note this works because we are in always_ff procedure block
			  Data_Out_A <= { Shift_In_A, Data_Out_A[7:1] }; 
	    end
    end
	
    assign Shift_Out_A = Data_Out_A[0];

endmodule


//Used for Register B
module reg_B (input  logic Clk, Reset, Shift_In_B, Load_B, Shift_En_B,
              input  logic [7:0] D_B,
              output logic Shift_Out_B,
              output logic [7:0]  Data_Out_B);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out_B <= 8'h00;
		 else if (Load_B)
			  Data_Out_B <= D_B;
		 else if (Shift_En_B)
		 begin
			  //concatenate shifted in data to the previous left-most 3 bits
			  //note this works because we are in always_ff procedure block
			  Data_Out_B <= { Shift_In_B, Data_Out_B[7:1] }; 
	    end
    end
	
    assign Shift_Out_B = Data_Out_B[0];

endmodule






//
//
//
//
//
////Used for register X
module reg_X (input  logic Clk, Reset, Shift_In_X, Load_X, Shift_En_X,
              input  logic D_X,
              output logic Shift_Out_X,
              output logic Data_Out_X);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out_X <= 1'b0;
		 else if (Load_X)
			  Data_Out_X <= D_X;
		 else if (Shift_En_X)
		 begin
			  //concatenate shifted in data to the previous left-most 3 bits
			  //note this works because we are in always_ff procedure block
//			  Data_Out_X <= { Shift_In_X, Data_Out_X }; //Is this line fine for a 1 bit register?
	    end
    end
	
    assign Shift_Out_X = Data_Out_X;  

endmodule

//
//
//
//

