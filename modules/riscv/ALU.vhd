----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 05/05/2022 04:25:25 PM
-- Design Name:
-- Module Name: ALU - Behavioral
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port (
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        Funct: in std_logic_vector (2 downto 0);
        --Aux: in std_logic;
        --PCNext: in std_logic_vector(31 downto 0);
        --JumpI: in std_logic;
        --JumpRel: in std_logic;
        --JumpTargetI: in std_logic_vector(31 downto 0);
        --MemAccessI: in std_logic;
        --SrcData2: in std_logic_vector(31 downto 0);
        DestRegNoI: in std_logic_vector(4 downto 0);
        DestWrEnI: in std_logic;
        --Clear: in std_logic;
        --Stall: in std_logic;

        X: out std_logic_vector(31 downto 0);
        JumpO: out std_logic;
        JumpTargetO: out std_logic_vector(31 downto 0);
        DestRegNoO: out std_logic_vector(4 downto 0);
        DestWrEnO: out std_logic;
        MemAccessO: out std_logic;
        MemWrData: out std_logic_vector(31 downto 0);
        MemByteEna: out std_logic_vector(3 downto 0)
    );
end ALU;

architecture Behavioral of ALU is

begin
    process (Funct, A, B)
    begin
        case Funct is
            when funct_ADD => X <= std_logic_vector(unsigned(A) + unsigned(B));
            when funct_SLL => X <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
            when funct_SLT => if signed(A) < signed(B) then X <= x"00000001"; else X <= x"00000000"; end if;
            when funct_SLTU => if unsigned(A) < unsigned(B) then X <= x"00000001"; else X <= x"00000000"; end if;
            when funct_XOR => X <= A xor B;
            when funct_SRL => X <= std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(B(4 downto 0)))));
            when funct_OR => X <= A or B;
            when funct_AND => X <= A and B;
            when others => X <= x"40400404";
        end case;

        DestRegNoO <= DestRegNoI;
        DestWrEnO <= DestWrEnI;
    end process;
end Behavioral;
