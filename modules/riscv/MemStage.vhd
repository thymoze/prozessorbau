library IEEE;
use IEEE.std_logic_1164.all;

entity MemStage is
    port (
        CLK, RST : in std_logic;

        DestDataI : in std_logic_vector(31 downto 0);
        DestWrEnI : in std_logic;
        DestRegNoI : in std_logic_vector(4 downto 0);
        --MemAccessI : in std_logic;
        --MemWrData : in std_logic_vector(31 downto 0);
        --MemByteEna : in std_logic_vector(3 downto 0);
        --FunctI : in std_logic_vector(2 downto 0);
        --StallI : in std_logic;

        DestDataO : out std_logic_vector(31 downto 0);
        DestWrEnO : out std_logic;
        DestRegNoO : out std_logic_vector(4 downto 0)
        --MemAccessO : out std_logic;
        --MemRdData : out std_logic_vector(31 downto 0);
        --FunctO : out std_logic_vector(2 downto 0);
        --StallO : out std_logic
    );
end MemStage;

architecture Behavioral of MemStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            DestDataO <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            --MemAccessO <= '0';
            --MemRdData <= x"00000000";
            --FunctO <= "000";
            --StallO <= '0';
        elsif rising_edge(CLK) then
            DestDataO <= DestDataI;
            DestWrEnO <= DestWrEnI;
            DestRegNoO <= DestRegNoI;
            --MemAccessO <= MemAccessI;
            --MemRdData <= MemWrData;
            --FunctO <= FunctI;
            --StallO <= StallI;
        end if;
    end process;
end Behavioral;
