library std;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all; use IEEE.STD_LOGIC_ARITH.ALL;
entity mips_processor is
end mips_processor;
architecture behave122 of mips_processor is	
   signal address,pc_out,instr_out,extenderOut,WriteData,readdata1,readdata2,Alu_Input2,AluOut,OutMemory,PC_Plus_1,SllOut1,ADDER2out,JumpAdd,ToMuxJump,ToMuxJr: std_logic_vector (31 downto 0);
   signal branch,reset,memRead,memWrite,aluSrc,regWrite,j,ZeroSignal,JR,InToMux2_2,NotJr,REGWRITE1: std_logic;
   signal muxRegDes : std_logic_vector(4 downto 0);
   signal RegDes,memToReg : std_logic_vector (1 downto 0);
   signal aluOp : std_logic_vector (2 downto 0);
   signal AluControlOut : std_logic_vector (3 downto 0);
   component controller port (op_code: in std_logic_vector(5 downto 0) ; regDst: out std_logic_vector(1 downto 0); 
	branch , memRead , memWrite: out std_logic; memToReg: out std_logic_vector(1 downto 0);
	aluSrc , regWrite,j: out std_logic;aluOp : out std_logic_vector(2 downto 0));
   end component; 
   component  pc_counter port(addressin :in std_logic_vector(31 downto 0);
	addressout :out std_logic_vector(31 downto 0);reset :in std_logic);
   end component;										  
   component mux3 port(a,b,c,d:in std_logic_vector(4 downto 0);
	sel:in std_logic_vector(1 downto 0);y:out std_logic_vector(4 downto 0));
   end component;
   component  instruction PORT (pc : in STD_LOGIC_VECTOR(31 downto 0);inst : out STD_LOGIC_VECTOR(31 downto 0));
   end component;
   component andgate port(a:in std_logic;b:in std_logic;y:out std_logic);
   end component;
   component ram_vhdl PORT (readreg1 : in STD_LOGIC_VECTOR(4 downto 0);readreg2 : in STD_LOGIC_VECTOR(4 downto 0);
			writereg : in STD_LOGIC_VECTOR(4 downto 0); writedata : in STD_LOGIC_VECTOR(31 downto 0);	
			regwrite : in STD_LOGIC;readdata1 : out STD_LOGIC_VECTOR(31 downto 0);
			readdata2 : out STD_LOGIC_VECTOR(31 downto 0));
   end component;
   component extender port(x:in std_logic_vector(15 downto 0);y:out std_logic_vector(31 downto 0));
   end component;
   component alu port (a,b:in std_logic_vector(31 downto 0);signal1 :in std_logic_vector(3 downto 0);
	shamt :in std_logic_vector(4 downto 0);output: out std_logic_vector(31 downto 0);zerosignal:out std_logic);
   end component;
   component alucontroller port (alusignal :in std_logic_vector(2 downto 0);functionsignal :in std_logic_vector(5 downto 0);
    out_data :out std_logic_vector(3 downto 0);outforjr :out std_logic);
   end component;
   component data PORT (addr : in STD_LOGIC_VECTOR(31 downto 0);datain : in STD_LOGIC_VECTOR(31 downto 0);
	dataout : out STD_LOGIC_VECTOR(31 downto 0);rd : in STD_LOGIC;wr: in STD_LOGIC); 
   end component;
   component mux3_32 port(a,b,c:in std_logic_vector(31 downto 0);y:out std_logic_vector(31 downto 0);
    sel:in std_logic_vector(1 downto 0)); 
   end component;
   component adder port(a:in std_logic_vector(31 downto 0);b:in std_logic_vector(31 downto 0);output:out std_logic_vector(31 downto 0) ) ;
   end component;
   component  mux port(a:in std_logic_vector(31 downto 0);b:in std_logic_vector(31 downto 0);
      y:out std_logic_vector(31 downto 0);sel:in std_logic);
   end component;
   component conc port(a:in std_logic_vector(25 downto 0);b:in std_logic_vector(5 downto 0);
    y:out std_logic_vector(31 downto 0));
   end component;
   
begin  
	NotJr <= not(JR);
	PC_COUNT: pc_counter port map(addressin => address,addressout => pc_out,reset => reset);
	Instr_mem: instruction port map(pc => pc_out,inst => instr_out); 
	And_Of_Jr: andgate port map(a => regWrite,b => NotJr,y => REGWRITE1) ;
	MUX3_Of_Regfile: mux3 port map(a => instr_out(20 downto 16),b => instr_out(15 downto 11),c => "11111",d => "00000",y => muxRegDes,sel => RegDes);
	CONTROL: controller port map(op_code => instr_out(31 downto 26) ,regDst => RegDes ,branch => branch ,memRead => memRead ,memWrite => memWrite ,aluOp => aluOp ,memToReg => memToReg ,aluSrc => aluSrc ,regWrite => regWrite,j => j);
	REGFILE: ram_vhdl port map(readreg1 => instr_out(25 downto 21),readreg2 => instr_out(20 downto 16),writereg => muxRegDes,writedata => WriteData,regwrite => REGWRITE1,readdata1 => readdata1,readdata2 => readdata2);
	EXTEND: extender port map(x => instr_out(15 downto 0),y => extenderOut);
	MUX2_1: mux port map(a => readdata2,b => extenderOut,sel => aluSrc,y => Alu_Input2);
	AL: alu port map(a => readdata1,b => Alu_Input2,signal1 => AluControlOut,shamt => instr_out(10 downto 6),output => AluOut,zerosignal => ZeroSignal);
	AluControl: alucontroller port map(alusignal => aluOp,functionsignal => instr_out(5 downto 0),out_data => AluControlOut,outforjr => JR);
	DataMemory: data port map(addr => AluOut,datain => readdata2,dataout => OutMemory,rd => memRead ,wr =>  memWrite); 
	MUX3_Of_DataMemory: mux3_32 port map(a => AluOut,b => OutMemory,c => PC_Plus_1,sel => memToReg,y => WriteData);
	ADDER1: adder port map(a => pc_out, b=> x"00000001",output => PC_Plus_1);
    ADDER2: adder port map(a => extenderOut,b => PC_Plus_1,output => ADDER2out); 
	AndGate1: andgate port map(a => ZeroSignal,b => branch,y => InToMux2_2);
	MUX2_2: mux port map(a => PC_Plus_1,b => ADDER2out,sel => InToMux2_2,y => ToMuxJump);
	CONCUNIT: conc port map(a => instr_out(25 downto 0),b => PC_Plus_1(31 downto 26),y => JumpAdd);
	MUX2_3: mux port map(a => ToMuxJump,b => JumpAdd,sel => j,y => ToMuxJr);
    MUX2_4: mux port map(a => ToMuxJr,b => readdata1,sel => JR,y => address);
end behave122;