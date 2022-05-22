--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:29:59 05/14/2022
-- Design Name:   
-- Module Name:   C:/Users/GiraV/Desktop/projects/ControlUnit/PCTb.vhd
-- Project Name:  ControlUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc_unit
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
 
ENTITY PCTb IS
END PCTb;
 
ARCHITECTURE behavior OF PCTb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc_unit
    PORT(
         clk : IN  std_logic;
         I_PC : IN  std_logic_vector(31 downto 0);
         O_pc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal I_PC : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O_pc : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc_unit PORT MAP (
          clk => clk,
          I_PC => I_PC,
          O_pc => O_pc
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
      wait for clk_period*10;

      -- insert stimulus here 
		I_PC<="10001000100010001000100010001000";
		wait for clk_period;
		I_PC<="00000000100010001000100010001000";
		wait for clk_period;
		I_PC<="11111000100010001000100010001000";
      wait;
   end process;

END;
