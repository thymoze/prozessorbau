library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zedboard_top is
    port (
		BTNR: in std_logic;
		GCLK: in std_logic
	);
end zedboard_top;

architecture structure of zedboard_top is
begin
    processor : entity work.processor
        port map(
            CLK => GCLK,
            RST => BTNR
        );
    
end structure;
