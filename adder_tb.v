`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:47:27 10/29/2019
// Design Name:   adder
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/adder_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_tb;

	// Inputs
	reg [31:0] inp1;
	reg [31:0] inp2;

	// Outputs
	wire [31:0] out;
	wire c31;
	wire c32;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.inp1(inp1), 
		.inp2(inp2), 
		.out(out), 
		.c31(c31), 
		.c32(c32)
	);

	initial begin
		// Initialize Inputs
		inp1 = 0;
		inp2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
		inp1=32'b01111111111111111111111111111111;
		inp2=32'b01111111111111111111111111111111;
        
		// Add stimulus here

	end
      
endmodule

