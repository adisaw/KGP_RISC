`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:52 11/03/2019 
// Design Name: 
// Module Name:    ShiftArithmetic 
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
module ShiftArithmetic(
    input [31:0]inp,
    input [31:0]shamt,
    output [31:0]out
    );
wire sign=inp[31];
wire [31:0]inp1r,out1r,inp2r,out2r,inp3r,out3r,inp4r,out4r,inp5r,out5r;
wire [31:0]inp1,out1,inp2,out2,inp3,out3,inp4,out4,inp5,out5;
wire [31:0]outf1,outf2;
assign inp1r={16'b0000000000000000,inp[31:16]};
assign inp1={16'b1111111111111111,inp[31:16]};
shiftmux b4(inp1r,inp,shamt[4],out1r);
assign inp2r={8'b00000000,out1r[31:8]};
shiftmux b3(inp2r,out1r,shamt[3],out2r);
assign inp3r={4'b0000,out2r[31:4]};
shiftmux b2(inp3r,out2r,shamt[2],out3r);
assign inp4r={2'b00,out3r[31:2]};
shiftmux b1(inp4r,out3r,shamt[1],out4r);
assign inp5r={1'b0,out4r[31:1]};
shiftmux b0(inp5r,out4r,shamt[0],out5r);

shiftmux a4(inp1,inp,shamt[4],out1);
assign inp2={8'b11111111,out1[31:8]};
shiftmux a3(inp2,out1,shamt[3],out2);
assign inp3={4'b1111,out2[31:4]};
shiftmux a2(inp3,out2,shamt[2],out3);
assign inp4={2'b11,out3[31:2]};
shiftmux a1(inp4,out3,shamt[1],out4);
assign inp5={1'b1,out4[31:1]};
shiftmux a0(inp5,out4,shamt[0],out5);

assign outf1=(shamt>31)?32'b00000000000000000000000000000000:out5r;
assign outf2=(shamt>31)?32'b11111111111111111111111111111111:out5;

assign out=(sign==1)?outf2:outf1;
endmodule
