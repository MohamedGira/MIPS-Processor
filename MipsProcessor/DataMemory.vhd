
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.All;


entity Data_memory is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           writeData : in  STD_LOGIC_VECTOR (31 downto 0);
           memRead : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           readData : out  STD_LOGIC_VECTOR (31 downto 0);
			  			CLK       : in STD_LOGIC
);
end Data_memory;

architecture Behavioral of Data_memory is
signal real_address: std_logic_vector(5 downto 0);
type RAM_32_X_64 is array(0 to 63) of std_logic_vector(31 downto 0);

signal Memory : RAM_32_X_64 := (	x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											"00000000000000000000000000001100",
											"00000000000000000000000000000001",
											"00000000000000000000000000000100",
											x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000",
											x"00000000",x"00000000"
);

begin

real_address <= address(7 downto 2);





Memory(to_integer(unsigned(real_address))) <= writeData when memWrite = '1' and clk'event and clk='0';


readData <= Memory(to_integer(unsigned(real_address))) ;

end Behavioral;

