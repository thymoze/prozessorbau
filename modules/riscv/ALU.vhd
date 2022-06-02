library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

use work.constants.all;

entity ALU is
    port (
        A : in std_logic_vector(31 downto 0);
        B : in std_logic_vector(31 downto 0);
        Funct : in std_logic_vector (2 downto 0);
        Aux : in std_logic;
        PCNext : in std_logic_vector(31 downto 0);
        JumpI : in std_logic;
        JumpRelI : in std_logic;
        JumpTargetI : in std_logic_vector(31 downto 0);
        --MemAccessI: in std_logic;
        --SrcData2: in std_logic_vector(31 downto 0);
        DestRegNoI : in std_logic_vector(4 downto 0);
        DestWrEnI : in std_logic;
        --Clear: in std_logic;
        --Stall: in std_logic;

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
    process (Funct, A, B, Aux, DestRegNoI, DestWrEnI, JumpI, JumpTargetI, JumpRelI)
    begin
        case Funct is
            when funct_ADD =>
                if Aux = '0' then
                    X <= std_logic_vector(unsigned(A) + unsigned(B));
                else
                    X <= std_logic_vector(unsigned(A) - unsigned(B));
                end if;

            when funct_SLL => X <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
            when funct_SLT =>
                if signed(A) < signed(B) then
                    X <= x"00000001";
                else
                    X <= x"00000000";
                end if;
            when funct_SLTU =>
                if unsigned(A) < unsigned(B) then
                    X <= x"00000001";
                else
                    X <= x"00000000";
                end if;
            when funct_XOR => X <= A xor B;
            when funct_SRL =>
                if Aux = '0' then
                    X <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
                else
                    X <= std_logic_vector(shift_right(signed(A), to_integer(unsigned(B(4 downto 0)))));
                end if;

            when funct_OR => X <= A or B;
            when funct_AND => X <= A and B;
            when others => X <= x"40400404";
        end case;

        if JumpI = '1' then
            X <= PCNext;
        end if;

        DestRegNoO <= DestRegNoI;
        DestWrEnO <= DestWrEnI;
        JumpO <= JumpI;
        JumpTargetO <= JumpTargetI;
    end process;
end Behavioral;
