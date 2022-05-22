
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MyRegister is
port( write_data:in std_logic_vector(31 downto 0);
		read_data:out std_logic_vector(31 downto 0);
		write_enable: in std_logic;
		clr : IN STD_LOGIC; 
		clk : IN STD_LOGIC
		);
		
end MyRegister ;

architecture Behavioral of MyRegister  is
begin
	read_data<= write_data when write_enable='1' and clk'event and clk='0' else
					"00000000000000000000000000000000" when clr='1';
end Behavioral;

