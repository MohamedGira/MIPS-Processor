--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:14:55 05/14/2022
-- Design Name:   
-- Module Name:   C:/Users/GiraV/Desktop/projects/ControlUnit/Mux_2x1_32bit_Tb.vhd
-- Project Name:  ControlUnit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Mux_2x1_32bit
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
 
ENTITY Mux_2x1_32bit_Tb IS
END Mux_2x1_32bit_Tb;
 
ARCHITECTURE behavior OF Mux_2x1_32bit_Tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Mux_2x1_32bit
    PORT(
         input0 : IN  std_logic_vector(31 downto 0);
         input1 : IN  std_logic_vector(31 downto 0);
         selector : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input0 : std_logic_vector(31 downto 0) := (others => '0');
   signal input1 : std_logic_vector(31 downto 0) := (others => '0');
   signal selector : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Mux_2x1_32bit PORT MAP (
          input0 => input0,
          input1 => input1,
          selector => selector,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      input0<="00001111000011110000111100001111";
		input1<="00001111000011110000000000000000";
		wait for 100 ns;	
		selector<='0';
		wait for 100 ns;	
		selector<='1';
		wait for 100 ns;	
		selector<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
