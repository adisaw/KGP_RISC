`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:09:41 10/27/2019
// Design Name:   branchlogic
// Module Name:   C:/class work/third year/coa lab/KGP_RISC/branch_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: branchlogic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module branch_tb;

	// Inputs
	reg [5:0] opcode;
	reg [31:0] rs;
	reg [25:0] jAddr;
	reg carryFlag;
	reg zFlag;
	reg overflowFlag;
	reg signFlag;
	reg [31:0] PC;

	// Outputs 
	wire [31:0] exNPC;
	wire PCSrc;
	wire [31:0] ra;

	// Instantiate  the Unit Under Test (UUT)
	branchlogic uut (
		.opcode(opcode), 
		.rs(rs), 
		.jAddr(jAddr), 
		.carryFlag(carryFlag), 
		.zFlag(zFlag), 
		.overflowFlag(overflowFlag), 
		.signFlag(signFlag), 
		.PC(PC), 
		.exNPC(exNPC), 
		.PCSrc(PCSrc), 
		.ra(ra)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		rs = 0;
		jAddr = 0;
		carryFlag = 0;
		zFlag = 0;
		overflowFlag = 0;
		signFlag = 0;
		PC = 0;

		// Wait 100 ns for global reset to finish
		#100; 
        opcode=6'b110011;
		  rs=0; 
		  jAddr=25'b0110011010111110000010101;
		  carryFlag=1;
	 #100;
		  opcode=6'b110011;
		  rs=0; 
		  jAddr=25'b0110011010111110000010101;
		  carryFlag=0;
	  #100;
		  opcode=6'b111001;
		  rs=0;
			  PC=32'b1100110011001100110011001111111;
	 	  jAddr=25'b1111111111111111000010101;
		  #100;
	  	  rs=0;
		  #100;
		// Add stimulus here

	end 
         
endmodule

