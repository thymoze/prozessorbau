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
    signal IF_PC : std_logic_vector (31 downto 0);
    signal IF_PCNext : std_logic_vector (31 downto 0);
    signal IF_ImemAddr : std_logic_vector(9 downto 0);

    signal IF_ID_Inst : std_logic_vector (31 downto 0);
    signal IF_ID_PC : std_logic_vector (31 downto 0);

    -- instruction decode
    signal ID_Inst : std_logic_vector (31 downto 0);
    signal ID_PC : std_logic_vector (31 downto 0);
    signal ID_SrcReg1, ID_SrcReg2 : std_logic_vector(4 downto 0);
    signal ID_RegData1, ID_RegData2 : std_logic_vector(31 downto 0);
    signal ID_Imm : std_logic_vector(31 downto 0);
    signal ID_SelSrc2 : std_logic;
    signal ID_Funct : std_logic_vector (2 downto 0);
    signal ID_Aux : std_logic;
    signal ID_DestWrEn : std_logic;
    signal ID_DestRegNo : std_logic_vector(4 downto 0);
    signal ID_Clear : std_logic;

    signal ID_EX_Data1, ID_EX_Data2 : std_logic_vector(31 downto 0);
    signal ID_EX_PCNext : std_logic_vector (31 downto 0);
    signal ID_EX_Jump : std_logic;
    signal ID_EX_JumpRel : std_logic;
    signal ID_EX_JumpTarget : std_logic_vector (31 downto 0);
    signal ID_EX_MemAccess : std_logic;
    signal ID_EX_MemWrEn : std_logic;

    -- execute
    signal EX_SrcData1, EX_SrcData2, EX_Data2 : std_logic_vector(31 downto 0);
    signal EX_Imm : std_logic_vector(31 downto 0);
    signal EX_SelSrc2 : std_logic;
    signal EX_Funct : std_logic_vector (2 downto 0);
    signal EX_Aux : std_logic;
    signal EX_DestWrEn : std_logic;
    signal EX_DestRegNo : std_logic_vector(4 downto 0);
    signal EX_DestData : std_logic_vector(31 downto 0);
    signal EX_PCNext : std_logic_vector (31 downto 0);
    signal EX_Jump : std_logic;
    signal EX_JumpO : std_logic;
    signal EX_JumpRel : std_logic;
    signal EX_JumpTarget : std_logic_vector (31 downto 0);
    signal EX_Clear : std_logic;
    signal EX_MemAccess : std_logic;
    signal EX_MemWrEn : std_logic;

    signal EX_IF_Jump : std_logic;
    signal EX_IF_JumpTarget : std_logic_vector (31 downto 0);

    signal EX_ID_Jump : std_logic;

    signal EX_MEM_DestWrEn : std_logic;
    signal EX_MEM_DestRegNo : std_logic_vector (4 downto 0);
    signal EX_MEM_WrData : std_logic_vector (31 downto 0);
    signal EX_MEM_Access : std_logic;
    signal EX_MEM_ByteEna : std_logic_vector (3 downto 0);

    -- mem
    signal MEM_DestData : std_logic_vector (31 downto 0);
    signal MEM_DestWrEn : std_logic;
    signal MEM_DestRegNo : std_logic_vector (4 downto 0);
    signal MEM_MemData : std_logic_vector (31 downto 0);
    signal MEM_MemAccess : std_logic;
    signal MEM_Funct : std_logic_vector (2 downto 0);

    signal MEM_ID_WrData : std_logic_vector (31 downto 0);

