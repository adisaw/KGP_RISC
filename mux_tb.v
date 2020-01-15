`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:59:49 10/27/2019
// Design Name:   mux2x1
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/mux_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux2x1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux_tb;

	// Inputs
	reg [31:0] in0;
	reg [31:0] in1;
	reg sel;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	mux2x1 uut (
		.in0(in0), 
		.in1(in1), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in0 = 0;
		in1 = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in0 = 32'd70;
		in1 = 32'd5;
		sel=1;
		#10;
		sel=0;
	end
      
endmodule

