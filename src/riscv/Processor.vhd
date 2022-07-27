library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.constants.all;
use work.types.all;
use work.seven_seg.all;
use work.util.all;

entity Processor is
    generic (
        ThreadCount : integer := THREAD_COUNT;
        ThreadStart : thread_start_t := start_offset
    );
    port (
        CLK : in std_logic;
        RST : in std_logic;

        SevenSeg : out SevenSegData;
        ActiveThreads : out std_logic_vector(ThreadCount - 1 downto 0)
    );
end Processor;

architecture Behavioral of Processor is
    -- instruction fetch
    signal IF_PC : thread_pc_array_t;
    signal IF_PCNext : thread_pc_array_t;
    signal IF_ImemAddr : std_logic_vector(9 downto 0);
    signal IF_ThreadTag : thread_tag_t := 0;
    signal IF_ThreadTagNext : thread_tag_t := 0;

    signal IF_ID_Inst : std_logic_vector (31 downto 0);
    signal IF_ID_PC : std_logic_vector (31 downto 0);
    signal IF_ID_ThreadTag : thread_tag_t := 0;

    signal IF_MEM_ROMDataIn : std_logic_vector (31 downto 0);

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
    signal ID_Clear : thread_logic;
    signal ID_Interlock : thread_logic;
    signal ID_ThreadTag : thread_tag_t := 0;

    signal ID_IF_Interlock : thread_logic;

    signal ID_EX_Data1, ID_EX_Data2 : std_logic_vector(31 downto 0);
    signal ID_EX_PCNext : std_logic_vector (31 downto 0);
    signal ID_EX_Jump : std_logic;
    signal ID_EX_JumpRel : std_logic;
    signal ID_EX_JumpTarget : std_logic_vector (31 downto 0);
    signal ID_EX_MemAccess : std_logic;
    signal ID_EX_MemWrEn : std_logic;
    signal ID_EX_Set7Seg : std_logic;
    signal ID_EX_SetThreadTag : std_logic;
    signal ID_EX_SpawnThread : thread_tag_t;

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
    signal EX_JumpO : thread_logic;
    signal EX_JumpRel : std_logic;
    signal EX_JumpTarget : std_logic_vector (31 downto 0);
    signal EX_Clear : thread_logic;
    signal EX_MemAccess : std_logic;
    signal EX_MemWrEn : std_logic;
    signal EX_Set7Seg : std_logic;
    signal EX_ThreadTag : thread_tag_t;
    signal EX_SetThreadTag : std_logic;
    signal EX_SpawnThread : thread_tag_t;

    signal EX_IF_Jump : thread_logic;
    signal EX_IF_JumpTarget : std_logic_vector (31 downto 0);
    signal EX_IF_MemAccess : std_logic;
    signal EX_IF_SpawnThread : thread_tag_t;
    signal EX_IF_SpawnTarget : std_logic_vector (31 downto 0);

    signal EX_ID_Jump : thread_logic;

    signal EX_MEM_Funct : std_logic_vector (2 downto 0);
    signal EX_MEM_DestWrEn : std_logic;
    signal EX_MEM_DestRegNo : std_logic_vector (4 downto 0);
    signal EX_MEM_WrData : std_logic_vector (31 downto 0);
    signal EX_MEM_MemAccess : std_logic;
    signal EX_MEM_ByteEna : std_logic_vector (3 downto 0);

    -- mem
    signal MEM_Funct : std_logic_vector (2 downto 0);
    signal MEM_Stall : std_logic;
    signal MEM_DestData : std_logic_vector (31 downto 0);
    signal MEM_DestWrEn : std_logic;
    signal MEM_DestRegNo : std_logic_vector (4 downto 0);
    signal MEM_MemData : std_logic_vector (31 downto 0);
    signal MEM_MemAccess : std_logic;
    signal MEM_RamReadEn : std_logic;
    signal MEM_RamWriteEn : std_logic;
    signal MEM_RamByteEna : std_logic_vector (3 downto 0);
    signal MEM_RamAddress : std_logic_vector (31 downto 0);
    signal MEM_RamWrData : std_logic_vector (31 downto 0);
    signal MEM_RamRdData : std_logic_vector (31 downto 0);
    signal MEM_RamBusy : std_logic;

    signal MEM_ID_WrData : std_logic_vector (31 downto 0);
    signal MEM_ID_ThreadTag : thread_tag_t;

