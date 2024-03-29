library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity imem_test05branch is
    port (
        address : in std_logic_vector (9 downto 0);
        Clock   : in std_logic;

        q       : out std_logic_vector (31 downto 0)
    );
end imem_test05branch;

architecture SYN of imem_test05branch is
    type TMem is array (0 to 1023) of std_logic_vector (31 downto 0);
    signal Mem : TMem := (
      x"55506093",
      x"66606113",
      x"fff06193",
      x"00006213",
      x"0020c863",
      x"00120213",
      x"00220213",
      x"fff06813",
      x"0020e863",
      x"00120213",
      x"00220213",
      x"fff06893",
      x"0011c863",
      x"00120213",
      x"00220213",
      x"fff06913",
      x"00115863",
      x"00120213",
      x"00220213",
      x"fff06993",
      x"0011f863",
      x"00120213",
      x"00220213",
      x"fff06993",
      x"0030d863",
      x"00120213",
      x"00220213",
      x"fff06a13",
      x"0010d863",
      x"00120213",
      x"00220213",
      x"fff06a93",
      x"00111863",
      x"00120213",
      x"00220213",
      x"fff06a93",
      x"fff06b13",
      x"fff06b93",
      x"fff06c13",
      x"fff06c93",
      x"0030f863",
      x"00028293",
      x"00028293",
      x"000b7b13",
      x"0011d863",
      x"00028293",
      x"00028293",
      x"000bfb93",
      x"0010c863",
      x"00028293",
      x"00028293",
      x"000c7c13",
      x"00110863",
      x"00028293",
      x"00028293",
      x"000cfc93",
      x"f22098e3",
      x"00120213",
      x"00220213",
      x"fff06d13",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000"
    );
begin
    process (Clock)
    begin
        if rising_edge(Clock) then
            q <= Mem(to_integer(unsigned(address)));
        end if;
    end process;
end;
