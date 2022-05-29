library IEEE;
use IEEE.std_logic_1164.all;

entity ExecuteStage is
    port (
        CLK, RST : in std_logic;

        FunctI : in std_logic_vector (2 downto 0);
        SrcData1I, SrcData2I : in std_logic_vector (31 downto 0);
        DestWrEnI : in std_logic;
        DestRegNoI : in std_logic_vector (4 downto 0);
        AuxI : in std_logic;
        --PCNextI : in std_logic_vector (31 downto 0);
        --JumpI : in std_logic;
        --JumpRelI : in std_logic;
        --JumpTargetI : in std_logic_vector (31 downto 0);
        --MemAccessI : in std_logic;
        --MemWrEnI : in std_logic;
        --ClearI : in std_logic;
        ImmI : in std_logic_vector(31 downto 0);
        SelSrc2I : in std_logic;
        --Stall : in std_logic;

        FunctO : out std_logic_vector (2 downto 0);
        SrcData1O, SrcData2O : out std_logic_vector (31 downto 0);
        DestWrEnO : out std_logic;
        DestRegNoO : out std_logic_vector (4 downto 0);
        AuxO : out std_logic;
        --PCNextO : out std_logic_vector (31 downto 0);
        --JumpO : out std_logic;
        --JumpRelO : out std_logic;
        --JumpTargetO : out std_logic_vector (31 downto 0);
        --MemAccessO : out std_logic;
        --MemWrEnO : out std_logic;
        --ClearO : out std_logic;
        ImmO : out std_logic_vector(31 downto 0);
        SelSrc2O : out std_logic
    );
end ExecuteStage;

architecture Behavioral of ExecuteStage is
begin
    FunctO <= FunctI;
    SrcData1O <= SrcData1I;
    SrcData2O <= SrcData2I;
    DestWrEnO <= DestWrEnI;
    DestRegNoO <= DestRegNoI;
    AuxO <= AuxI;
    --PCNextO <= PCNextI;
    --JumpO <= JumpI;
    --JumpRelO <= JumpRelI;
    --JumpTargetO <= JumpTargetI;
    --MemAccessO <= MemAccessI;
    --MemWrEnO <= MemWrEnI;
    --ClearO <= ClearI;
    ImmO <= ImmI;
    SelSrc2O <= SelSrc2I;
end Behavioral;
