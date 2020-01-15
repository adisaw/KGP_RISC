`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:36:59 10/29/2019 
// Design Name: 
// Module Name:    adder 
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
module adder(
    input [31:0]inp1,
    input [31:0]inp2,
    output [31:0]out,
	 output c31,
	 output c32
    );




  wire [30:0] carry;
   genvar i;
   generate 
   for(i=0;i<31;i=i+1)
     begin: add
   if(i==0) 
  half_adder f(inp1[0],inp2[0],out[0],carry[0]);
   else
  full_adder f(inp1[i],inp2[i],carry[i-1],out[i],carry[i]);
     end
  assign c31=carry[30];
  full_adder k(inp1[31],inp2[31],c31,out[31],c32);
   endgenerate
endmodule 


// Verilog code for half adder 
module half_adder(x,y,s,c);
   input x,y;
   output s,c;
   assign s=x^y;
   assign c=x&y;
endmodule // half adder

 
// Verilog code for full adder 
module full_adder(x,y,c_in,s,c_out);
   input x,y,c_in;
   output s,c_out;
 assign s = (x^y) ^ c_in;
 assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule // full_adder
