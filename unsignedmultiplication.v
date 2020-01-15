`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:57 10/28/2019 
// Design Name: 
// Module Name:    unsignedmultiplication 
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
module unsignedmultiplication(
    input [31:0]inp1,
    input [31:0]inp2,
    output [63:0]out
    );
wire [2047:0]p;

genvar i;        
 assign p[63:0] = inp1[0] ? inp2 : 0;  //first output size bits          
  generate            
      for (i = 1; i < 32; i = i+1)       
         begin: test        
             assign p[(32*(4+(2*(i-1))))-1 : (32*2)*i] = (inp1[i]?inp2<<i :0) + p[(32*(4+(2* 
                (i-2))))-1 :(32*2)*(i-1)];       
         end     
   endgenerate          
  assign out=p[2047:1984];     //taking last output size bits            
endmodule  

