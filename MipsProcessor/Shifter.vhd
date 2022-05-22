library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : out  STD_LOGIC_VECTOR (31 downto 0));
end Shifter;

architecture Behavioral of Shifter is

begin

B <= A(29 downto 0) & "00";

end Behavioral;