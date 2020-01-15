`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:45:51 10/21/2019 
// Design Name: 
// Module Name:    ProgramIncrementor 
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
module ProgramIncrementor(

	input [31:0]pc,
	output [31:0]npc
    );
assign npc=pc+32'b00000000000000000000000000000001;
endmodule

