`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:27 11/03/2019 
// Design Name: 
// Module Name:    BarrelShift 
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
module BarrelShift(
    input [31:0]inp,
    input dir,
    input [31:0]shiftamt,
    output [31:0]out
    );

wire [4:0]shamt= shiftamt[4:0];
wire [31:0]inp1l,inp1r,inp2l,inp2r,inp3l,inp3r,inp4l,inp4r,inp5l,inp5r;
wire [31:0]out1l,out2l,out3l,out4l,out5l;
wire [31:0]out1r,out2r,out3r,out4r,out5r;
wire [31:0]out1fl,out2fr;

assign inp1l={inp[15:0],16'b0000000000000000};
assign inp1r={16'b0000000000000000,inp[31:16]};

shiftmux a4(inp1l,inp,shamt[4],out1l);


assign inp2l={out1l[23:0],8'b00000000};

shiftmux a3(inp2l,out1l,shamt[3],out2l);

assign inp3l={out2l[27:0],4'b0000};
shiftmux a2(inp3l,out2l,shamt[2],out3l);
assign inp4l={out3l[29:0],2'b00};
shiftmux a1(inp4l,out3l,shamt[1],out4l);
assign inp5l={out4l[30:0],1'b0};
shiftmux a0(inp5l,out4l,shamt[0],out5l);



shiftmux b4(inp1r,inp,shamt[4],out1r);
assign inp2r={8'b00000000,out1r[31:8]};
shiftmux b3(inp2r,out1r,shamt[3],out2r);
assign inp3r={4'b0000,out2r[31:4]};
shiftmux b2(inp3r,out2r,shamt[2],out3r);
assign inp4r={2'b00,out3r[31:2]};
shiftmux b1(inp4r,out3r,shamt[1],out4r);
assign inp5r={1'b0,out4r[31:1]};
shiftmux b0(inp5r,out4r,shamt[0],out5r);

assign out1fl=(shiftamt>31)?32'b00000000000000000000000000000000:out5l;
assign out2fr=(shiftamt>31)?32'b00000000000000000000000000000000:out5r;

assign out=(dir==1)?out1fl:out2fr;
endmodule
