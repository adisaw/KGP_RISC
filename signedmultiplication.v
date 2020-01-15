`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:58 10/28/2019 
// Design Name: 
// Module Name:    signedmultiplication
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
module signedmultiplication(
    input [31:0]inp1,
    input [31:0]inp2,
    output signed [63:0]out
	 /*output [63:0]P1,
output [63:0]P2,
output [63:0]P3,
output [61:0]P4*/
    );
wire [63:0]P1;
wire [63:0]P2;
wire [63:0]P3;
wire [63:0]P4;
wire [1921:0] p;  
wire [30:0]a;
wire [30:0]b;
assign a=inp1[30:0];
assign b=inp2[30:0];
assign  P1=(inp1[31]&inp2[31])<<62;
assign P2=(inp2[30:0]&{31{inp1[31]}})<<31;
assign P3=(inp1[30:0]&{31{inp2[31]}})<<31;
      //assign width as input bits multiplyied by 
 
 genvar i;        
 assign p[61:0] = a[0] ? b : 0;  //first output size bits          
  generate            
      for (i = 1; i < 31; i = i+1)       
         begin: test        
             assign p[(31*(4+(2*(i-1))))-1 : (31*2)*i] = (a[i]?b<<i :0) + p[(31*(4+(2* 
                (i-2))))-1 :(31*2)*(i-1)];       
         end     
   endgenerate          
  assign P4={2'b00,p[1921:1860]};    //taking last output size bits            
  assign out =P1-P2-P3+P4;
 



endmodule
