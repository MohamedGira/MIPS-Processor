library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.numeric_std.all;

entity generic_mux is

	generic(
   BITS   : POSITIVE  := 32);
	

    Port (
		input0 : in std_logic_vector(BITS-1 downto 0);
		input1 : in std_logic_vector(BITS-1 downto 0);
		input2 : in std_logic_vector(BITS-1 downto 0);
		input3 :  in std_logic_vector(BITS-1 downto 0);
		input4 :  in std_logic_vector(BITS-1 downto 0);
		input5 :  in std_logic_vector(BITS-1 downto 0);
		input6 :  in std_logic_vector(BITS-1 downto 0);
		input7 :  in std_logic_vector(BITS-1 downto 0);
		input8 :  in std_logic_vector(BITS-1 downto 0);
		input9 :  in std_logic_vector(BITS-1 downto 0);
		input10 : in std_logic_vector(BITS-1 downto 0);
		input11 : in std_logic_vector(BITS-1 downto 0);
		input12 : in std_logic_vector(BITS-1 downto 0);
		input13 : in std_logic_vector(BITS-1 downto 0);
		input14 : in std_logic_vector(BITS-1 downto 0);
		input15 : in std_logic_vector(BITS-1 downto 0);
		input16 : in std_logic_vector(BITS-1 downto 0);
		input17 : in std_logic_vector(BITS-1 downto 0);
		input18 : in std_logic_vector(BITS-1 downto 0);
		input19 : in std_logic_vector(BITS-1 downto 0);
		input20 : in std_logic_vector(BITS-1 downto 0);
		input21 : in std_logic_vector(BITS-1 downto 0);
		input22 : in std_logic_vector(BITS-1 downto 0);
		input23 : in std_logic_vector(BITS-1 downto 0);
		input24 : in std_logic_vector(BITS-1 downto 0);
		input25 : in std_logic_vector(BITS-1 downto 0);
		input26 : in std_logic_vector(BITS-1 downto 0);
		input27 : in std_logic_vector(BITS-1 downto 0);
		input28 : in std_logic_vector(BITS-1 downto 0);
		input29 : in std_logic_vector(BITS-1 downto 0);
		input30 : in std_logic_vector(BITS-1 downto 0);
		input31 : in std_logic_vector(BITS-1 downto 0);

		sel    : in  std_logic_vector(4 downto 0);
		o 		 : out std_logic_vector(BITS-1  downto 0));
		
end generic_mux;

architecture Behavioral of generic_mux is
begin
o <=     input0 when to_integer(unsigned(sel)) = 0 else 
         input1 when to_integer(unsigned(sel)) = 1 else 
         input2 when to_integer(unsigned(sel)) = 2 else 
         input3 when to_integer(unsigned(sel)) = 3 else 
         input4 when to_integer(unsigned(sel)) = 4 else 
         input5 when to_integer(unsigned(sel)) = 5 else 
         input6 when to_integer(unsigned(sel)) = 6 else 
         input7 when to_integer(unsigned(sel)) = 7 else 
         input8 when to_integer(unsigned(sel)) = 8 else 
         input9 when to_integer(unsigned(sel)) = 9 else 
         input10 when to_integer(unsigned(sel)) = 10 else 
         input11 when to_integer(unsigned(sel)) = 11 else 
         input12 when to_integer(unsigned(sel)) = 12 else 
         input13 when to_integer(unsigned(sel)) = 13 else 
         input14 when to_integer(unsigned(sel)) = 14 else 
         input15 when to_integer(unsigned(sel)) = 15 else 
         input16 when to_integer(unsigned(sel)) = 16 else 
         input17 when to_integer(unsigned(sel)) = 17 else 
         input18 when to_integer(unsigned(sel)) = 18 else 
         input19 when to_integer(unsigned(sel)) = 19 else 
         input20 when to_integer(unsigned(sel)) = 20 else 
         input21 when to_integer(unsigned(sel)) = 21 else 
         input22 when to_integer(unsigned(sel)) = 22 else 
         input23 when to_integer(unsigned(sel)) = 23 else 
         input24 when to_integer(unsigned(sel)) = 24 else 
         input25 when to_integer(unsigned(sel)) = 25 else 
         input26 when to_integer(unsigned(sel)) = 26 else 
         input27 when to_integer(unsigned(sel)) = 27 else 
         input28 when to_integer(unsigned(sel)) = 28 else 
         input29 when to_integer(unsigned(sel)) = 29 else
         input30 when to_integer(unsigned(sel)) = 30 else
         input31 when to_integer(unsigned(sel)) = 31 ;
end Behavioral;