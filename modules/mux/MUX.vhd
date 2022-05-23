----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/19/2022 04:38:02 PM
-- Design Name:
-- Module Name: MUX - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX is
  Port (
    L: in std_logic_vector (31 downto 0);
    H: in std_logic_vector (31 downto 0);
    Sel: in std_logic;
    O: out std_logic_vector (31 downto 0)
  );
end MUX;

architecture Behavioral of MUX is

begin
    process (Sel, L, H)
    begin
        if Sel = '0' then
            O <= L;
        else
            O <= H;
        end if;
    end process;
end Behavioral;
