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
use work.types.thread_tag_t;

entity RegisterSet is
    generic (
        ThreadCount : integer
    );
    port (
        CLK, RST : in std_logic;

        ThreadTag : in thread_tag_t;

        RdRegNo1, RdRegNo2 : in std_logic_vector (4 downto 0);

        WrEn : in std_logic;
        WrRegNo : in std_logic_vector (4 downto 0);
        WrData : in std_logic_vector (31 downto 0);

        RdData1, RdData2 : out std_logic_vector (31 downto 0)
    );
end RegisterSet;

architecture Behavioral of RegisterSet is
    type registers_t is array (0 to 31) of std_logic_vector(31 downto 0);
    type thread_registers_t is array (0 to ThreadCount - 1) of registers_t;

    signal RegisterSets : thread_registers_t;
begin
    process (CLK, RST)
    begin
        if (RST = '0') then
            RegisterSets <= (others => (1 => x"00000001", others => x"00000000"));
        elsif rising_edge(CLK) then
            if WrEn = '1' and unsigned(WrRegNo) /= 0 then
                RegisterSets(ThreadTag)(to_integer(unsigned(WrRegNo))) <= WrData;
            end if;
        end if;
    end process;

    process (RegisterSets, RdRegNo1, RdRegNo2)
    begin
        RdData1 <= RegisterSets(ThreadTag)(to_integer(unsigned(RdRegNo1)));
        RdData2 <= RegisterSets(ThreadTag)(to_integer(unsigned(RdRegNo2)));
    end process;
end Behavioral;
