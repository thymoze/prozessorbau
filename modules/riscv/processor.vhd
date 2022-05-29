library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity processor is
    port (
        CLK : in std_logic;
        RST : in std_logic
    );
end processor;

architecture Behavioral of processor is
    -- instruction fetch
    signal IF_PC : std_logic_vector (9 downto 0);
    signal IF_Inst : std_logic_vector (31 downto 0);

    -- instruction decode
    signal ID_Inst : std_logic_vector (31 downto 0);
    signal ID_SrcReg1, ID_SrcReg2 : std_logic_vector(4 downto 0);
    signal ID_RegData1, ID_RegData2 : std_logic_vector(31 downto 0);
    signal ID_Imm : std_logic_vector(31 downto 0);
    signal ID_SelSrc2 : std_logic;
    signal ID_Funct : std_logic_vector (2 downto 0);
    signal ID_Aux : std_logic;
    signal ID_DestWrEn : std_logic;
    signal ID_DestRegNo : std_logic_vector(4 downto 0);

    signal ID_EX_Data1, ID_EX_Data2 : std_logic_vector(31 downto 0);

    -- execute
    signal EX_Data1, EX_Data2 : std_logic_vector(31 downto 0);
    signal EX_Imm : std_logic_vector(31 downto 0);
    signal EX_SelSrc2 : std_logic;
    signal EX_Funct : std_logic_vector (2 downto 0);
    signal EX_Aux : std_logic;
    signal EX_DestWrEn : std_logic;
    signal EX_DestRegNo : std_logic_vector(4 downto 0);

    signal EX_MEM_DestData : std_logic_vector(31 downto 0);
    signal EX_MEM_DestWrEn : std_logic;
    signal EX_MEM_DestRegNo : std_logic_vector(4 downto 0);

    -- mem
    signal MEM_DestData : std_logic_vector(31 downto 0);
    signal MEM_DestWrEn : std_logic;
    signal MEM_DestRegNo : std_logic_vector(4 downto 0);
begin
    -----------------------
    -- INSTRUCTION FETCH --
    -----------------------
    inc : entity work.Inc10Bit
        port map(
            CLK => CLK, RST => RST,
            O => IF_PC
        );

    imem : entity work.imem_Task27
        port map(
            Clock => CLK,
            address => IF_PC,
            q => IF_Inst
        );

    ------------------------
    -- INSTRUCTION DECODE --
    ------------------------
    decode : entity work.DecodeStage
        port map(
            CLK => CLK, RST => RST,

            InstI => IF_Inst,

            InstO => ID_Inst
        );

    decoder : entity work.Decode
        port map(
            Inst => ID_Inst,

            Funct => ID_Funct,
            Aux => ID_Aux,
            Imm => ID_Imm,
            SrcRegNo1 => ID_SrcReg1, SrcRegNo2 => ID_SrcReg2,
            DestWrEn => ID_DestWrEn, DestRegNo => ID_DestRegNo,
            SelSrc2 => ID_SelSrc2
        );

    regset : entity work.RegisterSet
        port map(
            CLK => CLK, RST => RST,

            RdRegNo1 => ID_SrcReg1, RdRegNo2 => ID_SrcReg2,
            WrEn => MEM_DestWrEn, WrRegNo => MEM_DestRegNo, WrData => MEM_DestData,

            RdData1 => ID_EX_Data1, RdData2 => ID_RegData2
        );

    --ID_EX_Data1 <= ID_RegData1;

    immOrReg : entity work.MUX
        port map(
            L => ID_Imm,
            H => ID_RegData2,
            Sel => ID_SelSrc2,
            O => ID_EX_Data2
        );

    -------------
    -- EXECUTE --
    -------------
    ex : entity work.ExecuteStage
        port map(
            CLK => CLK, RST => RST,

            FunctI => ID_Funct,
            AuxI => ID_Aux,
            SrcData1I => ID_EX_Data1, SrcData2I => ID_EX_Data2,
            ImmI => ID_Imm,
            SelSrc2I => ID_SelSrc2,
            DestWrEnI => ID_DestWrEn,
            DestRegNoI => ID_DestRegNo,

            FunctO => EX_Funct,
            AuxO => EX_Aux,
            SrcData1O => EX_Data1, SrcData2O => EX_Data2,
            ImmO => EX_Imm,
            SelSrc2O => EX_SelSrc2,
            DestWrEnO => EX_DestWrEn, DestRegNoO => EX_DestRegNo
        );

    alu : entity work.ALU
        port map(
            A => EX_Data1, B => EX_Data2,
            Funct => EX_Funct, Aux => EX_Aux,
            DestWrEnI => EX_DestWrEn, DestRegNoI => EX_DestRegNo,

            X => EX_MEM_DestData,
            DestWrEnO => EX_MEM_DestWrEn, DestRegNoO => EX_MEM_DestRegNo
        );

    --
    -- MEM
    --
    mem : entity work.MemStage
        port map(
            CLK => CLK, RST => RST,

            DestWrEnI => EX_MEM_DestWrEn, DestRegNoI => EX_MEM_DestRegNo, DestDataI => EX_MEM_DestData,

            DestWrEnO => MEM_DestWrEn, DestRegNoO => MEM_DestRegNo, DestDataO => MEM_DestData
        );
end Behavioral;
