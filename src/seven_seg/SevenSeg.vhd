library IEEE;
use IEEE.std_logic_1164.all;

package seven_seg is
    type SevenSegData is record
        A : std_logic_vector (3 downto 0);
        B : std_logic_vector (3 downto 0);
        C : std_logic_vector (3 downto 0);
        D : std_logic_vector (3 downto 0);
    end record;
end seven_seg;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.seven_seg.SevenSegData;
use work.util.all;

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
        if RST = '0' then
            state <= (others => '0');
            seg1 <= (others => '0');
            seg2 <= (others => '0');
            currentDigit <= '0';

            counter <= 0;
            Pmod <= (others => "0000");
        elsif rising_edge(CLK) then
            if Set = '1' then
                state <= V;
            end if;

            seg1 <= currentDigit & state((to_integer(currentDigit) * 8) + 6 downto to_integer(currentDigit) * 8);
            seg2 <= currentDigit & state((to_integer(currentDigit) * 8) + 22 downto (to_integer(currentDigit) * 8) + 16);

            counter <= counter + 1;

            if counter = 1_000_000 then
                counter <= 0;
                currentDigit <= not currentDigit;
            end if;

            Pmod.A <= seg1(3 downto 0);
            Pmod.B <= seg1(7 downto 4);
            Pmod.C <= seg2(3 downto 0);
            Pmod.D <= seg2(7 downto 4);
        end if;
    end process;

end architecture;
