library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zedboard_top is
    port (
        BTNR : in std_logic;
        BTNL : in std_logic
    );
end zedboard_top;

architecture structure of zedboard_top is
    signal BTNR_inv : std_logic;
begin
    BTNR_inv <= not BTNR;

    processor : entity work.processor
        port map(
            CLK => BTNL,
            RST => BTNR_inv
        );

end structure;
