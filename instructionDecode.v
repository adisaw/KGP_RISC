`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:34 10/16/2019 
// Design Name: 
// Module Name:    instructionDecode 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instructionDecode(
    input [31:0] instr,
	 output reg [5:0]opcode,
	 output reg [4:0]rsAddr,
	 output reg [4:0]rtAddr,
	  output reg [4:0]shAmt,
	 output reg [15:0]imm,
	  output reg [25:0]jAddr,
	  output reg memWrite
	 
    );

always @(*)
begin
	opcode=instr[31:26];       //Opcode is always the first 3 bits
	memWrite=0;
	if(opcode[5]==0 && opcode[4]==0)        //Arithmetic and Shift Operations
		begin
		rsAddr=instr[25:21];
		rtAddr=instr[20:16];
		shAmt=instr[15:11];
		imm=instr[15:0];
		jAddr=26'b0;
		end
	else if(opcode[5]==0 && opcode[4]==1)   //Load Word Operations
		begin
		rsAddr=instr[25:21];
		rtAddr=instr[20:16];
		shAmt=5'b0;
		imm=instr[15:0];
		jAddr=26'b0;
		end
	else if(opcode[5]==1 && opcode[4]==0)   //Store Word Operations
		begin
		rsAddr=instr[25:21];
		rtAddr=instr[20:16];
		shAmt=5'b0;
		imm=instr[15:0];
		jAddr=26'b0;
		memWrite=1;
		end 
	else if(opcode[5]==1 && opcode[4]==1 && opcode[3]==1 && opcode[2]==1)    //JR Type instruction  
		begin
		rsAddr=instr[25:21];
		rtAddr=5'b0;
		shAmt=5'b0;
		imm=16'b0;
		jAddr=26'b0;
		end
	else                 //Jump type instruction
		begin
		rsAddr=5'b0;
		rtAddr=5'b0;
		shAmt=5'b0;
		imm=16'b0;
		jAddr=instr[25:0];
		end 
end

endmodule
