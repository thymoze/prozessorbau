library IEEE;
use IEEE.std_logic_1164.all;
use work.types.all;

entity ExecuteStage is
    port (
        CLK, RST : in std_logic;

        FunctI : in std_logic_vector (2 downto 0);
        SrcData1I, SrcData2I : in std_logic_vector (31 downto 0);
        DestWrEnI : in std_logic;
        DestRegNoI : in std_logic_vector (4 downto 0);
        AuxI : in std_logic;
        PCNextI : in std_logic_vector (31 downto 0);
        JumpI : in std_logic;
        JumpRelI : in std_logic;
        JumpTargetI : in std_logic_vector (31 downto 0);
        MemAccessI : in std_logic;
        MemWrEnI : in std_logic;
        ClearI : in thread_logic;
        ImmI : in std_logic_vector(31 downto 0);
        SelSrc2I : in std_logic;
        Stall : in std_logic;
        Set7SegI : in std_logic;
        SetThreadTagI : in std_logic;
        ThreadTagI : in thread_tag_t;
        SpawnThreadI : in thread_tag_t;

        FunctO : out std_logic_vector (2 downto 0);
        SrcData1O, SrcData2O : out std_logic_vector (31 downto 0);
        DestWrEnO : out std_logic;
        DestRegNoO : out std_logic_vector (4 downto 0);
        AuxO : out std_logic;
        PCNextO : out std_logic_vector (31 downto 0);
        JumpO : out std_logic;
        JumpRelO : out std_logic;
        JumpTargetO : out std_logic_vector (31 downto 0);
        MemAccessO : out std_logic;
        MemWrEnO : out std_logic;
        ClearO : out thread_logic;
        ImmO : out std_logic_vector(31 downto 0);
        SelSrc2O : out std_logic;
        Set7SegO : out std_logic;
        SetThreadTagO : out std_logic;
        ThreadTagO : out thread_tag_t;
        SpawnThreadO : out thread_tag_t
    );
end ExecuteStage;

architecture Behavioral of ExecuteStage is
begin
    process (CLK, RST)
    begin
        if RST = '0' then
            FunctO <= "000";
            SrcData1O <= x"00000000";
            SrcData2O <= x"00000000";
            DestWrEnO <= '0';
            DestRegNoO <= "00000";
            AuxO <= '0';
            PCNextO <= x"00000000";
            JumpO <= '0';
            JumpRelO <= '0';
            JumpTargetO <= x"00000000";
            MemAccessO <= '0';
            MemWrEnO <= '0';
            ClearO <= (ThreadTag => 0, Value => '0');
            ImmO <= x"00000000";
            SelSrc2O <= '0';
            Set7SegO <= '0';
            SetThreadTagO <= '0';
            ThreadTagO <= 0;
            SpawnThreadO <= 0;
        elsif rising_edge(CLK) then
            if Stall = '0' then
                FunctO <= FunctI;
                SrcData1O <= SrcData1I;
                SrcData2O <= SrcData2I;
                DestWrEnO <= DestWrEnI;
                DestRegNoO <= DestRegNoI;
                AuxO <= AuxI;
                PCNextO <= PCNextI;
                JumpO <= JumpI;
                JumpRelO <= JumpRelI;
                JumpTargetO <= JumpTargetI;
                MemAccessO <= MemAccessI;
                MemWrEnO <= MemWrEnI;
                ClearO <= ClearI;
                ImmO <= ImmI;
                SelSrc2O <= SelSrc2I;
                Set7SegO <= Set7SegI;
                SetThreadTagO <= SetThreadTagI;
                ThreadTagO <= ThreadTagI;
                SpawnThreadO <= SpawnThreadI;
            end if;
        end if;
    end process;

end Behavioral;
