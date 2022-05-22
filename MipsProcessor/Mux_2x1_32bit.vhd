
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_2x1_32bit is
    Port ( input0 : in  STD_LOGIC_VECTOR (31 downto 0);
           input1 : in  STD_LOGIC_VECTOR (31 downto 0);
			  selector: in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end Mux_2x1_32bit;

architecture Behavioral of Mux_2x1_32bit is

begin
output<=input0 when selector='0' else
			input1 when selector='1';

end Behavioral;

