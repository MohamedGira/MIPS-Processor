--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:14:35 05/14/2022
-- Design Name:   
-- Module Name:   C:/Users/GiraV/Desktop/projects/ControlUnit/DataMemoryTb.vhd
-- Project Name:  ControlUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Data_memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY DataMemoryTb IS
END DataMemoryTb;
 
ARCHITECTURE behavior OF DataMemoryTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_memory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         writeData : IN  std_logic_vector(31 downto 0);
         memRead : IN  std_logic;
         memWrite : IN  std_logic;
         readData : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal writeData : std_logic_vector(31 downto 0) := (others => '0');
   signal memRead : std_logic := '0';
   signal memWrite : std_logic := '0';

 	--Outputs
   signal readData : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_memory PORT MAP (
          address => address,
          writeData => writeData,
          memRead => memRead,
          memWrite => memWrite,
          readData => readData
        );

   -- Clock process definitions
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      --write to memory
		--first write
      address <= "00000000000000000000000000000100";
		writeData <= x"0000FFFF";
		memWrite <= '0';
		wait for 10 ns;
		memWrite <= '1';
		wait for 10 ns;
		memWrite <= '0';
		wait for 10 ns;
		memRead<='1';
		wait for 10 ns;
		memRead<='0';
		wait for 10 ns;

		-- second write
		address <= "00000000000000000000000000001000";
		writeData <= x"1370CFAB";
		memWrite <= '0';
		wait for 10 ns;
		memWrite <= '1';
		wait for 10 ns;
		memWrite <= '0';
		wait for 10 ns;
		memRead<='1';
		wait for 10 ns;
		memRead<='0';
		wait for 10 ns;
		--third wirte
		address <= "00000000000000000000000000001100";
		writeData <= x"13711111";
		memWrite <= '0';
		wait for 10 ns;
		memWrite <= '1';
		wait for 10 ns;
		memWrite <= '0';
		wait for 10 ns;
 	   writeData <= x"FFFFFFFF";

		memRead<='1';
		wait for 10 ns;
		memRead<='0';
		wait for 10 ns;
		--read from memory
		--first read
		address <= "00000000000000000000000000001000";
		memRead <= '0';
		wait for 10 ns;
		memRead <= '1';
		wait for 10 ns;
		memRead <= '0';
		wait for 10 ns;
		memRead<='1';
		wait for 10 ns;
		memRead<='0';
		wait for 10 ns;
		--second read
		address <= "00000000000000000000000000001100";
		memRead <= '0';
		wait for 10 ns;
		memRead <= '1';
		wait for 10 ns;
		memRead <= '0';
		wait for 10 ns;
		memRead<='1';
		wait for 10 ns;
		memRead<='0';
		wait for 10 ns;
      wait;
		assert false
		report "End"
		severity failure;
   end process;

END;
