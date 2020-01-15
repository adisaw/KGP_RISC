`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:22:25 11/03/2019 
// Design Name: 
// Module Name:    shiftmux 
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
module shiftmux(
    input [31:0]inp1,
    input [31:0]inp2,
    input sel,
    output [31:0]out
    );
 assign out=(sel==1)?inp1:inp2;

endmodule
