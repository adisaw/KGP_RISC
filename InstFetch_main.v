`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:26 10/21/2019 
// Design Name: 
// Module Name:    InstFetch_main 
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
module InstFetch(
	 input clk,
	 input rst,
	 input [31:0]dout,
    input [31:0] Ex_NPC,
	 output [31:0] out_instr,
	 output [31:0] out_NPC
    );

wire [31:0] npc,pc; 


ProgramCounter P1(clk,npc,pc);  
  
  
instructionFetch if_id(clk,rst,dout,npc,out_instr,out_NPC);
ProgramIncrementor  pp(clk,rst,pc,npc);


endmodule