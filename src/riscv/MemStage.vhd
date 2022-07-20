library IEEE;
use IEEE.std_logic_1164.all;

use work.constants.all;
use work.types.all;

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
        ThreadTagI : in thread_tag_t;

        DestDataO : out std_logic_vector(31 downto 0);
        DestWrEnO : out std_logic;
        DestRegNoO : out std_logic_vector(4 downto 0);
        MemAccessO : out std_logic;
        MemRdData : out std_logic_vector(31 downto 0);
        RamReadEn : out std_logic;
        RamWriteEn : out std_logic;
        RamByteEna : out std_logic_vector(3 downto 0);
        RamAddress : out std_logic_vector(31 downto 0);
        RamWrData : out std_logic_vector(31 downto 0);
        FunctO : out std_logic_vector(2 downto 0);
        StallO : out std_logic;
        ThreadTagO : out thread_tag_t
    );
end MemStage;

architecture Behavioral of MemStage is
    type state_type is (Idle, Read, Write);
    signal current_state : state_type;
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            DestDataO <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            MemAccessO <= '0';
            MemRdData <= x"00000000";

            RamReadEn <= '0';
            RamWriteEn <= '0';
            RamAddress <= (others => '0');

            FunctO <= "000";
            StallO <= '0';
            ThreadTagO <= 0;

            current_state <= Idle;
        elsif rising_edge(CLK) then
            if StallI = '0' then
                DestDataO <= DestDataI;
                DestWrEnO <= DestWrEnI;
                DestRegNoO <= DestRegNoI;
                MemAccessO <= MemAccessI;
                ThreadTagO <= ThreadTagI;

                FunctO <= FunctI;
                StallO <= StallI;
            end if;

            case current_state is
                when Idle =>
                    MemRdData <= (others => '0'); -- TODO: For some reason this gets written to the register
                    -- addresses < ROM_SIZE go to the rom, not the ram, and complete in 1 cycle
                    if MemAccessI = '1' and DestDataI >= ROM_SIZE then
                        RamAddress <= DestDataI(31 downto 2) & b"00"; -- set lowest two bits to 0 to ensure alignment
                        StallO <= '1';

                        if MemByteEna = "0000" then
                            current_state <= Read;
                            RamReadEn <= '1';
                        else
                            current_state <= Write;
                            RamWriteEn <= '1';
                            RamByteEna <= MemByteEna;
                            RamWrData <= MemWrData;
                        end if;
                    end if;

                when Read =>
                    RamReadEn <= '0';
                    if RamBusy = '0' then
                        StallO <= '0';
                        current_state <= Idle;
                        MemRdData <= RamRdData;
                    end if;

                when Write =>
                    RamWriteEn <= '0';
                    if RamBusy = '0' then
                        StallO <= '0';
                        current_state <= Idle;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
