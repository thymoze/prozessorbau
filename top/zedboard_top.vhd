library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.seven_seg.all;

entity zedboard_top is
    port (
        GCLK : in std_logic;
        BTNR : in std_logic;

        JA : out std_logic_vector (3 downto 0);
        JB : out std_logic_vector (3 downto 0);
        JC : out std_logic_vector (3 downto 0);
        JD : out std_logic_vector (3 downto 0)
    );
end zedboard_top;

architecture structure of zedboard_top is
    signal BTNR_inv : std_logic;

    signal SevenSeg : SevenSegData;
begin
    BTNR_inv <= not BTNR;

    processor : entity work.processor
        port map(
            CLK => GCLK,
            RST => BTNR_inv,

            SevenSeg => SevenSeg
        );

    JA <= SevenSeg.A;
    JB <= SevenSeg.B;
    JC <= SevenSeg.C;
    JD <= SevenSeg.D;

end structure;
