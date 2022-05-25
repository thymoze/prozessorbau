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
    attribute mark_debug : string;

    signal inc_O : std_logic_vector (9 downto 0);
    signal imem_O : std_logic_vector (31 downto 0);

    signal funct : std_logic_vector (2 downto 0);
    signal imm : std_logic_vector (31 downto 0);
    signal aux : std_logic;

    signal destWrEn : std_logic;
    signal destRegNo : std_logic_vector (4 downto 0);

    signal srcRegNo1 : std_logic_vector (4 downto 0);
    signal srcRegNo2 : std_logic_vector (4 downto 0);
    signal selSrc : std_logic;

    signal aluX : std_logic_vector (31 downto 0);
    attribute mark_debug of aluX : signal is "true";
    signal wrEn : std_logic;
    attribute mark_debug of wrEn : signal is "true";
    signal wrRegNo : std_logic_vector (4 downto 0);
    attribute mark_debug of wrRegNo : signal is "true";

    signal regData1 : std_logic_vector (31 downto 0);
    attribute mark_debug of regData1 : signal is "true";
    signal regData2 : std_logic_vector (31 downto 0);
    signal dataSel : std_logic_vector (31 downto 0);
    attribute mark_debug of dataSel : signal is "true";

begin
    inc : entity work.Inc10Bit
        port map(
            CLK => CLK,
            RST => RST,
            O => inc_O
        );

    mux : entity work.MUX
        port map(
            L => imm,
            H => regData2,
            Sel => selSrc,
            O => dataSel
        );

    imem : entity work.imem_Task27
        port map(
            address => inc_O,
            Clock => CLK,
            q => imem_O
        );

    decode : entity work.Decode
        port map(
            Inst => imem_O,
            Funct => funct,
            Imm => imm,
            Aux => aux,
            DestWrEn => destWrEn,
            DestRegNo => destRegNo,
            SrcRegNo1 => srcRegNo1,
            SrcRegNo2 => srcRegNo2,
            SelSrc2 => selSrc
        );

    alu : entity work.ALU
        port map(
            A => regData1,
            B => dataSel,
            Funct => funct,
            Aux => aux,
            DestWrEnI => destWrEn,
            DestRegNoI => destRegNo,
            X => aluX,
            DestWrEnO => wrEn,
            DestRegNoO => wrRegNo
        );

    mem : entity work.MemStage
        port map(
            CLK => CLK;
            RST => RST;

            -- Inputs
            DestDataI => aluX;
            DestWrEnI => ;
            DestRegNoI => ;

            MemAccessI => ;
            MemWrData => ;
            MemByteEna => ;

            FunctI => ;
            StallI => ;

            -- Outputs
            DestDataO => memDestData;
            DestWrEnO => ;
            DestRegNoO => ;

            MemAccessO => ;
            MemRdData => ;

            FunctO => ;
            StallO =>
        );

    regset : entity work.RegisterSet
        port map(
            CLK => CLK,
            RST => RST,

            -- Inputs
            RdRegNo1 => srcRegNo1,
            RdRegNo2 => srcRegNo2,

            WrEn => wrEn,
            WrRegNo => wrRegNo,
            WrData => memDestData,

            -- Outputs
            RdData1 => regData1,
            RdData2 => regData2
        );
end Behavioral;
