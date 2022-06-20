----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 21.05.2022 03:58:44
-- Design Name:
-- Module Name: MasterAXILite - Behavioral
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
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AXI_Mem_Interface is
    port (
        ReadEn : in std_logic;
        WriteEn : in std_logic;
        WrByteEna : in std_logic_vector(3 downto 0);
        Address : in std_logic_vector(31 downto 0);
        DataIn : in std_logic_vector(31 downto 0);
        DataOut : out std_logic_vector(31 downto 0);
        -- busy='0' indicates that the module accepts requests
        busy : out std_logic;
        M_AXI_aclk, M_AXI_aresetn : in std_logic;

        M_AXI_awaddr : out std_logic_vector (31 downto 0);
        M_AXI_awprot : out std_logic_vector (2 downto 0);
        M_AXI_awvalid : out std_logic;
        M_AXI_awready : in std_logic;
        M_AXI_wdata : out std_logic_vector (31 downto 0);
        M_AXI_wstrb : out std_logic_vector (3 downto 0);
        M_AXI_wvalid : out std_logic;
        M_AXI_wready : in std_logic;
        M_AXI_bresp : in std_logic_vector (1 downto 0);
        M_AXI_bvalid : in std_logic;
        M_AXI_bready : out std_logic;
        M_AXI_araddr : out std_logic_vector (31 downto 0);
        M_AXI_arprot : out std_logic_vector (2 downto 0);
        M_AXI_arvalid : out std_logic;
        M_AXI_arready : in std_logic;
        M_AXI_rdata : in std_logic_vector (31 downto 0);
        M_AXI_rresp : in std_logic_vector (1 downto 0);
        M_AXI_rvalid : in std_logic;
        M_AXI_rready : out std_logic
        -- AXI3 signals
        --           ; M_AXI_awlen : out std_logic_vector (3 downto 0);
        --            M_AXI_awsize : out std_logic_vector (2 downto 0);
        --            M_AXI_awburst : out std_logic_vector(1 downto 0);
        --            M_AXI_awlock : out std_logic_vector (1 downto 0);
        --            M_AXI_awcache : out std_logic_vector (3 downto 0);
        --            M_AXI_awqos : out std_logic_vector (3 downto 0);
        --            M_AXI_wlast : out std_logic;
        --            M_AXI_arlen : out std_logic_vector (3 downto 0);
        --            M_AXI_arsize : out std_logic_vector (2 downto 0);
        --            M_AXI_arburst : out std_logic_vector (1 downto 0);
        --            M_AXI_arlock : out std_logic_vector (1 downto 0);
        --            M_AXI_arcache : out std_logic_vector (3 downto 0);
        --            M_AXI_arqos : out std_logic_vector (3 downto 0);
        --            M_AXI_rlast : in std_logic
    );
end AXI_Mem_Interface;

architecture Behavioral of AXI_Mem_Interface is

    type state_type is (Idle, WaitAWReady_WReady, WaitAWReady, WaitWReady, Write, WaitARReady, Read);
    signal state : state_type;

    signal ReadEnReceived, WriteEnReceived : std_logic;

begin

    -- set default AXI3 signals
    --M_AXI_awlen <= "0000";
    --M_AXI_arlen <= "0000";
    --M_AXI_awsize <= "000";
    --M_AXI_arsize <= "000";
    --M_AXI_awburst <= "00";
    --M_AXI_arburst <= "00";
    --M_AXI_awlock <= "00";
    --M_AXI_arlock <= "00";
    --M_AXI_awcache <= "0000";
    --M_AXI_arcache <= "0000";
    --M_AXI_awqos <= "0000";
    --M_AXI_arqos <= "0000";
    --M_AXI_wlast <= '1';

    M_AXI_awprot <= "000";
    M_AXI_arprot <= "000";

    process (M_AXI_aclk, M_AXI_aresetn, ReadEn, WriteEn)
    begin
        if M_AXI_aresetn = '0' then
            busy <= '0';
            ReadEnReceived <= '0';
            WriteEnReceived <= '0';
            state <= Idle;
            M_AXI_awvalid <= '0';
            M_AXI_wvalid <= '0';
            M_AXI_bready <= '0';
            M_AXI_arvalid <= '0';
            M_AXI_rready <= '0';
        elsif ReadEn = '1' and state = Idle then
            ReadEnReceived <= '1';
            busy <= '1';
        elsif WriteEn = '1' and state = Idle then
            WriteEnReceived <= '1';
            busy <= '1';
        elsif rising_edge(M_AXI_aclk) then
            case state is
                when Idle =>
                    if ReadEnReceived = '1' then
                        ReadEnReceived <= '0';
                        M_AXI_araddr <= Address;
                        M_AXI_arvalid <= '1'; -- araddr is valid
                        M_AXI_rready <= '1'; -- ready to receive data
                        state <= WaitARReady;
                    elsif WriteEnReceived = '1' then
                        WriteEnReceived <= '0';
                        M_AXI_awaddr <= Address;
                        M_AXI_awvalid <= '1'; -- indicate that awaddr is valid
                        M_AXI_wdata <= DataIn;
                        M_AXI_wstrb <= WrByteEna;
                        M_AXI_wvalid <= '1'; -- indicate that write data are valid
                        M_AXI_bready <= '1'; -- ready to receive response
                        state <= WaitAWReady_WReady;
                    end if;
                when WaitARReady =>
                    if M_AXI_arready = '1' then -- handshake successful
                        M_AXI_arvalid <= '0';
                        state <= Read;
                    end if;
                when Read =>
                    if M_AXI_rvalid = '1' then -- data received successfully
                        DataOut <= M_AXI_rdata;
                        M_AXI_rready <= '0';
                        busy <= '0'; -- indicate that read is complete
                        state <= Idle;
                    end if;
                when WaitAWReady_WReady =>
                    if M_AXI_awready = '1' and M_AXI_wready = '1' then -- slave read address and data successfully
                        M_AXI_awvalid <= '0';
                        M_AXI_wvalid <= '0';
                        state <= Write;
                    elsif M_AXI_awready = '1' and M_AXI_wready = '0' then
                        M_AXI_awvalid <= '0';
                        state <= WaitWReady;
                    elsif M_AXI_awready = '0' and M_AXI_wready = '1' then
                        M_AXI_wvalid <= '0';
                        state <= WaitAWReady;
                    end if;
                when WaitAWReady =>
                    if M_AXI_awready = '1' then
                        M_AXI_awvalid <= '0';
                        state <= Write;
                    end if;
                when WaitWReady =>
                    if M_AXI_wready = '1' then
                        M_AXI_wvalid <= '0';
                        state <= Write;
                    end if;
                when Write =>
                    if M_AXI_bvalid = '1' then
                        M_AXI_bready <= '0';
                        busy <= '0';
                        state <= Idle;
                    end if;
            end case;
        end if;
    end process;

end Behavioral;
