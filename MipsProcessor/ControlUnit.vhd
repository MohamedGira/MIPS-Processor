
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ControlUnit is
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
end ControlUnit;

architecture Behavioral of ControlUnit is

begin
process(Instruction31to26) 
begin
case Instruction31to26 is 
	when "000000"=>  --R-format
		Jump<='0';
		Branch<='0';
		MemToReg<='0';
		MemWrite<='0';
      MemRead<='0';
		ALUSrc<='0';
		RegWrite<='1';
		RegDst<='1';
		ALUOp<="10";
	when "100011"=>  --lw
		Jump<='0';
		Branch<='0';
		MemToReg<='1';
		MemWrite<='0';
      MemRead<='1';
		ALUSrc<='1';
		RegWrite<='1';
		RegDst<='0';
		ALUOp<="00";
	when "101011"=>  --sw
		Jump<='0';
		Branch<='0';
		MemToReg<='0';
		MemWrite<='1';
      MemRead<='0';
		ALUSrc<='1';
		RegWrite<='0';
		RegDst<='0';
		ALUOp<="00";
	
	when "000100"=>  --beq
		Jump<='0';
		Branch<='1';
		MemToReg<='0';
		MemWrite<='0';
        MemRead<='0';
		ALUSrc<='0';
		RegWrite<='0';
		RegDst<='0';
		ALUOp<="01";
	
	when "000101"=>  --bne
		Jump<='0';
		Branch<='1';
		MemToReg<='0';
		MemWrite<='0';
        MemRead<='0';
		ALUSrc<='0';
		RegWrite<='0';
		RegDst<='0';
		ALUOp<="01";
		
		when "000010"=>  --jump
		Jump<='1';
		Branch<='0';
		MemToReg<='0';
		MemWrite<='0';
        MemRead<='0';
		ALUSrc<='0';
		RegWrite<='0';
		RegDst<='0';
		ALUOp<="00";
		
		when others =>   
      Jump<='0';
		Branch<='0';
		MemToReg<='0';
		MemWrite<='0';
      MemRead<='0';
		ALUSrc<='0';
		RegWrite<='0';
		RegDst<='0';
		ALUOp<="00";
end case;
end process;
end Behavioral;

