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
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RegisterSet is
    port (
        CLK, RST : in std_logic;

        RdRegNo1, RdRegNo2 : in std_logic_vector (4 downto 0);

        WrEn : in std_logic;
        WrRegNo : in std_logic_vector (4 downto 0);
        WrData : in std_logic_vector (31 downto 0);

        RdData1, RdData2 : out std_logic_vector (31 downto 0)
    );
end RegisterSet;

architecture Behavioral of RegisterSet is
    type TRegisters is array (0 to 31) of std_logic_vector(31 downto 0);
    signal Registers : TRegisters;
begin
    process (CLK, RST, WrEn, WrRegNo, WrData)
        variable curr : std_logic_vector (2 downto 0);
    begin
        if (RST = '0') then
            Registers <= (1 => x"00000001", 10 => std_logic_vector(to_unsigned(10, 32)), 11 => std_logic_vector(to_unsigned(1997, 32)), others => x"00000000");
        elsif rising_edge(CLK) then
            if WrEn = '1' and unsigned(WrRegNo) /= 0 then
                Registers(to_integer(unsigned(WrRegNo))) <= WrData;
            end if;
        end if;
    end process;

    process (Registers, RdRegNo1, RdRegNo2)
    begin
        RdData1 <= Registers(to_integer(unsigned(RdRegNo1)));
        RdData2 <= Registers(to_integer(unsigned(RdRegNo2)));
    end process;
end Behavioral;
