
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity DeMux is
	port(
			input: in std_logic;
			output: out std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			selection_line: in std_logic_vector(4 downto 0)
			);
end DeMux;

architecture Behavioral of DeMux is
	
begin

process(selection_line,input)
  begin
    output <= (others => '0');
    if input= '1' then
      output(to_integer(unsigned(selection_line)))<=input;
    end if;
  end process;
end Behavioral;

