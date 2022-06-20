library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.constants.all;

entity Decode is
    port (
        Inst : in std_logic_vector (31 downto 0);
        PC : in std_logic_vector (31 downto 0);
        Clear : in std_logic;
        --InterlockI : in STD_LOGIC;

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
        Aux <= Inst(30);
        SrcRegNo1 <= Inst(19 downto 15);
        SrcRegNo2 <= Inst(24 downto 20);
        Imm <= std_logic_vector(resize(signed(Inst(31 downto 20)), 32));
        SelSrc2 <= Inst(5);
        DestRegNo <= Inst(11 downto 7);
        DestWrEn <= '0';
        Jump <= '0';
        JumpRel <= '0';
        MemAccess <= '0';
        MemWrEn <= '0';

        case opcode is
            when opcode_OP =>
                DestWrEn <= '1';

            when opcode_OP_IMM =>
                if funct3 = funct_ADD then
                    Aux <= '0';
                end if;
                DestWrEn <= '1';

            when opcode_LUI =>
                Funct <= "000";
                DestWrEn <= '1';
                SrcRegNo1 <= "00000";
                SrcRegNo2 <= "00000";
                SelSrc2 <= '0';
                Aux <= '0';
                Imm <= std_logic_vector(Inst(31 downto 12) & x"000");

            when opcode_AUIPC =>
                Funct <= "000";
                DestWrEn <= '1';
                SrcRegNo1 <= "00000";
                SrcRegNo2 <= "00000";
                SelSrc2 <= '0';
                Aux <= '0';
                Imm <= std_logic_vector(signed(PC) + signed(Inst(31 downto 12) & x"000"));

            when opcode_JAL =>
                Jump <= '1';
                JumpRel <= '1';
                JumpTarget <= std_logic_vector(signed(PC) + signed(Inst(31) & Inst(19 downto 12) & Inst(20) & Inst(30 downto 21) & "0"));
                PCNext <= std_logic_vector(signed(PC) + 4);
                DestWrEn <= '1';

            when opcode_JALR =>
                Jump <= '1';
                JumpRel <= '0';
                PCNext <= std_logic_vector(signed(PC) + 4);
                DestWrEn <= '1';

                SelSrc2 <= '0';
                Funct <= funct_ADD;
                Aux <= '0';
                Imm <= std_logic_vector(resize(signed(Inst(31 downto 20)), 32));

            when opcode_BRANCH =>
                Jump <= '0';
                JumpRel <= '1';
                JumpTarget <= std_logic_vector(signed(PC) + signed(Inst(31) & Inst(7) & Inst(30 downto 25) & Inst(11 downto 8) & "0"));

            when opcode_LOAD =>
                MemAccess <= '1';
                MemWrEn <= '0';
                DestWrEn <= '1';
                SelSrc2 <= '0';

            when opcode_STORE =>
                MemAccess <= '1';
                MemWrEn <= '1';
                Imm <= std_logic_vector(resize(signed(Inst(31 downto 25) & Inst(11 downto 7)), 32));
                DestWrEn <= '0';
                DestRegNo <= "00000";
                SelSrc2 <= '0';

            when others => null;
        end case;

        if Clear = '1' then
            DestWrEn <= '0';
            Jump <= '0';
            JumpRel <= '0';
        end if;
    end process;
end Behavioral;
