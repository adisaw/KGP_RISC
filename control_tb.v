`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:39:56 11/03/2019
// Design Name:   Control
// Module Name:   E:/3rd year/COA Lab/KGP_RISC/control_tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
//  
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
 
module control_tb;
 
	// Inputs
	reg clk; 
	reg rst;
	wire [31:0] rout;
	wire [31:0]npcval; 
	wire [31:0]s0;
	wire [31:0]s1;
	wire [31:0]s2;
	wire [31:0]t0;
	wire [31:0]t2;
	wire [31:0]t3;
	wire [31:0]t4;
	wire [31:0]reg19;
	wire [31:0]reg20;
	wire [31:0]ansalu;
	wire [31:0]in1;
	wire [31:0]in2;
	wire [4:0]rsAddro;
	wire [15:0]immo;
	wire [31:0]rsDatao;
	wire [31:0]rtDatao;
	wire [31:0] out;
	wire [4:0]writeAddr;
	wire [31:0]regdata; 
	wire regflag;
	wire mwrite;
	wire pcsrc;
	wire [9:0]memoryaddress;
	wire zFLAG;
	wire [31:0]memoryoutput;
	
	// Instantiate the Unit Under Test (UUT)
	Control uut ( 
		.clk(clk),  
		.rst(rst),
		.rout(rout), 
		.npcval(npcval),
		.s0(s0), 
		.s1(s1),
		.s2(s2),
		.t0(t0),
		.t2(t2),
		.t3(t3),
		.t4(t4),
		.reg19(reg19),
		.reg20(reg20),
		.ansalu(ansalu),
		.in1(in1),
		.in2(in2),
		.rsAddro(rsAddro),
		.immo(immo),
		.rsDatao(rsDatao),
		.rtDatao(rtDatao), 
		.out(out),
		.writeAddr(writeAddr),
		.regflag(regflag),
		.mwrite(mwrite),
		.regdata(regdata),
		.pcsrc(pcsrc),
		.zFLAG(zFLAG),
		.memoryaddress(memoryaddress),
		.memoryoutput(memoryoutput)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// A dd stimulus here

	end 
		always
		#0.5 clk=!clk;
      
endmodule

