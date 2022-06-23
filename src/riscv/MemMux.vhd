library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.constants.all;

entity MemMux is
    port (
        ALUDataIn : in std_logic_vector (31 downto 0);
        MemDataIn : in std_logic_vector (31 downto 0);
        ROMDataIn : in std_logic_vector (31 downto 0);
        Sel : in std_logic;
        FunctI : in std_logic_vector (2 downto 0);

        WrData : out std_logic_vector (31 downto 0)
    );
end MemMux;

architecture Behavioral of MemMux is
begin
    process (Sel, ALUDataIn, MemDataIn, FunctI)
        variable dataIn : std_logic_vector(31 downto 0);
    begin
        if Sel = '0' then
            WrData <= ALUDataIn;
        else
            if ALUDataIn < x"1000" then
                dataIn := ROMDataIn;
            else
                dataIn := MemDataIn;
            end if;

            case FunctI is
                when funct_LW => WrData <= dataIn;

                when funct_LH =>
                    WrData <= std_logic_vector(resize(signed(shift_right(unsigned(dataIn), to_integer(unsigned(ALUDataIn(1 downto 0))) * 8)(15 downto 0)), 32));

                when funct_LB =>
                    WrData <= std_logic_vector(resize(signed(shift_right(unsigned(dataIn), to_integer(unsigned(ALUDataIn(1 downto 0))) * 8)(7 downto 0)), 32));

                when funct_LHU =>
                    WrData <= std_logic_vector(resize(unsigned(shift_right(unsigned(dataIn), to_integer(unsigned(ALUDataIn(1 downto 0))) * 8)(15 downto 0)), 32));

                when funct_LBU =>
                    WrData <= std_logic_vector(resize(unsigned(shift_right(unsigned(dataIn), to_integer(unsigned(ALUDataIn(1 downto 0))) * 8)(7 downto 0)), 32));

                when others => null;
            end case;
        end if;
    end process;
end Behavioral;
