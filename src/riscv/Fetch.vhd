library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.constants.all;

entity Fetch is
    port (
        PCI : in std_logic_vector (31 downto 0);
        Jump : in std_logic;
        JumpTarget : in std_logic_vector (31 downto 0);
        InterlockI : in std_logic;
        Stall : in std_logic;

        PCNext : out std_logic_vector(31 downto 0);
        PC : out std_logic_vector(31 downto 0);
        ImemAddr : out std_logic_vector(9 downto 0)
    );
end Fetch;

architecture Behavioral of Fetch is

begin
    process (PCI, Jump, JumpTarget, InterlockI, Stall)
        variable pc_next : std_logic_vector (31 downto 0);
    begin
        if Jump = '1' then
            pc_next := JumpTarget;
        else
            if InterlockI = '1' then
                pc_next := PCI;
            else
                pc_next := std_logic_vector(unsigned(PCI) + 4);
            end if;
        end if;

        PC <= PCI;

        if Stall = '0' then
            PCNext <= pc_next;
            ImemAddr <= pc_next(11 downto 2);
        end if;
    end process;
end Behavioral;
