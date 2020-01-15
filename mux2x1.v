`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:24:14 10/26/2019 
// Design Name: 
// Module Name:    mux2x1 
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
module mux2x1(
    input [31:0] in0,
    input [31:0] in1,
    input sel, 
    output [31:0] out
    );

assign out=sel?in1:in0;   //if sel is 1, choose inp1 else choose inp2



endmodule
