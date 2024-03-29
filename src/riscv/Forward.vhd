library IEEE;
use IEEE.std_logic_1164.all;
use work.types.all;

entity Forward is
    port (
        SrcRegNo1, SrcRegNo2 : in std_logic_vector(4 downto 0);
        SrcData1, SrcData2 : in std_logic_vector(31 downto 0);
        ThreadTag : in thread_tag_t;

        DestWrEn_EX : in std_logic;
        DestRegNo_EX : in std_logic_vector(4 downto 0);
        DestData_EX : in std_logic_vector(31 downto 0);
        ThreadTag_EX : in thread_tag_t;

        DestWrEn_MEM : in std_logic;
        DestRegNo_MEM : in std_logic_vector(4 downto 0);
        DestData_MEM : in std_logic_vector(31 downto 0);
        ThreadTag_MEM : in thread_tag_t;

        FwdData1, FwdData2 : out std_logic_vector(31 downto 0)
    );
end Forward;

architecture Behavioral of Forward is
begin
    process (
        SrcRegNo1, SrcRegNo2,
        SrcData1, SrcData2, ThreadTag,
        DestRegNo_EX, DestWrEn_EX, DestData_EX, ThreadTag_EX,
        DestRegNo_MEM, DestWrEn_MEM, DestData_MEM, ThreadTag_MEM)

    begin
        -- only forward if same thread wants to write to the same register:

        if ThreadTag = ThreadTag_EX and SrcRegNo1 /= "00000" and SrcRegNo1 = DestRegNo_EX and DestWrEn_EX = '1' then
            FwdData1 <= DestData_EX;
        elsif ThreadTag = ThreadTag_MEM and SrcRegNo1 /= "00000" and SrcRegNo1 = DestRegNo_MEM and DestWrEn_MEM = '1' then
            FwdData1 <= DestData_MEM;
        else
            FwdData1 <= SrcData1;
        end if;

        if ThreadTag = ThreadTag_EX and SrcRegNo2 /= "00000" and SrcRegNo2 = DestRegNo_EX and DestWrEn_EX = '1' then
            FwdData2 <= DestData_EX;
        elsif ThreadTag = ThreadTag_MEM and SrcRegNo2 /= "00000" and SrcRegNo2 = DestRegNo_MEM and DestWrEn_MEM = '1' then
            FwdData2 <= DestData_MEM;
        else
            FwdData2 <= SrcData2;
        end if;
    end process;
end Behavioral;
