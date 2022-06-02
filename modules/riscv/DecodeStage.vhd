library IEEE;
use IEEE.std_logic_1164.all;

entity DecodeStage is
    port (
        CLK, RST : in std_logic;

        InstI : in std_logic_vector (31 downto 0);
        PCI : in std_logic_vector (31 downto 0);
        --InterlockI : in std_logic;
        --ClearI : in std_logic;
        --Stall : in std_logic;

        InstO : out std_logic_vector (31 downto 0);
        PCO : out std_logic_vector (31 downto 0)
        --InterlockO : out std_logic;
        --ClearO : out std_logic
    );
end DecodeStage;

architecture Behavioral of DecodeStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            InstO <= x"00000000";
        elsif rising_edge(CLK) then
            InstO <= InstI;
            PCO <= PCI;
            --InterlockO <= InterlockI;
            --ClearO <= ClearI;
        end if;
    end process;
end Behavioral;
