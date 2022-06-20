library IEEE;
use IEEE.std_logic_1164.all;

entity MemMux is
  Port (
    ALUDataIn : in std_logic_vector (31 downto 0);
    MemDataIn : in std_logic_vector (31 downto 0);
    Sel : in std_logic;
    FunctI : in std_logic_vector (2 downto 0);
    
    WrData : out std_logic_vector (31 downto 0)
  );
end MemMux;

architecture Behavioral of MemMux is
begin
    process (Sel, ALUDataIn, MemDataIn)
    begin
        if Sel = '0' then
            WrData <= ALUDataIn;
        else
            WrData <= MemDataIn;
        end if;
    end process;
end Behavioral;