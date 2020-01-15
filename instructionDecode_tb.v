`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   15:57:00 10/28/2019
// Design Name:   instructionDecode
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/instructionDecode_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description:
//
// Verilog Test Fixture created by ISE for module: instructionDecode
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module instructionDecode_tb;

// Inputs
reg [31:0] instr;

// Outputs
wire [5:0] opcode;
wire [4:0] rsAddr;
wire [4:0] rtAddr;
wire [4:0] shAmt;
wire [15:0] imm;
wire [25:0] jAddr;
wire memWrite;

// Instantiate the Unit Under Test (UUT)
instructionDecode uut (
.instr(instr),
.opcode(opcode),
.rsAddr(rsAddr),
.rtAddr(rtAddr),
.shAmt(shAmt),
.imm(imm),
.jAddr(jAddr),
.memWrite(memWrite)
);

initial begin
// Initialize Inputs
instr = 0;

// Wait 100 ns for global reset to finish
#100;
instr=32'b0000110011101000000000000000000;
#100
instr=32'b00010100111010010000000000000001;
#100
instr=32'b11011000000000000000000000000011;
#100
instr=32'b11110000111000000000000000000000;

       
// Add stimulus here

end
     
endmodule