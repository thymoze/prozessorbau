----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/16/2022 02:15:48 PM
-- Design Name:
-- Module Name: Inc10Bit - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Inc10Bit is
    Port ( CLK : in STD_LOGIC;
           RST : in STD_LOGIC;
           O : out STD_LOGIC_VECTOR (9 downto 0));
end Inc10Bit;

architecture Behavioral of Inc10Bit is

begin

process(CLK, RST)

variable counter : std_logic_vector (9 downto 0):="0000000000";

begin

if RST='0' then
    counter:="0000000000";
    O<=counter;
elsif rising_edge(CLK) then
    counter:=std_logic_vector(unsigned(counter)+1);
    O<=counter;
end if;

end process;

end Behavioral;
