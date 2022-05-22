
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity CPU is
    Port ( START : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           RegFileOut1 : out  STD_LOGIC_VECTOR (31 downto 0);
           RegFileOut2 : out  STD_LOGIC_VECTOR (31 downto 0);
           ALUOut : out  STD_LOGIC_VECTOR (31 downto 0);
           PCOut : out  STD_LOGIC_VECTOR (31 downto 0);
           DataMemOut :out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
			
			 
end CPU;

architecture Behavioral of CPU is


-------------------------------------------------------------- Adder Component
component adder32bit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0);
			  Cout : out  STD_LOGIC);
end component;



-------------------------------------------------------------- Sign Extender Component
component SignExtender16_32 is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


-------------------------------------------------------------- Shifter Component

component Shifter is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end component;


-------------------------------------------------------------- Register File Component
component RegisterFile is
	port(
		 read_sel1 : in std_logic_vector(4 downto 0);
		 read_sel2 : in std_logic_vector(4 downto 0);
		 write_sel : in std_logic_vector(4 downto 0);
		 write_ena : in std_logic;
		 clk: in std_logic;
		 write_data: in std_logic_vector(31 downto 0);
		 data1: out std_logic_vector(31 downto 0);
		 data2: out std_logic_vector(31 downto 0)
	);
end component;


-------------------------------------------------------------- Alu Component

component t_32_bit_alu is
port(
		data1 : in std_logic_vector(31 downto 0);
		data2 : in std_logic_vector(31 downto 0);
		aluop : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		dataout: out std_logic_vector(31 downto 0);
		cflag: out std_logic;
		zflag: out std_logic;
		oflag: out std_logic;
		is_slt: out std_logic;
		slt:out std_logic
);
end component;

-------------------------------------------------------------- 32-bit 2x1 Mux File Component

component Mux_2x1_32bit is
    Port ( input0 : in  STD_LOGIC_VECTOR (31 downto 0);
           input1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  selector: in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;



-------------------------------------------------------------- Data memory Component

component Data_memory is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           memRead : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           readData : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk:in std_logic);
end component;



-------------------------------------------------------------- ControlUnit  Component

component ControlUnit is
    Port ( Jump : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           RegDst : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           Instruction31to26 : in  STD_LOGIC_VECTOR (5 downto 0));
end component;


-------------------------------------------------------------- ALUControlUnit  Component

component ALUControlUnit is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Instruction5to0 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUfinalOp : out  STD_LOGIC_VECTOR (3 downto 0)
			 );
end component;




-------------------------------------------------------------- PC  Component
COMPONENT pc_unit
    PORT(
         clk : IN  std_logic;
         I_PC : IN  std_logic_vector(31 downto 0);
         O_pc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

-------------------------------------------------------------- InstructionMemory  Component
component InstructionMemory is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           readData : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk: in std_logic);
end component;





---------------- Instruction Memory and PC signals
signal InstructionMemoryReadAddress :std_logic_vector (31 downto 0);
signal PCInput :std_logic_vector (31 downto 0);
signal Instruction:std_logic_vector (31 downto 0);
signal plus4incremented:std_logic_vector (31 downto 0);
signal shiftedleft28bits:std_logic_vector (27 downto 0);

--------------- ControlUnit signals

signal ALUOp:std_logic_vector (1 downto 0);
signal Jump:std_logic;
signal Branch:std_logic;
signal MemRead:std_logic;
signal MemWrite:std_logic;
signal MemToReg:std_logic;
signal ALUSrc:std_logic;
signal write_ena:std_logic;
signal RegDist:std_logic;


-------------- branchcontrol Signal
signal PCSrc:std_logic;
signal JumpFullAddress:std_logic_vector (31 downto 0);
signal ExtendedSign:std_logic_vector (31 downto 0);
signal ShifterBOutput:std_logic_vector (31 downto 0);
signal AdderBOutput:std_logic_vector (31 downto 0);
signal AdderAOutput:std_logic_vector (31 downto 0);
signal ALUfinalOp :STD_LOGIC_VECTOR (3 downto 0);
signal beq :std_logic;


------------------ Register signals
signal regData1:std_logic_vector (31 downto 0);
signal regData2:std_logic_vector (31 downto 0);
signal regDataWrite:std_logic_vector (31 downto 0);
signal read_sel1 :  std_logic_vector(4 downto 0);
signal read_sel2 :  std_logic_vector(4 downto 0);
	
	
----------------- ALU signals
signal ALUOutput: std_logic_vector(31 downto 0);
signal cflag :std_logic;
signal zflag :std_logic;
signal is_slt :std_logic;
signal slt :std_logic;

--------------- data Memory signals
signal MemoryReadData :std_logic_vector (31 downto 0);



