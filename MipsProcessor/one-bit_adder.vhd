
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity one_bit_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  sum : out  STD_LOGIC;
           carryin : in  STD_LOGIC;
           carryout : out  STD_LOGIC
           );
end one_bit_adder;

architecture Behavioral of one_bit_adder is
	
begin
	sum<= a xor b xor carryin;
	carryout<= (a and b) or (b and carryin )or (carryin and a);
end Behavioral;

