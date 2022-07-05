library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.constants.THREAD_COUNT;

package types is

    subtype thread_tag_t is integer range 0 to THREAD_COUNT - 1;

end package;
