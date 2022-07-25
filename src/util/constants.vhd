-- Include this package in your modules with: USE work.constants.all;

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

package constants is
    constant THREAD_COUNT : integer := 4;

    constant ROM_SIZE : std_logic_vector(31 downto 0) := std_logic_vector(resize(unsigned'(x"1000"), 32));

    constant opcode_LOAD : std_logic_vector(6 downto 0) := "0000011";
    constant opcode_MISC_MEM : std_logic_vector(6 downto 0) := "0001111";
    constant opcode_regimm : std_logic_vector(6 downto 0) := "0010011";
    constant opcode_OP_IMM : std_logic_vector(6 downto 0) := "0010011";
    constant opcode_AUIPC : std_logic_vector(6 downto 0) := "0010111";
    constant opcode_STORE : std_logic_vector(6 downto 0) := "0100011";
    constant opcode_regreg : std_logic_vector(6 downto 0) := "0110011";
    constant opcode_OP : std_logic_vector(6 downto 0) := "0110011";
    constant opcode_LUI : std_logic_vector(6 downto 0) := "0110111";
    constant opcode_BRANCH : std_logic_vector(6 downto 0) := "1100011";
    constant opcode_JALR : std_logic_vector(6 downto 0) := "1100111";
    constant opcode_JAL : std_logic_vector(6 downto 0) := "1101111";
    constant opcode_SYSTEM : std_logic_vector(6 downto 0) := "1110011";

    constant funct_BEQ : std_logic_vector(2 downto 0) := "000";
    constant funct_BNE : std_logic_vector(2 downto 0) := "001";
    constant funct_BLT : std_logic_vector(2 downto 0) := "100";
    constant funct_BGE : std_logic_vector(2 downto 0) := "101";
    constant funct_BLTU : std_logic_vector(2 downto 0) := "110";
    constant funct_BGEU : std_logic_vector(2 downto 0) := "111";

    constant funct_ADD : std_logic_vector(2 downto 0) := "000";
    constant funct_SLL : std_logic_vector(2 downto 0) := "001";
    constant funct_SLT : std_logic_vector(2 downto 0) := "010";
    constant funct_SLTU : std_logic_vector(2 downto 0) := "011";
    constant funct_XOR : std_logic_vector(2 downto 0) := "100";
    constant funct_SRL : std_logic_vector(2 downto 0) := "101";
    constant funct_OR : std_logic_vector(2 downto 0) := "110";
    constant funct_AND : std_logic_vector(2 downto 0) := "111";

    constant funct_SB : std_logic_vector(2 downto 0) := "000";
    constant funct_SH : std_logic_vector(2 downto 0) := "001";
    constant funct_SW : std_logic_vector(2 downto 0) := "010";

    constant funct_LB : std_logic_vector(2 downto 0) := "000";
    constant funct_LBU : std_logic_vector(2 downto 0) := "100";
    constant funct_LH : std_logic_vector(2 downto 0) := "001";
    constant funct_LHU : std_logic_vector(2 downto 0) := "101";
    constant funct_LW : std_logic_vector(2 downto 0) := "010";

    constant funct_CSRW : std_logic_vector(2 downto 0) := "001";
    constant funct_CSRR : std_logic_vector(2 downto 0) := "010";

    constant reg_zero : std_logic_vector(4 downto 0) := "00000";
    constant reg_ra : std_logic_vector(4 downto 0) := "00001";
    constant reg_sp : std_logic_vector(4 downto 0) := "00010";

    constant csr_SevenSeg : std_logic_vector(11 downto 0) := x"788";
    constant csr_SpawnThread : std_logic_vector(11 downto 0) := x"700";
    constant csr_ThreadID : std_logic_vector(11 downto 0) := x"71D";
end constants;