begin
    -----------------------
    -- INSTRUCTION FETCH --
    -----------------------
    fetchStage : entity work.FetchStage
        generic map(
            ThreadStart => ThreadStart
        )
        port map(
            CLK => CLK, RST => RST,

            PCI => IF_PCNext,
            ThreadTagI => IF_ThreadTagNext,

            PCO => IF_PC,
            ThreadTagO => IF_ThreadTag
        );

    fetch : entity work.Fetch
        generic map(
            ThreadCount => ThreadCount,
            ThreadStart => ThreadStart
        )
        port map(
            ThreadTagI => IF_ThreadTag,
            PCI => IF_PC,
            Jump => EX_JumpO,
            JumpTarget => EX_IF_JumpTarget,
            Interlock => ID_IF_Interlock,
            Stall => MEM_Stall,
            SpawnThread => EX_IF_SpawnThread,
            SpawnTarget => EX_IF_SpawnTarget,

            PCNext => IF_PCNext,
            ThreadTagNext => IF_ThreadTagNext,
            PC => IF_ID_PC,
            ThreadTagO => IF_ID_ThreadTag,
            ImemAddr => IF_ImemAddr,
            ActiveThreads => ActiveThreads
        );

    imem : entity work.imemory
        port map(
            clka => CLK, clkb => CLK,

            addra => EX_DestData(11 downto 2),
            addrb => IF_ImemAddr,
            ena => EX_MEM_MemAccess,

            douta => IF_MEM_ROMDataIn,
            doutb => IF_ID_Inst
        );

    ------------------------
    -- INSTRUCTION DECODE --
    ------------------------
    decodeStage : entity work.DecodeStage
        port map(
            CLK => CLK, RST => RST,

            InstI => IF_ID_Inst,
            PCI => IF_ID_PC,
            ClearI => EX_JumpO,
            InterlockI => ID_IF_Interlock,
            Stall => MEM_Stall,
            ThreadTagI => IF_ID_ThreadTag,

            InstO => ID_Inst,
            PCO => ID_PC,
            ClearO => ID_Clear,
            InterlockO => ID_Interlock,
            ThreadTagO => ID_ThreadTag
        );

    decode : entity work.Decode
        generic map(
            ThreadCount => ThreadCount
        )
        port map(
            Inst => ID_Inst,
            PC => ID_PC,
            Clear => ID_Clear,
            InterlockI => ID_Interlock,
            ThreadTag => ID_ThreadTag,

            Funct => ID_Funct,
            Aux => ID_Aux,
            Imm => ID_Imm,
            SrcRegNo1 => ID_SrcReg1, SrcRegNo2 => ID_SrcReg2,
            DestWrEn => ID_DestWrEn, DestRegNo => ID_DestRegNo,
            SelSrc2 => ID_SelSrc2,
            PCNext => ID_EX_PCNext,
            Jump => ID_EX_Jump, JumpRel => ID_EX_JumpRel, JumpTarget => ID_EX_JumpTarget,
            MemAccess => ID_EX_MemAccess, MemWrEn => ID_EX_MemWrEn,
            InterlockO => ID_IF_Interlock,
            Set7Seg => ID_EX_Set7Seg,
            SetThreadTag => ID_EX_SetThreadTag,
            SpawnThread => ID_EX_SpawnThread
        );

    regset : entity work.RegisterSet
        generic map(
            ThreadCount => ThreadCount
        )
        port map(
            CLK => CLK, RST => RST,

            RdThreadTag => ID_ThreadTag,
            RdRegNo1 => ID_SrcReg1, RdRegNo2 => ID_SrcReg2,
            WrThreadTag => MEM_ID_ThreadTag,
            WrEn => MEM_DestWrEn, WrRegNo => MEM_DestRegNo, WrData => MEM_ID_WrData,

            RdData1 => ID_RegData1, RdData2 => ID_RegData2
        );

    forward : entity work.Forward
        port map(
            SrcRegNo1 => ID_SrcReg1, SrcRegNo2 => ID_SrcReg2,
            SrcData1 => ID_RegData1, SrcData2 => ID_RegData2,
            ThreadTag => ID_ThreadTag,

            DestWrEn_EX => EX_DestWrEn, DestRegNo_EX => EX_DestRegNo, DestData_EX => EX_DestData,
            ThreadTag_EX => EX_ThreadTag,

            DestWrEn_MEM => MEM_DestWrEn, DestRegNo_MEM => MEM_DestRegNo, DestData_MEM => MEM_ID_WrData,
            ThreadTag_MEM => MEM_ID_ThreadTag,

            FwdData1 => ID_EX_Data1, FwdData2 => ID_EX_Data2
        );

    -------------
    -- EXECUTE --
    -------------
    exStage : entity work.ExecuteStage
        port map(
            CLK => CLK, RST => RST,

            FunctI => ID_Funct,
            Stall => MEM_Stall,
            AuxI => ID_Aux,
            SrcData1I => ID_EX_Data1, SrcData2I => ID_EX_Data2,
            ImmI => ID_Imm,
            SelSrc2I => ID_SelSrc2,
            DestWrEnI => ID_DestWrEn, DestRegNoI => ID_DestRegNo,
            MemAccessI => ID_EX_MemAccess, MemWrEnI => ID_EX_MemWrEn,
            PCNextI => ID_EX_PCNext,
            JumpI => ID_EX_Jump, JumpRelI => ID_EX_JumpRel, JumpTargetI => ID_EX_JumpTarget,
            ClearI => EX_JumpO,
            Set7SegI => ID_EX_Set7Seg,
            ThreadTagI => ID_ThreadTag,
            SetThreadTagI => ID_EX_SetThreadTag,
            SpawnThreadI => ID_EX_SpawnThread,

            FunctO => EX_Funct,
            AuxO => EX_Aux,
            SrcData1O => EX_SrcData1, SrcData2O => EX_SrcData2,
            ImmO => EX_Imm,
            SelSrc2O => EX_SelSrc2,
            DestWrEnO => EX_DestWrEn, DestRegNoO => EX_DestRegNo,
            MemAccessO => EX_MemAccess, MemWrEnO => EX_MemWrEn,
            PCNextO => EX_PCNext,
            JumpO => EX_Jump, JumpRelO => EX_JumpRel, JumpTargetO => EX_JumpTarget,
            ClearO => EX_Clear,
            Set7SegO => EX_Set7Seg,
            ThreadTagO => EX_ThreadTag,
            SetThreadTagO => EX_SetThreadTag,
            SpawnThreadO => EX_SpawnThread
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
            FunctI => EX_Funct, Aux => EX_Aux,
            DestWrEnI => EX_DestWrEn, DestRegNoI => EX_DestRegNo,
            MemAccessI => EX_MemAccess, MemWrEn => EX_MemWrEn,
            PCNext => EX_PCNext,
            JumpI => EX_Jump, JumpRelI => EX_JumpRel, JumpTargetI => EX_JumpTarget,
            Clear => EX_Clear,
            ThreadTag => EX_ThreadTag,
            SetThreadTag => EX_SetThreadTag,
            SpawnThreadI => EX_SpawnThread,

            X => EX_DestData,
            FunctO => EX_MEM_Funct,
            DestWrEnO => EX_MEM_DestWrEn, DestRegNoO => EX_MEM_DestRegNo,
            JumpO => EX_JumpO, JumpTargetO => EX_IF_JumpTarget,
            MemWrData => EX_MEM_WrData, MemAccessO => EX_MEM_MemAccess, MemByteEna => EX_MEM_ByteEna,
            SpawnThreadO => EX_IF_SpawnThread, SpawnTargetO => EX_IF_SpawnTarget
        );

    -- EX_IF_Jump <= EX_JumpO;
    -- EX_IF_MemAccess <= EX_MEM_MemAccess;

    -- EX_ID_Jump <= EX_JumpO;

    seven_seg : entity work.SevenSeg
        port map(
            CLK => CLK, RST => RST,

            Set => EX_Set7Seg,
            V => EX_SrcData1,

            Pmod => SevenSeg
        );

    --
    -- MEM
    --
    memStage : entity work.MemStage
        port map(
            CLK => CLK, RST => RST,

            StallI => MEM_Stall,
            FunctI => EX_MEM_Funct,
            ThreadTagI => EX_ThreadTag,
            DestWrEnI => EX_MEM_DestWrEn, DestRegNoI => EX_MEM_DestRegNo, DestDataI => EX_DestData,
            MemWrData => EX_MEM_WrData, MemAccessI => EX_MEM_MemAccess, MemByteEna => EX_MEM_ByteEna,
            RamRdData => MEM_RamRdData,
            RamBusy => MEM_RamBusy,

            DestWrEnO => MEM_DestWrEn, DestRegNoO => MEM_DestRegNo, DestDataO => MEM_DestData,
            MemAccessO => MEM_MemAccess, MemRdData => MEM_MemData,
            RamReadEn => MEM_RamReadEn, RamWriteEn => MEM_RamWriteEn, RamByteEna => MEM_RamByteEna,
            RamAddress => MEM_RamAddress, RamWrData => MEM_RamWrData,
            FunctO => MEM_Funct,
            StallO => MEM_Stall,
            ThreadTagO => MEM_ID_ThreadTag
        );

    mem : entity work.Mem
        port map(
            CLK => CLK, RST => RST,

            RamReadEn => MEM_RamReadEn,
            RamWriteEn => MEM_RamWriteEn,
            RamByteEna => MEM_RamByteEna,
            RamAddress => MEM_RamAddress,
            RamWrData => MEM_RamWrData,

            RamRdData => MEM_RamRdData,
            RamBusy => MEM_RamBusy
        );

    memMux : entity work.MemMux
        port map(
            ALUDataIn => MEM_DestData,
            MemDataIn => MEM_MemData,
            Sel => MEM_MemAccess,
            FunctI => MEM_Funct,
            ROMDataIn => IF_MEM_ROMDataIn,

            WrData => MEM_ID_WrData
        );
end Behavioral;
