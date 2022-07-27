library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.constants.all;
use work.seven_seg.all;

entity zedboard_top is
    port (
        GCLK : in std_logic;
        BTNR : in std_logic;

        JA : out std_logic_vector (3 downto 0);
        JB : out std_logic_vector (3 downto 0);
        JC : out std_logic_vector (3 downto 0);
        JD : out std_logic_vector (3 downto 0);

        LD0 : out std_logic;
        LD1 : out std_logic;
        LD2 : out std_logic;
        LD3 : out std_logic
    );
end zedboard_top;

architecture structure of zedboard_top is
    signal BTNR_inv : std_logic;

    signal SevenSeg : SevenSegData;
    signal ActiveThreads : std_logic_vector(THREAD_COUNT - 1 downto 0);
begin
    BTNR_inv <= not BTNR;

    dut : entity work.Processor
        port map(
            CLK => GCLK,
            RST => BTNR_inv,

            SevenSeg => SevenSeg,
            ActiveThreads => ActiveThreads
        );

    JA <= SevenSeg.A;
    JB <= SevenSeg.B;
    JC <= SevenSeg.C;
    JD <= SevenSeg.D;

    LD0 <= ActiveThreads(0);
    LD1 <= ActiveThreads(1) when THREAD_COUNT > 1 else
        '0';
    LD2 <= ActiveThreads(2) when THREAD_COUNT > 2 else
        '0';
    LD3 <= ActiveThreads(3) when THREAD_COUNT > 3 else
        '0';

end structure;