begin
    -----------------------
    -- INSTRUCTION FETCH --
    -----------------------
    fetch : entity work.FetchStage
        port map(
            CLK => CLK, RST => RST,

            PCI => IF_PCNext,

            PCO => IF_PC
        );

    fetcher : entity work.Fetch
        port map(
            PCI => IF_PC,
            Jump => EX_IF_Jump,
            JumpTarget => EX_IF_JumpTarget,

            PCNext => IF_PCNext,
            PC => IF_ID_PC,
            ImemAddr => IF_ImemAddr
        );

    imem : entity work.imem_test06mem
        port map(
            Clock => CLK,
            address => IF_ImemAddr,
            q => IF_ID_Inst
        );

    ------------------------
    -- INSTRUCTION DECODE --
    ------------------------
    decode : entity work.DecodeStage
        port map(
            CLK => CLK, RST => RST,

            InstI => IF_ID_Inst,
            PCI => IF_ID_PC,
            ClearI => EX_ID_Jump,

            InstO => ID_Inst,
            PCO => ID_PC,
            ClearO => ID_Clear
        );

    decoder : entity work.Decode
        port map(
            Inst => ID_Inst,
            PC => ID_PC,
            Clear => ID_Clear,

            Funct => ID_Funct,
            Aux => ID_Aux,
            Imm => ID_Imm,
            SrcRegNo1 => ID_SrcReg1, SrcRegNo2 => ID_SrcReg2,
            DestWrEn => ID_DestWrEn, DestRegNo => ID_DestRegNo,
            SelSrc2 => ID_SelSrc2,
            PCNext => ID_EX_PCNext,
            Jump => ID_EX_Jump, JumpRel => ID_EX_JumpRel, JumpTarget => ID_EX_JumpTarget,
            MemAccess => ID_EX_MemAccess, MemWrEn => ID_EX_MemWrEn
        );

    regset : entity work.RegisterSet
        port map(
            CLK => CLK, RST => RST,

            RdRegNo1 => ID_SrcReg1, RdRegNo2 => ID_SrcReg2,
            WrEn => MEM_DestWrEn, WrRegNo => MEM_DestRegNo, WrData => MEM_ID_WrData,

            RdData1 => ID_RegData1, RdData2 => ID_RegData2
        );

    forward : entity work.Forward
        port map(
            SrcRegNo1 => ID_SrcReg1, SrcRegNo2 => ID_SrcReg2,
            SrcData1 => ID_RegData1, SrcData2 => ID_RegData2,
            DestWrEn_EX => EX_DestWrEn, DestRegNo_EX => EX_DestRegNo, DestData_EX => EX_DestData,
            DestWrEn_MEM => MEM_DestWrEn, DestRegNo_MEM => MEM_DestRegNo, DestData_MEM => MEM_ID_WrData,

            FwdData1 => ID_EX_Data1, FwdData2 => ID_EX_Data2
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
            DestWrEnI => ID_DestWrEn, DestRegNoI => ID_DestRegNo,
            MemAccessI => ID_EX_MemAccess, MemWrEnI => ID_EX_MemWrEn,
            PCNextI => ID_EX_PCNext,
            JumpI => ID_EX_Jump, JumpRelI => ID_EX_JumpRel, JumpTargetI => ID_EX_JumpTarget,
            ClearI => EX_JumpO,

            FunctO => EX_Funct,
            AuxO => EX_Aux,
            SrcData1O => EX_SrcData1, SrcData2O => EX_SrcData2,
            ImmO => EX_Imm,
            SelSrc2O => EX_SelSrc2,
            DestWrEnO => EX_DestWrEn, DestRegNoO => EX_DestRegNo,
            MemAccessO => EX_MemAccess, MemWrEnO => EX_MemWrEn,
            PCNextO => EX_PCNext,
            JumpO => EX_Jump, JumpRelO => EX_JumpRel, JumpTargetO => EX_JumpTarget,
            ClearO => EX_Clear
        );

    immOrReg : entity work.MUX
        port map(
            L => EX_Imm,
            H => EX_SrcData2,
            Sel => EX_SelSrc2,
            O => EX_Data2
        );

    alu : entity work.ALU
        port map(
            A => EX_SrcData1, B => EX_Data2,
            SrcData2 => EX_SrcData2,
            Funct => EX_Funct, Aux => EX_Aux,
            DestWrEnI => EX_DestWrEn, DestRegNoI => EX_DestRegNo,
            MemAccessI => EX_MemAccess, MemWrEn => EX_MemWrEn,
            PCNext => EX_PCNext,
            JumpI => EX_Jump, JumpRelI => EX_JumpRel, JumpTargetI => EX_JumpTarget,
            Clear => EX_Clear,

            X => EX_DestData,
            DestWrEnO => EX_MEM_DestWrEn, DestRegNoO => EX_MEM_DestRegNo,
            JumpO => EX_JumpO, JumpTargetO => EX_IF_JumpTarget,
            MemWrData => EX_MEM_WrData, MemAccessO => EX_MEM_Access, MemByteEna => EX_MEM_ByteEna
        );

    EX_IF_Jump <= EX_JumpO;
    EX_ID_Jump <= EX_JumpO;

    --
    -- MEM
    --
    mem : entity work.MemStage
        port map(
            CLK => CLK, RST => RST,

            DestWrEnI => EX_MEM_DestWrEn, DestRegNoI => EX_MEM_DestRegNo, DestDataI => EX_DestData,
            MemWrData => EX_MEM_WrData, MemAccessI => EX_MEM_Access, MemByteEna => EX_MEM_ByteEna,

            DestWrEnO => MEM_DestWrEn, DestRegNoO => MEM_DestRegNo, DestDataO => MEM_DestData,
            MemAccessO => MEM_MemAccess,
            FunctO => MEM_Funct
        );

    memory : entity work.memory
        port map(
            addra => EX_DestData (11 downto 2),
            clka => CLK,
            dina => EX_MEM_WrData,
            ena => EX_MEM_Access,
            wea => EX_MEM_ByteEna,

            douta => MEM_MemData
        );

    memMux : entity work.MemMux
        port map(
            ALUDataIn => MEM_DestData,
            MemDataIn => MEM_MemData,
            Sel => MEM_MemAccess,
            FunctI => MEM_Funct,
            
            WrData => MEM_ID_WrData
        );
end Behavioral;
