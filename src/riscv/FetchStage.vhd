library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.types.all;
use work.constants.THREAD_COUNT;

entity FetchStage is
    port (
        CLK, RST : in std_logic;

        PCI : in thread_pc_array_t;
        ThreadTagI : in thread_tag_t;

        PCO : out thread_pc_array_t;
        ThreadTagO : out thread_tag_t
    );
end FetchStage;

architecture Behavioral of FetchStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            PCO <= (others => std_logic_vector(to_signed(-4, 32)));
            ThreadTagO <= 0;
        elsif rising_edge(CLK) then
            PCO <= PCI;
            ThreadTagO <= ThreadTagI;
        end if;
    end process;
end Behavioral;
