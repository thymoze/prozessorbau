library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package seven_seg is
    type SevenSegData is record
        A : std_logic_vector (3 downto 0);
        B : std_logic_vector (3 downto 0);
        C : std_logic_vector (3 downto 0);
        D : std_logic_vector (3 downto 0);
    end record;
end seven_seg;
