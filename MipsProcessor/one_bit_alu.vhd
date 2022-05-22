----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:27:58 04/21/2022 
-- Design Name: 
-- Module Name:    one_bit_alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity one_bit_alu is
port(
 data1 : in std_logic;
 data2 : in std_logic;
 aluop : in std_logic_vector(3 downto 0);
 cin : in std_logic;
 dataout: out std_logic;
 cflag: out std_logic;
 zflag: out std_logic;
 oflag: out std_logic);
 
end one_bit_alu;

architecture Behavioral of one_bit_alu is

component one_bit_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
			  sum : out  STD_LOGIC;
           carryin : in  STD_LOGIC;
           carryout : out  STD_LOGIC
           );
end component;


	signal sum: STD_LOGIC;
	--signal sub: STD_LOGIC;
	signal manipdata2:STD_LOGIC;
	signal k:STD_LOGIC;
	signal kxorb:STD_LOGIC;
	
begin

	k<='1' when aluop="0110" else '0';
	
	kxorb<= k xor data2;
	
	adder : one_bit_adder port map(a=>data1,b=>kxorb,sum=>sum,carryin=>cin,carryout=>cflag);
   

	--sub<=sum xor '1';
	--manipdata2<=not data2 when aluop="0011"else data2;
	dataout<= data1 and data2 when aluop="0000" else
				 data1 or data2 when aluop="0001" else
				 sum when aluop="0010" else
				 sum when aluop="0110" else
				 data1 nor data2 when aluop="1100" ;
				 --else				 sum when aluop="1110";
				 
	
				 
	zflag<= 	 data1 nand data2 when aluop="0000" else
				 data1 nor  data2  when aluop="0001" else
				 not sum when aluop="0010" else
				 not sum when aluop="0110" else
				 data1 or data2 when aluop="1100" ;
				 
				 
	oflag<= 	(data1 and data2)or(data1 and cin)or(cin and data2);
				 
end Behavioral;

