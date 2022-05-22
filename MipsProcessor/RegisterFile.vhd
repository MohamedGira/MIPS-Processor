----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:57:38 04/21/2022 
-- Design Name: 
-- Module Name:    RegisterFile - Behavioral 
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

entity RegisterFile is
	port(
		 read_sel1 : in std_logic_vector(4 downto 0);
		 read_sel2 : in std_logic_vector(4 downto 0);
		 write_sel : in std_logic_vector(4 downto 0);
		 write_ena : in std_logic;
		 clk: in std_logic;
		 write_data: in std_logic_vector(31 downto 0);
		 data1: out std_logic_vector(31 downto 0);
		 data2: out std_logic_vector(31 downto 0)
	);
end RegisterFile;




architecture Behavioral of RegisterFile is
		signal writeind :std_logic_vector(31 downto 0);
		signal reg0data :std_logic_vector(31 downto 0);
		signal reg1data :std_logic_vector(31 downto 0);
		signal reg2data :std_logic_vector(31 downto 0);
		signal reg3data :std_logic_vector(31 downto 0);
		signal reg4data :std_logic_vector(31 downto 0);
		signal reg5data :std_logic_vector(31 downto 0);
		signal reg6data :std_logic_vector(31 downto 0);
		signal reg7data :std_logic_vector(31 downto 0);
		signal reg8data :std_logic_vector(31 downto 0);
		signal reg9data :std_logic_vector(31 downto 0);
		signal reg10data :std_logic_vector(31 downto 0);
		signal reg11data :std_logic_vector(31 downto 0);
		signal reg12data :std_logic_vector(31 downto 0);
		signal reg13data :std_logic_vector(31 downto 0);
		signal reg14data :std_logic_vector(31 downto 0);
		signal reg15data :std_logic_vector(31 downto 0);
		signal reg16data :std_logic_vector(31 downto 0);
		signal reg17data :std_logic_vector(31 downto 0);
		signal reg18data :std_logic_vector(31 downto 0);
		signal reg19data :std_logic_vector(31 downto 0);
		signal reg20data :std_logic_vector(31 downto 0);
		signal reg21data :std_logic_vector(31 downto 0);
		signal reg22data :std_logic_vector(31 downto 0);
		signal reg23data :std_logic_vector(31 downto 0);
		signal reg24data :std_logic_vector(31 downto 0);
		signal reg25data :std_logic_vector(31 downto 0);
		signal reg26data :std_logic_vector(31 downto 0);
		signal reg27data :std_logic_vector(31 downto 0);
		signal reg28data :std_logic_vector(31 downto 0);
		signal reg29data :std_logic_vector(31 downto 0);
		signal reg30data :std_logic_vector(31 downto 0);
		signal reg31data :std_logic_vector(31 downto 0);
	-- components
	
				Component DeMux is
					port(
							input: in std_logic;
							output: out std_logic_vector(31 downto 0):="00000000000000000000000000000000";
							selection_line: in std_logic_vector(4 downto 0)
							);
				end Component;



				Component MyRegister is
				port(
						write_data:in std_logic_vector(31 downto 0);
						read_data:out std_logic_vector(31 downto 0);
						write_enable: in std_logic;
						clr : IN STD_LOGIC; 
						clk : IN STD_LOGIC
						);
						
				end Component ;


				Component generic_mux is

					 Port (
						input0 : in std_logic_vector(31 downto 0);
						input1 : in std_logic_vector(31 downto 0);
						input2 : in std_logic_vector(31 downto 0);
						input3 :  in std_logic_vector(31 downto 0);
						input4 :  in std_logic_vector(31 downto 0);
						input5 :  in std_logic_vector(31 downto 0);
						input6 :  in std_logic_vector(31 downto 0);
						input7 :  in std_logic_vector(31 downto 0);
						input8 :  in std_logic_vector(31 downto 0);
						input9 :  in std_logic_vector(31 downto 0);
						input10 : in std_logic_vector(31 downto 0);
						input11 : in std_logic_vector(31 downto 0);
						input12 : in std_logic_vector(31 downto 0);
						input13 : in std_logic_vector(31 downto 0);
						input14 : in std_logic_vector(31 downto 0);
						input15 : in std_logic_vector(31 downto 0);
						input16 : in std_logic_vector(31 downto 0);
						input17 : in std_logic_vector(31 downto 0);
						input18 : in std_logic_vector(31 downto 0);
						input19 : in std_logic_vector(31 downto 0);
						input20 : in std_logic_vector(31 downto 0);
						input21 : in std_logic_vector(31 downto 0);
						input22 : in std_logic_vector(31 downto 0);
						input23 : in std_logic_vector(31 downto 0);
						input24 : in std_logic_vector(31 downto 0);
						input25 : in std_logic_vector(31 downto 0);
						input26 : in std_logic_vector(31 downto 0);
						input27 : in std_logic_vector(31 downto 0);
						input28 : in std_logic_vector(31 downto 0);
						input29 : in std_logic_vector(31 downto 0);
						input30 : in std_logic_vector(31 downto 0);
						input31 : in std_logic_vector(31 downto 0);

						sel    : in  std_logic_vector(4 downto 0);
						o 		 : out std_logic_vector(31  downto 0));
						
				end Component;

			
	
	
	
	
	
	
	
