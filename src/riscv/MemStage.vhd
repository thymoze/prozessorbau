library IEEE;
use IEEE.std_logic_1164.all;

entity MemStage is
    port (
        CLK, RST : in std_logic;

        DestDataI : in std_logic_vector(31 downto 0);
        DestWrEnI : in std_logic;
        DestRegNoI : in std_logic_vector(4 downto 0);
        MemAccessI : in std_logic;
        MemWrData : in std_logic_vector(31 downto 0);
        MemByteEna : in std_logic_vector(3 downto 0);
        RamRdData : in std_logic_vector(31 downto 0);
        RamBusy : in std_logic;
        FunctI : in std_logic_vector(2 downto 0);
        StallI : in std_logic;

        DestDataO : out std_logic_vector(31 downto 0);
        DestWrEnO : out std_logic;
        DestRegNoO : out std_logic_vector(4 downto 0);
        MemAccessO : out std_logic;
        --MemRdData : out std_logic_vector(31 downto 0);
        RamReadEn : out std_logic;
        RamWriteEn : out std_logic;
        RamByteEna : out std_logic_vector(3 downto 0);
        RamAddress : out std_logic_vector(31 downto 0);
        RamWrData : out std_logic_vector(31 downto 0);
        FunctO : out std_logic_vector(2 downto 0);
        StallO : out std_logic
    );
end MemStage;

architecture Behavioral of MemStage is
    type state_type is (Idle, Stalled);
    signal current_state : state_type;
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            DestDataO <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            MemAccessO <= '0';
            --MemRdData <= x"00000000";

            RamReadEn <= '0';
            RamWriteEn <= '0';

            FunctO <= "000";
            StallO <= '0';

            current_state <= Idle;
        elsif rising_edge(CLK) then
            if StallI = '0' then
                DestDataO <= DestDataI;
                DestWrEnO <= DestWrEnI;
                DestRegNoO <= DestRegNoI;
                MemAccessO <= MemAccessI;
                --MemRdData <= MemWrData;

                FunctO <= FunctI;
                StallO <= StallI;
            end if;

            case current_state is
                when Idle =>
                    StallO <= '1';
                    current_state <= Stalled;

                when Stalled =>
                    StallO <= '0';
                    current_state <= Idle;
            end case;
        end if;
    end process;
end Behavioral;
