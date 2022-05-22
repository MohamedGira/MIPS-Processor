
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ALUControlUnit is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           Instruction5to0 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUfinalOp : out  STD_LOGIC_VECTOR (3 downto 0)
			  );
end ALUControlUnit;

architecture Behavioral of ALUControlUnit is

begin
ALUfinalOp<= "0000"when ALUOp="10" and Instruction5to0="100100" else  	--AND	
				 "0001"when ALUOp="10" and Instruction5to0="100101" else		--OR
				 "0010"when ALUOp="10" and Instruction5to0="100000" else		--ADD
				 "0110"when ALUOp="10" and Instruction5to0="100010" else		--SUB
				 "0111"when ALUOp="10" and Instruction5to0="101010" else		--SLT
				 "1100"when ALUOp="10" and Instruction5to0="100111" else		--NOR
				 
				 
				 "0010"when ALUOp="00" else		--lw sw
				 "0110"when ALUOp="01" else		--bne beq
				 "XXXX";
				 --the ands are probably useless

end Behavioral;

