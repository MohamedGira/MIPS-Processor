
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.all;


entity t_32_bit_alu is
port(
		data1 : in std_logic_vector(31 downto 0);
		data2 : in std_logic_vector(31 downto 0);
		aluop : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		dataout: out std_logic_vector(31 downto 0);
		cflag: out std_logic;
		zflag: out std_logic;
		oflag: out std_logic;
		is_slt:out std_logic;
		slt:out std_logic
);
end t_32_bit_alu;

architecture Behavioral of t_32_bit_alu is
component one_bit_alu is
port(
 data1 : in std_logic;
 data2 : in std_logic;
 aluop : in std_logic_vector(3 downto 0);
 cin : in std_logic;
 dataout: out std_logic;
 cflag: out std_logic;
 zflag: out std_logic;
 oflag: out std_logic
 );
end component;
signal extrnalcin:std_logic;

signal bit0cout :std_logic;signal bit1cout :std_logic;signal bit2cout :std_logic;
signal bit3cout :std_logic;signal bit4cout :std_logic;signal bit5cout :std_logic;
signal bit6cout :std_logic;signal bit7cout :std_logic;signal bit8cout :std_logic;
signal bit9cout :std_logic;signal bit10cout :std_logic;signal bit11cout :std_logic;
signal bit12cout :std_logic;signal bit13cout :std_logic;signal bit14cout :std_logic;
signal bit15cout :std_logic;signal bit16cout :std_logic;signal bit17cout :std_logic;
signal bit18cout :std_logic;signal bit19cout :std_logic;signal bit20cout :std_logic;
signal bit21cout :std_logic;signal bit22cout :std_logic;signal bit23cout :std_logic;
signal bit24cout :std_logic;signal bit25cout :std_logic;signal bit26cout :std_logic;
signal bit27cout :std_logic;signal bit28cout :std_logic;signal bit29cout :std_logic;
signal bit30cout :std_logic;signal bit31cout :std_logic;
signal zflagarr :std_logic_vector(31 downto 0);
signal temp: std_logic;
signal manipdata2:std_logic_vector(31 downto 0);
signal diff:std_logic_vector(32 downto 0);
begin

extrnalcin<='1' when aluop="0110" else '0';

