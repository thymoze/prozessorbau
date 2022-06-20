library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity imem_test03jal is 
    port (
        address : in std_logic_vector (9 downto 0);
        Clock   : in std_logic;

        q       : out std_logic_vector (31 downto 0)
    );
end imem_test03jal;

architecture SYN of imem_test03jal is
    type TMem is array (0 to 1024) of std_logic_vector (31 downto 0);
    signal Mem : TMem := (
      x"55506093",
      x"00214133",
      x"0031c1b3",
      x"01c002ef",
      x"00110113",
      x"00210113",
      x"00410113",
      x"00810113",
      x"fff1e193",
      x"fff86813",
      x"04000213",
      x"01c0036f",
      x"01010113",
      x"02010113",
      x"04010113",
      x"08010113",
      x"fff1e193",
      x"fff8e893",
      x"03808213",
      x"01c003ef",
      x"01010113",
      x"02010113",
      x"04010113",
      x"08010113",
      x"fff1e193",
      x"fff8e893",
      x"fa5ff46f",
      x"10010113",
      x"20010113",
      x"40010113",
      x"80010113",
      x"fff1e193",
      x"fff96913",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
      x"00000000",
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
