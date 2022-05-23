----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/18/2022 03:51:42 PM
-- Design Name:
-- Module Name: RegisterSet - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterSet is
  Port (
    RdRegNo1 : in std_logic_vector (4 downto 0);
    RdRegNo2 : in std_logic_vector (4 downto 0);

    WrEn : in std_logic;
    WrRegNo : in std_logic_vector (4 downto 0);
    WrData : in std_logic_vector (31 downto 0);

    RdData1 : out std_logic_vector (31 downto 0);
    RdData2 : out std_logic_vector (31 downto 0);

    CLK : in std_logic;
    RST : in std_logic
  );
end RegisterSet;

architecture Behavioral of RegisterSet is
    type TRegisters is array (0 TO 31) of std_logic_vector(31 downto 0);
    signal Registers : TRegisters;
begin
    --process
    --begin
        RdData1 <= Registers(to_integer(unsigned(RdRegNo1)));
        RdData2 <= Registers(to_integer(unsigned(RdRegNo2)));
    --end process;

    process (CLK, RST)
    variable curr: std_logic_vector (2 downto 0);
    begin
        if (RST = '0') then
            Registers <= (1 => x"00000001", others => x"00000000");
        elsif rising_edge(CLK) then
            if WrEn = '1' and unsigned(WrRegNo) /= 0 then
                Registers(to_integer(unsigned(WrRegNo))) <= WrData;
            end if;
        end if;
    end process;
end Behavioral;
