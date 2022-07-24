library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.constants.all;
use work.types.all;

entity Decode is
    port (
        Inst : in std_logic_vector (31 downto 0);
        PC : in std_logic_vector (31 downto 0);
        Clear : in std_logic;
        InterlockI : in std_logic;

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
        SelSrc2 : out std_logic;
        Set7Seg : out std_logic
    );
end Decode;

architecture Behavioral of Decode is

    type r_type is record
        funct7 : std_logic_vector (6 downto 0);
        rs2 : register_t;
        rs1 : register_t;
        funct3 : std_logic_vector (2 downto 0);
        rd : register_t;
        opcode : opcode_t;
    end record;
    function parse_r_type (Inst : std_logic_vector (31 downto 0)) return r_type is
    begin
        return (
        funct7 => Inst(31 downto 25),
        rs2 => Inst(24 downto 20),
        rs1 => Inst(19 downto 15),
        funct3 => Inst(14 downto 12),
        rd => Inst(11 downto 7),
        opcode => Inst(6 downto 0)
        );
    end;

    type i_type is record
        imm : std_logic_vector (11 downto 0);
        rs1 : register_t;
        funct3 : std_logic_vector (2 downto 0);
        rd : register_t;
        opcode : opcode_t;
    end record;
    function parse_i_type (Inst : std_logic_vector (31 downto 0)) return i_type is
    begin
        return (
        imm => Inst(31 downto 20),
        rs1 => Inst(19 downto 15),
        funct3 => Inst(14 downto 12),
        rd => Inst(11 downto 7),
        opcode => Inst(6 downto 0)
        );
    end;

    type s_type is record
        imm : std_logic_vector (11 downto 0);
        rs2 : register_t;
        rs1 : register_t;
        funct3 : std_logic_vector (2 downto 0);
        opcode : opcode_t;
    end record;
    function parse_s_type (Inst : std_logic_vector (31 downto 0)) return s_type is
    begin
        return (
        imm => Inst(31 downto 25) & Inst(11 downto 7),
        rs2 => Inst(24 downto 20),
        rs1 => Inst(19 downto 15),
        funct3 => Inst(14 downto 12),
        opcode => Inst(6 downto 0)
        );
    end;

    type b_type is record
        imm : std_logic_vector (11 downto 0);
        rs2 : register_t;
        rs1 : register_t;
        funct3 : std_logic_vector (2 downto 0);
        opcode : opcode_t;
    end record;
    function parse_b_type (Inst : std_logic_vector (31 downto 0)) return b_type is
    begin
        return (
        imm => Inst(31) & Inst(7) & Inst(30 downto 25) & Inst(11 downto 8),
        rs2 => Inst(24 downto 20),
        rs1 => Inst(19 downto 15),
        funct3 => Inst(14 downto 12),
        opcode => Inst(6 downto 0)
        );
    end;

    type u_type is record
        imm : std_logic_vector (19 downto 0);
        rd : register_t;
        opcode : opcode_t;
    end record;
    function parse_u_type (Inst : std_logic_vector (31 downto 0)) return u_type is
    begin
        return (
        imm => Inst(31 downto 12),
        rd => Inst(11 downto 7),
        opcode => Inst(6 downto 0)
        );
    end;

    type j_type is record
        imm : std_logic_vector (19 downto 0);
        rd : register_t;
        opcode : opcode_t;
    end record;
    function parse_j_type (Inst : std_logic_vector (31 downto 0)) return j_type is
    begin
        return (
        imm => Inst(31) & Inst(19 downto 12) & Inst(20) & Inst(30 downto 21),
        rd => Inst(11 downto 7),
        opcode => Inst(6 downto 0)
        );
    end;

