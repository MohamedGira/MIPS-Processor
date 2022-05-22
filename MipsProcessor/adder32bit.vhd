library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;

entity adder32bit is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           C : out  STD_LOGIC_VECTOR (31 downto 0);
			  Cout : out  STD_LOGIC);
end adder32bit;

architecture Behavioral of adder32bit is

Signal temp : STD_LOGIC_VECTOR (32 downto 0);

begin

temp <= (A(31) & A ) + (B(31) & B );
c <= temp(31 downto 0);
Cout <= temp(32);


end Behavioral;