---------------Muxs outputs
signal MuxAOutput:std_logic_vector (31 downto 0);
signal MuxCOutput:std_logic_vector (31 downto 0);
signal MuxDOutput:std_logic_vector (31 downto 0);
signal MuxSLTOutput:std_logic_vector(31 downto 0);
signal sltres:std_logic;
signal fullslt:std_logic_vector(31 downto 0);

signal bne: std_logic ;

begin

	bne<='1' when Instruction(31 downto 26)="000101"else '0';
	beq<='1' when Instruction(31 downto 26)="000100"else '0';
	JumpFullAddress(31 downto 28)<=plus4incremented(31 downto 28);
		
	fullslt(31 downto 1)<="0000000000000000000000000000000";
	fullslt(0)<=sltres;
	
	JumpFullAddress(27 downto 0)<=AdderAOutput(27 downto 0 );
	ShifterA :Shifter port map(A=>Instruction,B=>AdderAOutput);
	
	SignExtenderA: SignExtender16_32 port map(input=>Instruction(15 downto 0),output=>ExtendedSign);
	ShifterB :Shifter port map(A=>ExtendedSign,B=>ShifterBOutput);
	
	
	AdderA: adder32bit port map (A=>InstructionMemoryReadAddress,B=>"00000000000000000000000000000100",C=>plus4incremented);
	AdderB: adder32bit port map (A=>plus4incremented,B=>ShifterBOutput,C=>AdderBOutput);
	
	
	
	--------------- Muxes
	MuxA: Mux_2x1_32bit port map (input0=>plus4incremented,
											input1=>AdderBOutput,
											selector=>PCSrc,
											output=>MuxAOutput);
											
	MuxB: Mux_2x1_32bit port map (input0=>MuxAOutput,
											input1=>JumpFullAddress,
											selector=>Jump,
											output=>PCInput);
											
	MuxC: Mux_2x1_32bit port map (input0=>"000000000000000000000000000"&Instruction(20 downto 16),
											input1=>"000000000000000000000000000"&Instruction(15 downto 11),
											selector=>RegDist,
											output=>MuxCOutput);
											
	

	
										
	
	MuxD: Mux_2x1_32bit port map (input0=>regdata2,
											input1=>ExtendedSign,
											selector=>ALUSrc,
											output=>MuxDOutput);	
											
		MuxSLT: Mux_2x1_32bit port map (input0=>regDataWrite,
											 input1=>fullslt,
											 selector=>is_slt,
											 output=>MuxSLTOutput);	
											
	MuxE: Mux_2x1_32bit port map (input0=>ALUOutput,
											input1=>MemoryReadData,
											selector=>MemToReg,
											output=>regDataWrite);										
												
											
	MyControlUnit : ControlUnit port map(  Jump=>Jump,
														Branch=>Branch,
														MemRead=>MemRead,
														MemWrite=>MemWrite,
														MemToReg=>MemToReg,
														ALUSrc=>ALUSrc,
														AlUOp=>AlUOp,
														RegWrite=>write_ena,
														RegDst=>RegDist,
														Instruction31to26 => Instruction(31 downto 26));
														
												
	MyALUControlUnit: ALUControlUnit port map(ALUOp=>ALUOp,
															Instruction5to0=>Instruction(5 downto 0),
															ALUfinalOp=>ALUfinalOp
															);
	
	ALU :t_32_bit_alu PORT MAP (
          data1 => regData1,
          data2 => MuxDOutput,
          aluop => ALUfinalOp,
          dataout => ALUOutput,
          cflag => cflag,
          zflag => zflag,
          cin=>'0',
			 is_slt=>is_slt,
			 slt=>sltres
        );
	
	MyRegisterFile:RegisterFile PORT MAP (
          read_sel1 => Instruction(25 downto 21),
          read_sel2 => Instruction(20 downto 16),
          write_sel => MuxCOutput(4 downto 0),
          write_ena => write_ena,
          clk => clk,
          write_data => MuxSLTOutput,
          data1 => regData1,
          data2 => regData2
        );

	DataMemory : Data_memory PORT MAP (
          address => ALUOutput,
          writeData => regdata2,
          memRead => MemRead,
          memWrite => MemWrite,
          readData => MemoryReadData,
			 clk=>clk
        );
		  
		  
	MyPcUnit:pc_unit port map(clk=>clk,I_PC=>PCInput,O_PC=>InstructionMemoryReadAddress);
	MYInstructionMemory :	  InstructionMemory Port  map( address => InstructionMemoryReadAddress, readData=>Instruction,clk=>clk);
		  
		  
	PCSrc <= ((zflag and beq)or( not zflag and bne)) and Branch;
	
		RegFileOut1<= regData1;
		RegFileOut2<= regData2;
		ALUOut<=ALUOutput;
		DataMemOut<=MemoryReadData;
		PCOut<=InstructionMemoryReadAddress;
	
end Behavioral;

