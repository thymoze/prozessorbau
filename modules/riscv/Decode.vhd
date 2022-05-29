library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.constants.all;

entity Decode is
    port (
        Inst : in std_logic_vector (31 downto 0);
        --Clear : in STD_LOGIC;
        --InterlockI : in STD_LOGIC;
        --PC : in STD_LOGIC_VECTOR (31 downto 0);

        Funct : out std_logic_vector (2 downto 0);
        SrcRegNo1, SrcRegNo2 : out std_logic_vector (4 downto 0);
        DestWrEn : out std_logic;
        DestRegNo : out std_logic_vector (4 downto 0);
        Aux : out std_logic;
        PCNext : out std_logic_vector (31 downto 0);
        Jump : out std_logic;
        JumpRel : out std_logic;
        JumpTarget : out std_logic_vector (31 downto 0);
        MemAccess : out std_logic;
        MemWrEn : out std_logic;

        InterlockO : out std_logic;
        Imm : out std_logic_vector (31 downto 0);
        SelSrc2 : out std_logic
    );
end Decode;

architecture Behavioral of Decode is

begin
    process (Inst)
        variable opcode : std_logic_vector (6 downto 0);
        variable funct3 : std_logic_vector (2 downto 0);
    begin
        funct3 := Inst(14 downto 12);
        opcode := Inst(6 downto 0);

        Funct <= funct3;
        SrcRegNo1 <= Inst(19 downto 15);
        SrcRegNo2 <= Inst(24 downto 20);
        SelSrc2 <= Inst(5);

        Imm <= std_logic_vector(resize(signed(Inst(31 downto 20)), 32));

        if (opcode = opcode_OP or opcode = opcode_OP_IMM) then
            DestWrEn <= '1';
        else
            DestWrEn <= '0';
        end if;
        DestRegNo <= Inst(11 downto 7);

        Aux <= Inst(30);
        if (funct_ADD = funct3 and opcode = opcode_OP_IMM) then
            Aux <= '0';
        end if;
    end process;
end Behavioral;
