library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Mem is
    port (
        CLK, RST : in std_logic;
        RamReadEn : in std_logic;
        RamWriteEn : in std_logic;
        RamByteEna : in std_logic_vector (3 downto 0);
        RamAddress : in std_logic_vector (31 downto 0);
        RamWrData : in std_logic_vector (31 downto 0);

        RamRdData : out std_logic_vector (31 downto 0);
        RamBusy : out std_logic
    );
end entity Mem;

architecture rtl of Mem is
    signal AXI_awaddr : std_logic_vector (31 downto 0);
    signal AXI_awprot : std_logic_vector (2 downto 0);
    signal AXI_awvalid : std_logic;
    signal AXI_wdata : std_logic_vector (31 downto 0);
    signal AXI_wstrb : std_logic_vector (3 downto 0);
    signal AXI_wvalid : std_logic;
    signal AXI_bready : std_logic;
    signal AXI_araddr : std_logic_vector (31 downto 0);
    signal AXI_arprot : std_logic_vector (2 downto 0);
    signal AXI_arvalid : std_logic;
    signal AXI_rready : std_logic;
    signal AXI_awready : std_logic;
    signal AXI_wready : std_logic;
    signal AXI_bresp : std_logic_vector (1 downto 0);
    signal AXI_bvalid : std_logic;
    signal AXI_arready : std_logic;
    signal AXI_rdata : std_logic_vector (31 downto 0);
    signal AXI_rresp : std_logic_vector (1 downto 0);
    signal AXI_rvalid : std_logic;
    signal BRAM_PortA_Addr : std_logic_vector (14 downto 0);
    signal BRAM_PortA_CLK : std_logic;
    signal BRAM_PortA_En : std_logic;
    signal BRAM_PortA_DOut : std_logic_vector (31 downto 0);
    signal BRAM_PortA_RST : std_logic;
    signal BRAM_PortA_We : std_logic_vector (3 downto 0);
    signal BRAM_PortA_DIn : std_logic_vector (31 downto 0);
begin

    axi : entity work.AXI_Mem_Interface
        port map(
            M_AXI_aclk => CLK, M_AXI_aresetn => RST,

            ReadEn => RamReadEn,
            WriteEn => RamWriteEn,
            WrByteEna => RamByteEna,
            Address => RamAddress,
            DataIn => RamWrData,

            DataOut => RamRdData,
            busy => RamBusy,

            M_AXI_awready => AXI_awready,
            M_AXI_wready => AXI_wready,
            M_AXI_bresp => AXI_bresp,
            M_AXI_bvalid => AXI_bvalid,
            M_AXI_arready => AXI_arready,
            M_AXI_rdata => AXI_rdata,
            M_AXI_rresp => AXI_rresp,
            M_AXI_rvalid => AXI_rvalid,

            M_AXI_awaddr => AXI_awaddr,
            M_AXI_awprot => AXI_awprot,
            M_AXI_awvalid => AXI_awvalid,
            M_AXI_wdata => AXI_wdata,
            M_AXI_wstrb => AXI_wstrb,
            M_AXI_wvalid => AXI_wvalid,
            M_AXI_bready => AXI_bready,
            M_AXI_araddr => AXI_araddr,
            M_AXI_arprot => AXI_arprot,
            M_AXI_arvalid => AXI_arvalid,
            M_AXI_rready => AXI_rready
        );

    ram : entity work.ram
        port map(
            s_axi_aclk => CLK, s_axi_aresetn => RST,

            s_axi_awaddr => AXI_awaddr(14 downto 0),
            s_axi_awprot => AXI_awprot,
            s_axi_awvalid => AXI_awvalid,
            s_axi_wdata => AXI_wdata,
            s_axi_wstrb => AXI_wstrb,
            s_axi_wvalid => AXI_wvalid,
            s_axi_bready => AXI_bready,
            s_axi_araddr => AXI_araddr(14 downto 0),
            s_axi_arprot => AXI_arprot,
            s_axi_arvalid => AXI_arvalid,
            s_axi_rready => AXI_rready,

            s_axi_awready => AXI_awready,
            s_axi_wready => AXI_wready,
            s_axi_bresp => AXI_bresp,
            s_axi_bvalid => AXI_bvalid,
            s_axi_arready => AXI_arready,
            s_axi_rdata => AXI_rdata,
            s_axi_rresp => AXI_rresp,
            s_axi_rvalid => AXI_rvalid,

            bram_addr_a => BRAM_PortA_Addr,
            bram_clk_a => BRAM_PortA_CLK,
            bram_en_a => BRAM_PortA_En,
            bram_rddata_a => BRAM_PortA_DOut,
            bram_rst_a => BRAM_PortA_RST,
            bram_we_a => BRAM_PortA_We,
            bram_wrdata_a => BRAM_PortA_DIn
        );

    memory : entity work.memory
        port map(
            addra => x"0000" & b"0" & BRAM_PortA_Addr,
            clka => BRAM_PortA_CLK,
            dina => BRAM_PortA_DIn,
            douta => BRAM_PortA_DOut,
            ena => BRAM_PortA_En,
            rsta => BRAM_PortA_RST,
            wea => BRAM_PortA_We
        );

end architecture;
