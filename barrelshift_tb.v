`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:44:09 11/03/2019
// Design Name:   BarrelShift
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/barrelshift_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BarrelShift
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module barrelshift_tb;

	// Inputs
	reg [31:0] inp;
	reg dir;
	reg [31:0] shiftamt;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	BarrelShift uut (
		.inp(inp), 
		.dir(dir), 
		.shiftamt(shiftamt), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		inp = 0;
		dir = 0;
		shiftamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		inp=32'b00001111000011110000111100001111;
		dir=1;
		shiftamt=32'd13;
		#100
		inp=32'b00001111000011110000111100001111;
		dir=1;
		shiftamt=32'd34;
		#100
		inp=32'b00001111000011110000111100001111;
		dir=0;
		shiftamt=32'd27;
	end
      
endmodule

