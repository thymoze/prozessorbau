library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;
use work.constants.all;
use work.util.all;

entity Fetch is
    generic (
        ThreadCount : integer;
        ThreadScheduling : scheduling_t;
        ThreadStart : thread_start_t
    );
    port (
        PCI : in thread_pc_array_t;

        ThreadTagI : in thread_tag_t;

        Jump : in thread_logic;
        JumpTarget : in std_logic_vector(31 downto 0);
        SpawnThread : in thread_tag_t;
        SpawnTarget : in std_logic_vector(31 downto 0);
        Interlock : in thread_logic;
        Stall : in std_logic;

        PC : out std_logic_vector(31 downto 0);
        ThreadTagO : out thread_tag_t;
        PCNext : out thread_pc_array_t;
        ThreadTagNext : out thread_tag_t;
        ImemAddr : out std_logic_vector(9 downto 0);
        ActiveThreads : out std_logic_vector(ThreadCount - 1 downto 0)
    );
end Fetch;

architecture Behavioral of Fetch is
begin
    process (PCI, Jump, JumpTarget, Interlock, Stall, ThreadTagI, SpawnThread, SpawnTarget)
        variable thread_tag_next : thread_tag_t;
        variable thread_pc_next : thread_pc_array_t;
    begin
        PC <= PCI(ThreadTagI);
        ThreadTagO <= ThreadTagI;

        thread_pc_next := PCI;

        if Jump.Value = '1' then
            thread_pc_next(Jump.ThreadTag) := JumpTarget;
        elsif SpawnThread /= 0 then
            thread_pc_next(SpawnThread) := SpawnTarget;
        end if;

        if Jump.Value = '0' or Jump.ThreadTag /= ThreadTagI then
            if (Interlock.Value = '1' and ThreadTagI = Interlock.ThreadTag) then
                thread_pc_next(ThreadTagI) := PCI(ThreadTagI);
            else
                thread_pc_next(ThreadTagI) := std_logic_vector(unsigned(PCI(ThreadTagI)) + 4);
            end if;
        end if;

        if Stall = '1' then
            ThreadTagNext <= ThreadTagI;
            PCNext <= PCI;
            ImemAddr <= PCI(ThreadTagI)(11 downto 2);
        else
            for i in 1 to ThreadCount loop
                thread_tag_next := (i + ThreadTagI) mod ThreadCount;
                exit when ThreadStart /= spawn or signed(thread_pc_next(thread_tag_next)) /= to_signed(-4, 32);
            end loop;

            ThreadTagNext <= thread_tag_next;
            PCNext <= thread_pc_next;
            ImemAddr <= thread_pc_next(thread_tag_next)(11 downto 2);
        end if;

        for i in 0 to ThreadCount - 1 loop
            ActiveThreads(i) <= '1' when signed(PCI(i)) /= to_signed(-4, 32) else
            '0';
        end loop;
    end process;
end Behavioral;
