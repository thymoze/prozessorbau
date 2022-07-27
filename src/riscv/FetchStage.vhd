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

        PCI : in thread_pc_array_t;
        ThreadTagI : in thread_tag_t;

        PCO : out thread_pc_array_t;
        ThreadTagO : out thread_tag_t
    );
end FetchStage;

architecture Behavioral of FetchStage is
    function init_with_offset return thread_pc_array_t is
        variable result : thread_pc_array_t;
    begin
        for i in 0 to THREAD_COUNT - 1 loop
            result(i) := std_logic_vector(to_unsigned(i * 100, 32));
        end loop;
        return result;
    end function;
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            PCO <= (others => std_logic_vector(to_signed(-4, 32))) when ThreadStart /= start_offset else
                init_with_offset;
            ThreadTagO <= 0;
        elsif rising_edge(CLK) then
            PCO <= PCI;
            ThreadTagO <= ThreadTagI;
        end if;
    end process;
end Behavioral;
