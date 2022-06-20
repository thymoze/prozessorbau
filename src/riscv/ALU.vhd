library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

use work.constants.all;

entity ALU is
    port (
        A : in std_logic_vector(31 downto 0);
        B : in std_logic_vector(31 downto 0);
        FunctI : in std_logic_vector (2 downto 0);
        Aux : in std_logic;
        PCNext : in std_logic_vector(31 downto 0);
        JumpI : in std_logic;
        JumpRelI : in std_logic;
        JumpTargetI : in std_logic_vector(31 downto 0);
        MemAccessI : in std_logic;
        MemWrEn : in std_logic;
        SrcData2 : in std_logic_vector(31 downto 0);
        DestRegNoI : in std_logic_vector(4 downto 0);
        DestWrEnI : in std_logic;
        Clear : in std_logic;

        FunctO : out std_logic_vector (2 downto 0);
        X : out std_logic_vector(31 downto 0);
        JumpO : out std_logic;
        JumpTargetO : out std_logic_vector(31 downto 0);
        DestRegNoO : out std_logic_vector(4 downto 0);
        DestWrEnO : out std_logic;
        MemAccessO : out std_logic;
        MemWrData : out std_logic_vector(31 downto 0);
        MemByteEna : out std_logic_vector(3 downto 0)
    );
end ALU;

architecture Behavioral of ALU is

begin
    process (A, B, FunctI, Aux, PCNext, JumpI, JumpRelI, JumpTargetI, MemAccessI, MemWrEn, SrcData2, DestRegNoI, DestWrEnI, Clear)
        variable result : std_logic_vector(31 downto 0);
        variable branch_cond : boolean;
    begin
        case FunctI is
            when funct_ADD =>
                if Aux = '0' then
                    result := std_logic_vector(unsigned(A) + unsigned(B));
                else
                    result := std_logic_vector(unsigned(A) - unsigned(B));
                end if;

            when funct_SLL => result := std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));

            when funct_SLT =>
                if signed(A) < signed(B) then
                    result := x"00000001";
                else
                    result := x"00000000";
                end if;

            when funct_SLTU =>
                if unsigned(A) < unsigned(B) then
                    result := x"00000001";
                else
                    result := x"00000000";
                end if;

            when funct_XOR => result := A xor B;

            when funct_SRL =>
                if Aux = '0' then
                    result := std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
                else
                    result := std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(4 downto 0)))));
                end if;

            when funct_OR => result := A or B;

            when funct_AND => result := A and B;

            when others => result := x"40400404";
        end case;

        case FunctI is
            when funct_BEQ => branch_cond := A = B;
            when funct_BNE => branch_cond := A /= B;

            when funct_BLT => branch_cond := signed(A) < signed(B);
            when funct_BLTU => branch_cond := unsigned(A) < unsigned(B);

            when funct_BGE => branch_cond := signed(A) >= signed(B);
            when funct_BGEU => branch_cond := unsigned(A) >= unsigned(B);

            when others => branch_cond := false;
        end case;

        MemAccessO <= MemAccessI;
        if MemAccessI = '1' then
            result := std_logic_vector(unsigned(A) + unsigned(B));

            if MemWrEn = '1' then
                case FunctI is
                    when funct_SB =>
                        MemWrData <= SrcData2(7 downto 0) & SrcData2(7 downto 0) & SrcData2(7 downto 0) & SrcData2(7 downto 0);
                        MemByteEna <= std_logic_vector(shift_left(unsigned'("0001"), to_integer(unsigned(result(1 downto 0)))));

                    when funct_SH =>
                        MemWrData <= SrcData2(15 downto 0) & SrcData2(15 downto 0);
                        MemByteEna <= std_logic_vector(shift_left(unsigned'("0011"), to_integer(unsigned(result(1 downto 0)))));

                    when funct_SW =>
                        MemWrData <= SrcData2;
                        MemByteEna <= "1111";

                    when others => null;
                end case;
            else
                MemByteEna <= "0000";
            end if;
        end if;

        X <= result;

        JumpO <= JumpI;
        JumpTargetO <= JumpTargetI;
        if JumpI = '1' then
            -- unconditional jump
            X <= PCNext;
            if JumpRelI = '0' then
                JumpTargetO <= result;
            end if;
        else
            -- conditional jump / branch
            if JumpRelI = '1' then
                if branch_cond then
                    JumpO <= '1';
                else
                    JumpO <= '0';
                end if;
            end if;
        end if;

        DestRegNoO <= DestRegNoI;
        DestWrEnO <= DestWrEnI;

        FunctO <= FunctI;

        if Clear = '1' then
            MemAccessO <= '0';
            MemByteEna <= "0000";
            DestWrEnO <= '0';
            JumpO <= '0';
        end if;
    end process;
end Behavioral;