begin
    process (Inst, PC, Clear, InterlockI)
        variable decoded_r : r_type;
        variable decoded_i : i_type;
        variable decoded_s : s_type;
        variable decoded_b : b_type;
        variable decoded_u : u_type;
        variable decoded_j : j_type;

        variable opcode : opcode_t;
    begin
        opcode := Inst(6 downto 0);

        Funct <= (others => '0');
        SrcRegNo1 <= (others => '0');
        SrcRegNo2 <= (others => '0');
        DestWrEn <= '0';
        DestRegNo <= (others => '0');
        Aux <= '0';
        PCNext <= (others => '0');
        Jump <= '0';
        JumpRel <= '0';
        JumpTarget <= (others => '0');
        MemAccess <= '0';
        MemWrEn <= '0';
        InterlockO <= '0';
        Imm <= (others => '0');
        SelSrc2 <= '0';
        Set7Seg <= '0';

        case opcode is
            when opcode_OP =>
                decoded_r := parse_r_type(Inst);

                Aux <= decoded_r.funct7(5);
                Funct <= decoded_r.funct3;
                SrcRegNo1 <= decoded_r.rs1;
                SrcRegNo2 <= decoded_r.rs2;
                DestRegNo <= decoded_r.rd;
                DestWrEn <= '1';

            when opcode_OP_IMM =>
                decoded_i := parse_i_type(Inst);

                Imm <= std_logic_vector(resize(signed(decoded_i.imm), 32));
                SrcRegNo1 <= decoded_i.rs1;
                Funct <= decoded_i.funct3;
                DestRegNo <= decoded_i.rd;
                DestWrEn <= '1';

            when opcode_LUI =>
                decoded_u := parse_u_type(Inst);

                Imm <= std_logic_vector(decoded_u.imm & x"000");
                DestRegNo <= decoded_u.rd;
                DestWrEn <= '1';

            when opcode_AUIPC =>
                decoded_u := parse_u_type(Inst);

                Imm <= std_logic_vector(decoded_u.imm & x"000");
                DestRegNo <= decoded_u.rd;
                DestWrEn <= '1';

            when opcode_JAL =>
                decoded_j := parse_j_type(Inst);

                Jump <= '1';
                JumpRel <= '1';
                JumpTarget <= std_logic_vector(signed(PC) + signed(decoded_j.imm & "0"));
                PCNext <= std_logic_vector(signed(PC) + 4);
                DestRegNo <= decoded_j.rd;
                DestWrEn <= '1';

            when opcode_JALR =>
                decoded_i := parse_i_type(Inst);

                Jump <= '1';
                PCNext <= std_logic_vector(signed(PC) + 4);
                SrcRegNo1 <= decoded_i.rs1;
                Funct <= decoded_i.funct3;
                Imm <= std_logic_vector(resize(signed(decoded_i.imm), 32));
                DestRegNo <= decoded_i.rd;
                DestWrEn <= '1';

            when opcode_BRANCH =>
                decoded_b := parse_b_type(Inst);

                JumpRel <= '1';
                JumpTarget <= std_logic_vector(signed(PC) + signed(decoded_b.imm & "0"));
                SrcRegNo1 <= decoded_b.rs1;
                SrcRegNo2 <= decoded_b.rs2;
                SelSrc2 <= '1';
                Funct <= decoded_b.funct3;

            when opcode_LOAD =>
                decoded_i := parse_i_type(Inst);

                MemAccess <= '1';
                Funct <= decoded_i.funct3;
                Imm <= std_logic_vector(resize(signed(decoded_i.imm), 32));
                SrcRegNo1 <= decoded_i.rs1;
                DestRegNo <= decoded_i.rd;
                DestWrEn <= '1';
                InterlockO <= '1';

            when opcode_STORE =>
                decoded_s := parse_s_type(Inst);

                MemAccess <= '1';
                MemWrEn <= '1';
                Imm <= std_logic_vector(resize(signed(decoded_s.imm), 32));
                SrcRegNo1 <= decoded_s.rs1;
                SrcRegNo2 <= decoded_s.rs2;
                -- don't set SelSrc2, as the ALU handles this separately
                Funct <= decoded_s.funct3;

            when opcode_SYSTEM =>
                decoded_i := parse_i_type(Inst);

                SrcRegNo1 <= decoded_i.rs1;
                DestRegNo <= decoded_i.rd;
                DestWrEn <= '1';

                if decoded_i.funct3 = "001" and decoded_i.rd = "00000" and decoded_i.imm = x"788" then
                    Set7Seg <= '1';
                end if;

            when others => null;
        end case;

        if Clear = '1' or InterlockI = '1' then
            InterlockO <= '0';
            MemAccess <= '0';
            MemWrEn <= '0';
            DestWrEn <= '0';
            Jump <= '0';
            JumpRel <= '0';
        end if;
    end process;
end Behavioral;
