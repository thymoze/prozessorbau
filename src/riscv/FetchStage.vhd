library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.types.all;
use work.constants.THREAD_COUNT;

entity FetchStage is
    generic (
        ThreadStart : thread_start_t
    );
    port (
        CLK, RST : in std_logic;

        PCI : in std_logic_vector (31 downto 0);
        ThreadTagI : in integer;

        PCO : out std_logic_vector (31 downto 0);
        ThreadTagO : out integer := 0
    );
end FetchStage;

architecture Behavioral of FetchStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            PCO <= std_logic_vector(to_signed(-4, 32));
            ThreadTagO <= 3 when ThreadStart = start_0 else
                0;
        elsif rising_edge(CLK) then
            PCO <= PCI;
            ThreadTagO <= ThreadTagI;
        end if;
    end process;
end Behavioral;
