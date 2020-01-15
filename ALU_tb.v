`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   14:09:08 10/27/2019
// Design Name:   Alu_unit
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/ALU_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description:
//
// Verilog Test Fixture created by ISE for module: Alu_unit
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module ALU_tb;

// Inputs
reg signed [31:0] inp1;
reg signed [31:0] inp2;
reg [5:0] opcode;

// Outputs
wire [31:0] out;
wire [63:0] mulout;
wire carryFlag;
wire zFlag;
wire signFlag;
wire overflowFlag;

// Instantiate the Unit Under Test (UUT)
Alu_unit uut (
.inp1(inp1),
.inp2(inp2), 
.opcode(opcode),
.out(out),
.mulout(mulout),
.carryFlag(carryFlag),
.zFlag(zFlag),
.signFlag(signFlag),
.overflowFlag(overflowFlag)
);

initial begin
// Initialize Inputs
inp1 = 0;
inp2 = 0;
opcode = 0;

// Wait 100 ns for global reset to finish
#100;
inp1= 32'b00000000000000000000000000000000;
inp2= 32'b00000000000000000000000000000111;
opcode=6'b000001;//addi
#100       
// Add stimulus here
inp1= 32'b00000000000000000000000010001011;
inp2= 32'b11111111111111111111111111111111;
opcode=6'b000000;//add
#100
inp1= 32'b01111111111111100000011111111111;
inp2= 32'b01111111111111111111111111111111;
opcode=6'b000110; //and
#100

inp2= 32'b11111111111111111111111111111100;
opcode=6'b000101; // compi

#100
opcode=6'b001001; //shrl
inp1=32'b000111000111111000111000000111000;
inp2=32'b000000000000000000000000000001011;



#100
opcode=6'b001100; //shra
inp1=32'b11111100011111100011100000011100;
inp2=32'b000000000000000000000000000000011;

#100
opcode=6'b000010;//mult
inp1=32'b00000000000000000000000001111000;
inp2=32'b11111111111111111111111111110110;

#100
opcode=6'b000011;//multu
inp1=32'b00000000000000000000000001111000;
inp2=32'b11111111111111111111111111110110;

end
     
endmodule