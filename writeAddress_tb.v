`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   16:24:20 10/28/2019
// Design Name:   writeaddress
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/writeAddress_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description:
//
// Verilog Test Fixture created by ISE for module: writeaddress
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module writeAddress_tb;

// Inputs
reg [5:0] opcode;
reg [4:0] rsAddr;
reg [31:0] ALUOut;
reg [31:0] ra;
reg [31:0] MemOut;

// Outputs
wire [4:0] wrAddr;
wire RegWrite;
wire [31:0] wrData;

// Instantiate the Unit Under Test (UUT)
writeaddress uut (
.opcode(opcode),
.rsAddr(rsAddr),
.ALUOut(ALUOut),
.ra(ra),
.MemOut(MemOut),
.wrAddr(wrAddr),  
.RegWrite(RegWrite),
.wrData(wrData)
); 

initial begin
// Initialize Inputs
opcode = 0;
rsAddr = 0;
ALUOut = 0;
ra = 0;
MemOut = 0;

// Wait 100 ns for global reset to finish
#100;

opcode=000000;
rsAddr=5'b00111;
ALUOut=31'd70;
ra=31'd100;
MemOut=31'd100;



       
// Add stimulus here

end
     
endmodule