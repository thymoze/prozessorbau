library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity Inc10Bit is
    port (
        CLK : in std_logic;
        RST : in std_logic;
        O : out std_logic_vector (9 downto 0));
end Inc10Bit;

architecture Behavioral of Inc10Bit is
begin
    process (CLK, RST)
        variable counter : std_logic_vector (9 downto 0) := "0000000000";
    begin
        if RST = '0' then
            counter := "0000000000";
            O <= counter;
        elsif rising_edge(CLK) then
            counter := std_logic_vector(unsigned(counter) + 1);
            O <= counter;
        end if;
    end process;
end Behavioral;
