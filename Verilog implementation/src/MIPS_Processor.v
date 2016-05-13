	
	
	module MIPS ();
	    wire [31:0] address,pc_out,instr_out,extenderOut,WriteData,
		readdata1,readdata2,Alu_Input2,AluOut,OutMemory,PC_Plus_1,SllOut1,ADDER2out,JumpAdd,ToMuxJump,ToMuxJr; 
		wire branch,reset,memRead,memWrite,aluSrc,regWrite,j,ZeroSignal,JR,InToMux2_2,REGWRITE1; 
		wire [4:0] muxRegDes;
		wire [1:0] RegDes,memToReg;
		wire [2:0] aluOp;
		wire [3:0] 	AluControlOut;	
		
	
		
   // -- Instantiation of modules components  -- //	
   pc_counter PC_COUNTER(address,pc_out,reset);	 
   intstructionmemory Instr_mem(pc_out,instr_out); 
   andgate And_Of_Jr(regWrite,!JR,REGWRITE1) ;
   mux3 MUX3_Of_Regfile(instr_out[20:16],instr_out[15:11],5'b11111,0,muxRegDes,RegDes);  
   contoller  CONTROLLER (instr_out[31:26] , RegDes , branch , memRead , memWrite , aluOp , memToReg , aluSrc , regWrite,j);
   regfile   REGFILE(instr_out[25:21],instr_out[20:16],muxRegDes,WriteData,REGWRITE1,readdata1,readdata2);	 
   extender EXTENDER(instr_out[15:0],extenderOut); 
   mux  MUX2_1(readdata2,extenderOut,aluSrc,Alu_Input2);
   alu   ALU(AluControlOut,readdata1,Alu_Input2,instr_out[10:6],AluOut,ZeroSignal);
   alucontroller AluController(aluOp,instr_out[5:0],AluControlOut,JR);
   data_memory   DataMemory(AluOut,readdata2,OutMemory, memRead , memWrite); 	
   mux3_32  MUX3_Of_DataMemory(AluOut,OutMemory,PC_Plus_1,0,memToReg,WriteData); 
   adder ADDER1(pc_out,32'h00000001,PC_Plus_1);
   adder ADDER2(extenderOut,PC_Plus_1,ADDER2out); 
   andgate AndGate1(ZeroSignal,	branch,InToMux2_2);
   mux  MUX2_2(PC_Plus_1, ADDER2out,InToMux2_2,ToMuxJump);
   conc CONCUNIT(instr_out[25:0],PC_Plus_1[31:26],JumpAdd); 
   mux 	MUX2_3(	ToMuxJump,JumpAdd,j,ToMuxJr);
   mux  MUX2_4 (ToMuxJr,readdata1,JR,address); // address should be 00000004(hex) ==> due to the initiation of address.
   
   
   
   
   
   
   
   
   
   
   																						
	endmodule
