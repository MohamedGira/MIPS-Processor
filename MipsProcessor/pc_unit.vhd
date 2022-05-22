library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity pc_unit is
  
  Port( clk : in STD_LOGIC;
        I_PC  : in STD_LOGIC_VECTOR(31 downto 0);
        O_pc: out STD_LOGIC_VECTOR(31 downto 0)
  );
end pc_unit;

architecture Behavioral of pc_unit is 
  signal current_pc: STD_LOGIC_VECTOR(31 downto 0) := X"00000000";
  
begin
O_PC <= current_pc;
  process(clk)
  begin
  if (clk'event and clk='0') then
  current_pc <= I_PC;
  end if;
  end process;
  

end Behavioral;