begin
	
	write_demux: DeMux port map(selection_line=>write_sel,input=>write_ena,output=>writeind);
	
	register0 :myRegister port map(write_data=>write_data,read_data=>reg0data,write_enable=>writeind(0),clr=>'0',clk=>clk);
	register1 :myRegister port map(write_data=>write_data,read_data=>reg1data,write_enable=>writeind(1),clr=>'0',clk=>clk);
	register2 :myRegister port map(write_data=>write_data,read_data=>reg2data,write_enable=>writeind(2),clr=>'0',clk=>clk);
	register3 :myRegister port map(write_data=>write_data,read_data=>reg3data,write_enable=>writeind(3),clr=>'0',clk=>clk);
	register4 :myRegister port map(write_data=>write_data,read_data=>reg4data,write_enable=>writeind(4),clr=>'0',clk=>clk);
	register5 :myRegister port map(write_data=>write_data,read_data=>reg5data,write_enable=>writeind(5),clr=>'0',clk=>clk);
	register6 :myRegister port map(write_data=>write_data,read_data=>reg6data,write_enable=>writeind(6),clr=>'0',clk=>clk);
	register7 :myRegister port map(write_data=>write_data,read_data=>reg7data,write_enable=>writeind(7),clr=>'0',clk=>clk);
	register8 :myRegister port map(write_data=>write_data,read_data=>reg8data,write_enable=>writeind(8),clr=>'0',clk=>clk);
	register9 :myRegister port map(write_data=>write_data,read_data=>reg9data,write_enable=>writeind(9),clr=>'0',clk=>clk);
	register10 :myRegister port map(write_data=>write_data,read_data=>reg10data,write_enable=>writeind(10),clr=>'0',clk=>clk);
	register11 :myRegister port map(write_data=>write_data,read_data=>reg11data,write_enable=>writeind(11),clr=>'0',clk=>clk);
	register12 :myRegister port map(write_data=>write_data,read_data=>reg12data,write_enable=>writeind(12),clr=>'0',clk=>clk);
	register13 :myRegister port map(write_data=>write_data,read_data=>reg13data,write_enable=>writeind(13),clr=>'0',clk=>clk);
	register14 :myRegister port map(write_data=>write_data,read_data=>reg14data,write_enable=>writeind(14),clr=>'0',clk=>clk);
	register15 :myRegister port map(write_data=>write_data,read_data=>reg15data,write_enable=>writeind(15),clr=>'0',clk=>clk);
	register16 :myRegister port map(write_data=>write_data,read_data=>reg16data,write_enable=>writeind(16),clr=>'0',clk=>clk);
	register17 :myRegister port map(write_data=>write_data,read_data=>reg17data,write_enable=>writeind(17),clr=>'0',clk=>clk);
	register18 :myRegister port map(write_data=>write_data,read_data=>reg18data,write_enable=>writeind(18),clr=>'0',clk=>clk);
	register19 :myRegister port map(write_data=>write_data,read_data=>reg19data,write_enable=>writeind(19),clr=>'0',clk=>clk);
	register20 :myRegister port map(write_data=>write_data,read_data=>reg20data,write_enable=>writeind(20),clr=>'0',clk=>clk);
	register21 :myRegister port map(write_data=>write_data,read_data=>reg21data,write_enable=>writeind(21),clr=>'0',clk=>clk);
	register22 :myRegister port map(write_data=>write_data,read_data=>reg22data,write_enable=>writeind(22),clr=>'0',clk=>clk);
	register23 :myRegister port map(write_data=>write_data,read_data=>reg23data,write_enable=>writeind(23),clr=>'0',clk=>clk);
	register24 :myRegister port map(write_data=>write_data,read_data=>reg24data,write_enable=>writeind(24),clr=>'0',clk=>clk);
	register25 :myRegister port map(write_data=>write_data,read_data=>reg25data,write_enable=>writeind(25),clr=>'0',clk=>clk);
	register26 :myRegister port map(write_data=>write_data,read_data=>reg26data,write_enable=>writeind(26),clr=>'0',clk=>clk);
	register27 :myRegister port map(write_data=>write_data,read_data=>reg27data,write_enable=>writeind(27),clr=>'0',clk=>clk);
	register28 :myRegister port map(write_data=>write_data,read_data=>reg28data,write_enable=>writeind(28),clr=>'0',clk=>clk);
	register29 :myRegister port map(write_data=>write_data,read_data=>reg29data,write_enable=>writeind(29),clr=>'0',clk=>clk);
	register30 :myRegister port map(write_data=>write_data,read_data=>reg30data,write_enable=>writeind(30),clr=>'0',clk=>clk);
	register31 :myRegister port map(write_data=>write_data,read_data=>reg31data,write_enable=>writeind(31),clr=>'0',clk=>clk);
	
	read1_mux: generic_mux port map(sel=>read_sel1,o=>data1, input0=>"00000000000000000000000000000000", input1=>reg1data, input2=>reg2data, input3=>reg3data, input4=>reg4data,
																	 input5=>reg5data, input6=>reg6data, input7=>reg7data, input8=>reg8data,
																	 input9=>reg9data, input10=>reg10data, input11=>reg11data, input12=>reg12data,
																	 input13=>reg13data, input14=>reg14data, input15=>reg15data, input16=>reg16data,
																	 input17=>reg17data, input18=>reg18data, input19=>reg19data, input20=>reg20data,
																	 input21=>reg21data, input22=>reg22data, input23=>reg23data, input24=>reg24data,
																	 input25=>reg25data, input26=>reg26data, input27=>reg27data, input28=>reg28data,
																	 input29=>reg29data, input30=>reg30data, input31=>reg31data);

	read2_mux: generic_mux port map(sel=>read_sel2,o=>data2, input0=>"00000000000000000000000000000000", input1=>reg1data, input2=>reg2data, input3=>reg3data, input4=>reg4data,
																	 input5=>reg5data, input6=>reg6data, input7=>reg7data, input8=>reg8data,
																	 input9=>reg9data, input10=>reg10data, input11=>reg11data, input12=>reg12data,
																	 input13=>reg13data, input14=>reg14data, input15=>reg15data, input16=>reg16data,
																	 input17=>reg17data, input18=>reg18data, input19=>reg19data, input20=>reg20data,
																	 input21=>reg21data, input22=>reg22data, input23=>reg23data, input24=>reg24data,
																	 input25=>reg25data, input26=>reg26data, input27=>reg27data, input28=>reg28data,
																	 input29=>reg29data, input30=>reg30data, input31=>reg31data);

end Behavioral;

