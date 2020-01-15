`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:45:11 11/03/2019
// Design Name:   ShiftArithmetic
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/shiftarithmetic_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftArithmetic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftarithmetic_tb;

	// Inputs
	reg [31:0] inp;
	reg [31:0] shamt;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	ShiftArithmetic uut (
		.inp(inp), 
		.shamt(shamt), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		inp = 0;
		shamt = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		inp=32'b00001111000011110000111100001111;
		shamt=32'd56;
		#100
		inp=32'b00001111000011110000111100001111;
		shamt=32'd20;
		#100
		inp=32'b11110000111100001111000011110000;
		shamt=32'd14;
		#100
		inp=32'b11110000111100001111000011110000;
		shamt=32'd35;
		

	end
      
endmodule

