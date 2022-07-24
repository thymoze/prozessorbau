library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;
use work.constants.all;

entity Fetch is
    generic (
        ThreadCount : integer
    );
    port (
        PCI : in std_logic_vector(31 downto 0);

        ThreadTagI : in thread_tag_t;

        Jump : in std_logic;
        JumpTarget : in std_logic_vector(31 downto 0);
        JumpThreadTag : in thread_tag_t;
        InterlockI : in std_logic;
        InterlockThreadTag : in thread_tag_t;
        Stall : in std_logic;

        PC : out std_logic_vector(31 downto 0);
        ThreadTagO : out thread_tag_t;
        PCNext : out std_logic_vector(31 downto 0);
        ThreadTagNext : out thread_tag_t;
        ImemAddr : out std_logic_vector(9 downto 0)
    );
end Fetch;

architecture Behavioral of Fetch is
    type thread_pc_array is array (0 to ThreadCount - 1) of std_logic_vector(31 downto 0);
begin
    process (PCI, Jump, JumpTarget, InterlockI, Stall, ThreadTagI)
        variable thread_tag_next : thread_tag_t;
        variable thread_pc_next : thread_pc_array := (others => (others => '0'));
    begin
        PC <= PCI;
        ThreadTagO <= ThreadTagI;

        if Jump = '1' then
            thread_pc_next(JumpThreadTag) := JumpTarget;
        else
            if InterlockI = '1' and ThreadTagI = InterlockThreadTag then
                thread_pc_next(ThreadTagI) := PCI;
            else
                thread_pc_next(ThreadTagI) := std_logic_vector(unsigned(PCI) + 4);
            end if;
        end if;

        if Stall = '1' then
            ThreadTagNext <= ThreadTagI;
            PCNext <= PCI;
            ImemAddr <= PCI(11 downto 2);
        else
            if ThreadTagI + 1 >= ThreadCount then
                thread_tag_next := 0;
            else
                thread_tag_next := ThreadTagI + 1;
            end if;

            ThreadTagNext <= thread_tag_next;
            PCNext <= thread_pc_next(thread_tag_next);
            ImemAddr <= thread_pc_next(thread_tag_next)(11 downto 2);
        end if;
    end process;
end Behavioral;
