library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.seven_seg.all;

entity SevenSeg is
    port (
        CLK, RST : in std_logic;

        V : in std_logic_vector (31 downto 0);
        Set : in std_logic;

        Pmod : out SevenSegData
    );
end entity;

architecture rtl of SevenSeg is
    signal state : std_logic_vector (31 downto 0);
    signal seg1, seg2 : std_logic_vector (7 downto 0);
    signal currentDigit : std_logic;

    signal counter : integer := 0;
begin

    process (CLK, RST)
    begin
        if RST = '1' then
            state <= (others => '0');
            seg1 <= (others => '0');
            seg2 <= (others => '0');
            currentDigit <= '0';

            counter <= 0;
        elsif rising_edge(CLK) then
            if Set = '1' then
                state <= V;
            end if;

            seg1(7) <= currentDigit;
            seg2(7) <= currentDigit;

            if currentDigit = '0' then
                seg1(6 downto 0) <= state(6 downto 0);
                seg2(6 downto 0) <= state(22 downto 16);
            else
                seg1(6 downto 0) <= state(14 downto 8);
                seg2(6 downto 0) <= state(30 downto 24);
            end if;

            counter <= counter + 1;

            if counter = 1_000_000 then
                counter <= 0;
                currentDigit <= not currentDigit;
            end if;

            Pmod <= (
                A => seg1(3 downto 0),
                B => seg1(7 downto 4),
                C => seg2(3 downto 0),
                D => seg2(7 downto 4));
        end if;
    end process;

end architecture;
