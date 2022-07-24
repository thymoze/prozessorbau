library IEEE;
use IEEE.std_logic_1164.all;
use work.types.all;

entity DecodeStage is
    port (
        CLK, RST : in std_logic;

        InstI : in std_logic_vector (31 downto 0);
        PCI : in std_logic_vector (31 downto 0);
        InterlockI : in thread_logic;
        ClearI : in thread_logic;
        Stall : in std_logic;
        ThreadTagI : in thread_tag_t;

        InstO : out std_logic_vector (31 downto 0);
        PCO : out std_logic_vector (31 downto 0);
        InterlockO : out thread_logic;
        ClearO : out thread_logic;
        ThreadTagO : out thread_tag_t
    );
end DecodeStage;

architecture Behavioral of DecodeStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            InstO <= x"00000000";
            PCO <= x"00000000";
            InterlockO <= (ThreadTag => 0, Value => '0');
            ClearO <= (ThreadTag => 0, Value => '0');
            ThreadTagO <= 0;
        elsif rising_edge(CLK) and Stall = '0' then
            InstO <= InstI;
            PCO <= PCI;
            InterlockO <= InterlockI;
            ClearO <= ClearI;
            ThreadTagO <= ThreadTagI;
        end if;
    end process;
end Behavioral;