manipdata2<=  data2; 

 bit0res: one_bit_alu port map(data1=>data1(0),data2=>manipdata2(0),aluop=>aluop,cin=>extrnalcin,cflag=>bit0cout,dataout=>dataout(0),zflag=>zflagarr(0));
 bit1res: one_bit_alu port map(data1=>data1(1),data2=>manipdata2(1),aluop=>aluop,cin=>bit0cout,cflag=>bit1cout,dataout=>dataout(1),zflag=>zflagarr(1));
 bit2res: one_bit_alu port map(data1=>data1(2),data2=>manipdata2(2),aluop=>aluop,cin=>bit1cout,cflag=>bit2cout,dataout=>dataout(2),zflag=>zflagarr(2));
 bit3res: one_bit_alu port map(data1=>data1(3),data2=>manipdata2(3),aluop=>aluop,cin=>bit2cout,cflag=>bit3cout,dataout=>dataout(3),zflag=>zflagarr(3));
 bit4res: one_bit_alu port map(data1=>data1(4),data2=>manipdata2(4),aluop=>aluop,cin=>bit3cout,cflag=>bit4cout,dataout=>dataout(4),zflag=>zflagarr(4));
 bit5res: one_bit_alu port map(data1=>data1(5),data2=>manipdata2(5),aluop=>aluop,cin=>bit4cout,cflag=>bit5cout,dataout=>dataout(5),zflag=>zflagarr(5));
 bit6res: one_bit_alu port map(data1=>data1(6),data2=>manipdata2(6),aluop=>aluop,cin=>bit5cout,cflag=>bit6cout,dataout=>dataout(6),zflag=>zflagarr(6));
 bit7res: one_bit_alu port map(data1=>data1(7),data2=>manipdata2(7),aluop=>aluop,cin=>bit6cout,cflag=>bit7cout,dataout=>dataout(7),zflag=>zflagarr(7));
 bit8res: one_bit_alu port map(data1=>data1(8),data2=>manipdata2(8),aluop=>aluop,cin=>bit7cout,cflag=>bit8cout,dataout=>dataout(8),zflag=>zflagarr(8));
 bit9res:  one_bit_alu port map(data1=>data1(9),data2=>manipdata2(9),aluop=>aluop,cin=>bit8cout,cflag=>bit9cout,dataout=>dataout(9),zflag=>zflagarr(9));
 bit10res: one_bit_alu port map(data1=>data1(10),data2=>manipdata2(10),aluop=>aluop,cin=>bit9cout,cflag=>bit10cout,dataout=>dataout(10),zflag=>zflagarr(10));
 bit11res: one_bit_alu port map(data1=>data1(11),data2=>manipdata2(11),aluop=>aluop,cin=>bit10cout,cflag=>bit11cout,dataout=>dataout(11),zflag=>zflagarr(11));
 bit12res: one_bit_alu port map(data1=>data1(12),data2=>manipdata2(12),aluop=>aluop,cin=>bit11cout,cflag=>bit12cout,dataout=>dataout(12),zflag=>zflagarr(12));
 bit13res: one_bit_alu port map(data1=>data1(13),data2=>manipdata2(13),aluop=>aluop,cin=>bit12cout,cflag=>bit13cout,dataout=>dataout(13),zflag=>zflagarr(13));
 bit14res: one_bit_alu port map(data1=>data1(14),data2=>manipdata2(14),aluop=>aluop,cin=>bit13cout,cflag=>bit14cout,dataout=>dataout(14),zflag=>zflagarr(14));
 bit15res: one_bit_alu port map(data1=>data1(15),data2=>manipdata2(15),aluop=>aluop,cin=>bit14cout,cflag=>bit15cout,dataout=>dataout(15),zflag=>zflagarr(15));
 bit16res: one_bit_alu port map(data1=>data1(16),data2=>manipdata2(16),aluop=>aluop,cin=>bit15cout,cflag=>bit16cout,dataout=>dataout(16),zflag=>zflagarr(16));
 bit17res: one_bit_alu port map(data1=>data1(17),data2=>manipdata2(17),aluop=>aluop,cin=>bit16cout,cflag=>bit17cout,dataout=>dataout(17),zflag=>zflagarr(17));
 bit18res: one_bit_alu port map(data1=>data1(18),data2=>manipdata2(18),aluop=>aluop,cin=>bit17cout,cflag=>bit18cout,dataout=>dataout(18),zflag=>zflagarr(18));
 bit19res: one_bit_alu port map(data1=>data1(19),data2=>manipdata2(19),aluop=>aluop,cin=>bit18cout,cflag=>bit19cout,dataout=>dataout(19),zflag=>zflagarr(19));
 bit20res: one_bit_alu port map(data1=>data1(20),data2=>manipdata2(20),aluop=>aluop,cin=>bit19cout,cflag=>bit20cout,dataout=>dataout(20),zflag=>zflagarr(20));
 bit21res: one_bit_alu port map(data1=>data1(21),data2=>manipdata2(21),aluop=>aluop,cin=>bit20cout,cflag=>bit21cout,dataout=>dataout(21),zflag=>zflagarr(21));
 bit22res: one_bit_alu port map(data1=>data1(22),data2=>manipdata2(22),aluop=>aluop,cin=>bit21cout,cflag=>bit22cout,dataout=>dataout(22),zflag=>zflagarr(22));
 bit23res: one_bit_alu port map(data1=>data1(23),data2=>manipdata2(23),aluop=>aluop,cin=>bit22cout,cflag=>bit23cout,dataout=>dataout(23),zflag=>zflagarr(23));
 bit24res: one_bit_alu port map(data1=>data1(24),data2=>manipdata2(24),aluop=>aluop,cin=>bit23cout,cflag=>bit24cout,dataout=>dataout(24),zflag=>zflagarr(24));
 bit25res: one_bit_alu port map(data1=>data1(25),data2=>manipdata2(25),aluop=>aluop,cin=>bit24cout,cflag=>bit25cout,dataout=>dataout(25),zflag=>zflagarr(25));
 bit26res: one_bit_alu port map(data1=>data1(26),data2=>manipdata2(26),aluop=>aluop,cin=>bit25cout,cflag=>bit26cout,dataout=>dataout(26),zflag=>zflagarr(26));
 bit27res: one_bit_alu port map(data1=>data1(27),data2=>manipdata2(27),aluop=>aluop,cin=>bit26cout,cflag=>bit27cout,dataout=>dataout(27),zflag=>zflagarr(27));
 bit28res: one_bit_alu port map(data1=>data1(28),data2=>manipdata2(28),aluop=>aluop,cin=>bit27cout,cflag=>bit28cout,dataout=>dataout(28),zflag=>zflagarr(28));
 bit29res: one_bit_alu port map(data1=>data1(29),data2=>manipdata2(29),aluop=>aluop,cin=>bit28cout,cflag=>bit29cout,dataout=>dataout(29),zflag=>zflagarr(29));
 bit30res: one_bit_alu port map(data1=>data1(30),data2=>manipdata2(30),aluop=>aluop,cin=>bit29cout,cflag=>bit30cout,dataout=>dataout(30),zflag=>zflagarr(30));
 bit31res: one_bit_alu port map(data1=>data1(31),data2=>manipdata2(31),aluop=>aluop,cin=>bit30cout,cflag=>bit31cout,dataout=>dataout(31),zflag=>zflagarr(31));
	
	temp<=not bit31cout;
	
	zflag<='1' when zflagarr="11111111111111111111111111111111" else '0';
	oflag<=bit30cout xor bit31cout;
	cflag<= not temp when aluop="0110" else
				bit31cout ;
	is_slt<='1' when aluop="0111" else '0';
	diff <= ("0"& data1 ) - ("0" & data2 );
	slt<=diff(31);
	

	
end Behavioral;

