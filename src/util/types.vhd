library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.constants.THREAD_COUNT;

package types is

    subtype thread_tag_t is integer range 0 to THREAD_COUNT - 1;

    subtype register_t is std_logic_vector (4 downto 0);
    subtype opcode_t is std_logic_vector (6 downto 0);

    type thread_logic is record
        ThreadTag : thread_tag_t;
        Value : std_logic;
    end record;

end package;
