library ieee;
use ieee.std_logic_1164.all;

--library work;

entity processor_tb is
end processor_tb;

architecture testbench of processor_tb is
    signal CLK : std_logic;
    signal RST: std_logic;

begin
    dut: entity work.processor
        port map (
            CLK => CLK,
            RST => RST
        );

    process
    begin
        CLK <= '1';
        wait for 5.0 ns;
        CLK <= '0';
        wait for 5.0 ns;
    end process;

    process
    begin
        RST <= '0';
        wait for 10.0 ns;
        RST <= '1';
        wait;
    end process;
end testbench;
