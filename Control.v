`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:13 10/28/2019 
// Design Name: 
// Module Name:    Control 
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
module Control(
    input clk,
    input rst,
    output[31:0] rout, 
	 output [31:0]npcval, 
	 output [31:0]s0,
	 output [31:0]s1, 
	 output [31:0]s2,
	 output [31:0]t0,
	 output [31:0]t2,
	 output [31:0]t3,
	 output [31:0]t4,
	 output [31:0] reg19,
	 output [31:0] reg20,
    output [31:0] ansalu,
	 output [31:0]in1,
	 output [31:0]in2, 
	 output [4:0]rsAddro,
	 output [15:0]immo, 
	 output [31:0]rsDatao,
	 output [31:0]rtDatao,
	 output [31:0]out,
	 output [4:0]writeAddr,
	 output [31:0]regdata,
	 output regflag,
	 output mwrite,
	 output [9:0]memoryaddress,
	 output pcsrc, 
	 output zFLAG,
	 output [31:0]memoryoutput
	 );
 
wire PCSrcIn,PCSrc;        //to decide if we need to choose external NPC or incremented PC
wire [31:0] exNPCIn,exNPC;  //external NPC (coming from branch statements)
wire [31:0] npc,pc,npc_mux;  //Parts of instruction fetch

//Various Parameters of the instruction decoder
wire [5:0] opcode; 
wire [4:0] rsAddr,rtAddr,shamt,wrAddr;
wire [31:0] if_id_NPC;
wire [31:0] if_id_instr; 
wire [3:0] fcode;
wire [15:0] imm; 
wire [25:0] jAddr;
wire clk1,clk2;
wire  mulflag;
//RegWrite: To decide if we need to write in register
wire RegWrite;

//Data corresponding to rsAddr, rtAddr
wire [31:0] rsData,rtData,wrData;

//dout: output of Instuction_Memory, ra: return address
wire [31:0] dout,ra;

//To decide if we need to write in memory
wire MemWrite;

//Various flags
wire carryFlag,overflowFlag,zFlag,signFlag;

//ALU parameters
wire [31:0] ALUOut,inp1,inp2;
wire [63:0]mulout;
//MemOut: Data loaded, MemAddr: Address in Memory
wire [31:0] MemOut;
wire [31:0] MemAddrFull;
wire [9:0] MemAddr;

//clockDivide CD(clk,clk1,clk2);

//Instruction fetch module: Combination of 5 top modules

//mux2x1 M(npc, exNPC, PCSrc ,npc_mux);



ProgramCounter P1(~clk,rst,PCSrc,exNPC,pc);
assign npcval = pc;

blk_mem_gen_v7_3 IMEM(           //extract instruction
  .clka(clk), 
  .wea(0),
  .addra(pc),
  .dina(),
  .douta(dout)); 
instructionFetch if_id(clk,rst,dout,pc,if_id_instr,if_id_NPC);

assign rout = if_id_instr;
//ProgramIncrementor  pp(pc,npc);

       //increment


instructionDecode I_D( if_id_instr,opcode,rsAddr,rtAddr,shamt,imm,jAddr,MemWrite);
//Register File 32 x 32, can read from two registers and write into one register at a time
assign rsAddro=rsAddr;
assign immo=imm;
assign mwrite=MemWrite;

RegisterBank RF(clk,RegWrite,wrAddr,wrData, rsAddr,rtAddr,mulflag,mulout,rsData,rtData,s0,s1,s2,t0,t2,t3,t4,reg19,reg20);
assign rsDatao=rsData;
assign rtDatao=rtData;


//Get the Address from Memory where we need to load/store
assign MemAddrFull=rsData+imm;	 
assign MemAddr=MemAddrFull[31:0];
assign memoryaddress=MemAddr;


//Assign inputs assigns values to the two inputs of the ALU based on the opcode and fcode

AssignALUInput a_i(rsData,rtData,shamt,imm,opcode,inp1,inp2);
//given two inputs, opcode and fcode, ALU gives the output and updates flags	 
assign in1=inp1;
assign in2=inp2;
Alu_unit alu( inp1, inp2,opcode,out, mulout,carryFlag,zFlag, signFlag,overflowFlag,mulflag);
assign ansalu = out;
assign zFLAG=zFlag;
//given the opcode, fcode, labels and flags, branch gives the new exNPC where we need to jump and updates PCSrc

branchlogic b(opcode, rsData,jAddr,carryFlag,zFlag,overflowFlag,signFlag,if_id_NPC,exNPC,PCSrc,ra);
//WriteAddress decides if we need to write something
//if yes, what and where based on opcode and fcode
//there are multiple options to write like ALUOut (Arithmetic and shift op)
//ra (call a function case) and MemOut(load case)
//	loadstore(opcode, rsData, rtData)
assign pcsrc=PCSrc;


writeaddress wa(clk,opcode,rtAddr,rsAddr, out, ra, MemOut,wrAddr,RegWrite,wrData);
assign writeAddr=wrAddr;
assign regdata=wrData;
assign regflag=RegWrite;

//Data Block RAM 
datamemory dm (
  .clka(~clk), 
  .wea(MemWrite), 
  .addra(MemAddr), 
  .dina(rtData),
  .douta(MemOut) 
);
assign memoryoutput=MemOut;
endmodule
