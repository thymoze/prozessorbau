library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package util is

    function to_integer(x : std_logic) return integer;

end package;

package body util is

    function to_integer(x : std_logic) return integer is
    begin
        if x = '1' then
            return 1;
        else
            return 0;
        end if;
    end function;

end package body;
