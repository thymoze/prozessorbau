library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FetchStage is
    port (
        CLK, RST : in std_logic;

        PCI : in std_logic_vector (31 downto 0);

        PCO : out std_logic_vector (31 downto 0)
    );
end FetchStage;

architecture Behavioral of FetchStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            PCO <= std_logic_vector(to_signed(-4, 32));
        elsif rising_edge(CLK) then
            PCO <= PCI;
        end if;
    end process;
end Behavioral;