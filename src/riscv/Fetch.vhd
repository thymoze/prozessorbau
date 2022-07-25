library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;
use work.constants.all;

entity Fetch is
    generic (
        ThreadCount : integer;
        ThreadScheduling : scheduling_t;
        ThreadStart : thread_start_t
    );
    port (
        RST : in std_logic;
        PCI : in std_logic_vector(31 downto 0);

        ThreadTagI : in thread_tag_t;

        Jump : in thread_logic;
        JumpTarget : in std_logic_vector(31 downto 0);
        SpawnThread : in thread_tag_t;
        SpawnTarget : in std_logic_vector(31 downto 0);
        Interlock : in thread_logic;
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

    function init_thread_pc_array(ThreadStart : thread_start_t) return thread_pc_array is
    begin
        case ThreadStart is
            when start_0 => return (others => (others => '0'));
            when spawn => return (0 => (others => '0'), others => std_logic_vector(to_signed(-4, 32)));
        end case;
    end function;
begin
    process (RST, PCI, Jump, JumpTarget, Interlock, Stall, ThreadTagI)
        variable thread_tag_next : thread_tag_t;
        variable thread_pc_next : thread_pc_array := init_thread_pc_array(ThreadStart);
    begin
        PC <= PCI;
        ThreadTagO <= ThreadTagI;

        if Jump.Value = '1' then
            thread_pc_next(Jump.ThreadTag) := JumpTarget;
        elsif SpawnThread /= 0 then
            thread_pc_next(SpawnThread) := SpawnTarget;
        end if;

        if Jump.Value = '0' or Jump.ThreadTag /= ThreadTagI then
            if (Interlock.Value = '1' and ThreadTagI = Interlock.ThreadTag) then
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
            for i in 1 to ThreadCount loop
                thread_tag_next := (i + ThreadTagI) mod ThreadCount;
                if signed(thread_pc_next(thread_tag_next)) /= to_signed(-4, 32) then
                    exit;
                end if;
            end loop;

            ThreadTagNext <= thread_tag_next;
            PCNext <= thread_pc_next(thread_tag_next);
            ImemAddr <= thread_pc_next(thread_tag_next)(11 downto 2);
        end if;

        if RST = '0' then
            thread_pc_next := init_thread_pc_array(ThreadStart);
        end if;
    end process;
end Behavioral;
