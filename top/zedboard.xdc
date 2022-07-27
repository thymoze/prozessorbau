# ----------------------------------------------------------------------------
#     _____
#    / #   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET Design Resource Center
#      \======/         www.em.avnet.com/drc
#       \====/
# ----------------------------------------------------------------------------
#
#  Created With Avnet UCF Generator V0.4.0
#     Date: Saturday, June 30, 2012
#     Time: 12:18:55 AM
#
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#
#  Please direct any questions to:
#     ZedBoard.org Community Forums
#     http://www.zedboard.org
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2012 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------
#
#  Notes:
#
#  10 August 2012
#     IO standards based upon Bank 34 and Bank 35 Vcco supply options of 1.8V,
#     2.5V, or 3.3V are possible based upon the Vadj jumper (J18) settings.
#     By default, Vadj is expected to be set to 1.8V but if a different
#     voltage is used for a particular design, then the corresponding IO
#     standard within this UCF should also be updated to reflect the actual
#     Vadj jumper selection.
#
#  09 September 2012
#     Net names are not allowed to contain hyphen characters '-' since this
#     is not a legal VHDL87 or Verilog character within an identifier.
#     HDL net names are adjusted to contain no hyphen characters '-' but
#     rather use underscore '_' characters.  Comment net name with the hyphen
#     characters will remain in place since these are intended to match the
#     schematic net names in order to better enable schematic search.
#
#  17 April 2014
#     Pin constraint for toggle switch SW7 was corrected to M15 location.
#
#  16 April 2015
#     Corrected the way that entire banks are assigned to a particular IO
#     standard so that it works with more recent versions of Vivado Design
#     Suite and moved the IO standard constraints to the end of the file
#     along with some better organization and notes like we do with our SOMs.
#
#   6 June 2016
#     Corrected error in signal name for package pin N19 (FMC Expansion Connector)
#
#
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Audio Codec - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN AB1 [get_ports {AC_ADR0}];  # "AC-ADR0"
#set_property PACKAGE_PIN Y5  [get_ports {AC_ADR1}];  # "AC-ADR1"
#set_property PACKAGE_PIN Y8  [get_ports {SDATA_O}];  # "AC-GPIO0"
#set_property PACKAGE_PIN AA7 [get_ports {SDATA_I}];  # "AC-GPIO1"
#set_property PACKAGE_PIN AA6 [get_ports {BCLK_O}];  # "AC-GPIO2"
#set_property PACKAGE_PIN Y6  [get_ports {LRCLK_O}];  # "AC-GPIO3"
#set_property PACKAGE_PIN AB2 [get_ports {MCLK_O}];  # "AC-MCLK"
#set_property PACKAGE_PIN AB4 [get_ports {iic_rtl_scl_io}];  # "AC-SCK"
#set_property PACKAGE_PIN AB5 [get_ports {iic_rtl_sda_io}];  # "AC-SDA"

# ----------------------------------------------------------------------------
# Clock Source - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports GCLK]

# ----------------------------------------------------------------------------
# JA Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN Y11 [get_ports {JA[0]}]
set_property PACKAGE_PIN AA11 [get_ports {JA[1]}]
set_property PACKAGE_PIN Y10 [get_ports {JA[2]}]
set_property PACKAGE_PIN AA9 [get_ports {JA[3]}]
#set_property PACKAGE_PIN AB11 [get_ports {JA7 JA[4]}];  # "JA7"
#set_property PACKAGE_PIN AB10 [get_ports {JA8 JA[5]}];  # "JA8"
#set_property PACKAGE_PIN AB9  [get_ports {JA9 JA[6]}];  # "JA9"
#set_property PACKAGE_PIN AA8  [get_ports {JA10 JA[7]}]; # "JA10"


# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN W12 [get_ports {JB[0]}]
set_property PACKAGE_PIN W11 [get_ports {JB[1]}]
set_property PACKAGE_PIN V10 [get_ports {JB[2]}]
set_property PACKAGE_PIN W8 [get_ports {JB[3]}]
#set_property PACKAGE_PIN V12 [get_ports {JB7 JB[4]}];   # "JB7"
#set_property PACKAGE_PIN W10 [get_ports {JB8 JB[5]}];   # "JB8"
#set_property PACKAGE_PIN V9 [get_ports  {JB9 JB[6]}];   # "JB9"
#set_property PACKAGE_PIN V8 [get_ports  {JB10 JB[7]}];  # "JB10"

# ----------------------------------------------------------------------------
# JC Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN AB7 [get_ports {JC[0]}]
set_property PACKAGE_PIN AB6 [get_ports {JC[1]}]
set_property PACKAGE_PIN Y4 [get_ports {JC[2]}]
set_property PACKAGE_PIN AA4 [get_ports {JC[3]}]
#set_property PACKAGE_PIN R6  [get_ports {JC3_P JC[4]}];  # "JC3_P"
#set_property PACKAGE_PIN T6  [get_ports {JC3_N JC[5]}];  # "JC3_N"
#set_property PACKAGE_PIN T4  [get_ports {JC4_P JC[6]}];  # "JC4_P"
#set_property PACKAGE_PIN U4  [get_ports {JC4_N JC[7]}];  # "JC4_N"


# ----------------------------------------------------------------------------
# JD Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN V7 [get_ports {JD[0]}]
set_property PACKAGE_PIN W7 [get_ports {JD[1]}]
set_property PACKAGE_PIN V5 [get_ports {JD[2]}]
set_property PACKAGE_PIN V4 [get_ports {JD[3]}]
#set_property PACKAGE_PIN W6 [get_ports {JD3_P JD[4]}];  # "JD3_P"
#set_property PACKAGE_PIN W5 [get_ports {JD3_N JD[5]}];  # "JD3_N"
#set_property PACKAGE_PIN U6 [get_ports {JD4_P JD[6]}];  # "JD4_P"
#set_property PACKAGE_PIN U5 [get_ports {JD4_N JD[7]}];  # "JD4_N"

# ----------------------------------------------------------------------------
# OLED Display - Bank 13
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN U10  [get_ports {OLED_DC}];  # "OLED-DC"
#set_property PACKAGE_PIN U9   [get_ports {OLED_RES}];  # "OLED-RES"
#set_property PACKAGE_PIN AB12 [get_ports {OLED_SCLK}];  # "OLED-SCLK"
#set_property PACKAGE_PIN AA12 [get_ports {OLED_SDIN}];  # "OLED-SDIN"
#set_property PACKAGE_PIN U11  [get_ports {OLED_VBAT}];  # "OLED-VBAT"
#set_property PACKAGE_PIN U12  [get_ports {OLED_VDD}];  # "OLED-VDD"

# ----------------------------------------------------------------------------
# HDMI Output - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN W18  [get_ports {HD_CLK}];   # "HD-CLK"
#set_property PACKAGE_PIN Y13  [get_ports {HD_D0}];    # "HD-D0"
#set_property PACKAGE_PIN AA13 [get_ports {HD_D1}];    # "HD-D1"
#set_property PACKAGE_PIN W13  [get_ports {HD_D10}];   # "HD-D10"
#set_property PACKAGE_PIN W15  [get_ports {HD_D11}];   # "HD-D11"
#set_property PACKAGE_PIN V15  [get_ports {HD_D12}];   # "HD-D12"
#set_property PACKAGE_PIN U17  [get_ports {HD_D13}];   # "HD-D13"
#set_property PACKAGE_PIN V14  [get_ports {HD_D14}];   # "HD-D14"
#set_property PACKAGE_PIN V13  [get_ports {HS_D15}];   # "HD-D15"
#set_property PACKAGE_PIN AA14 [get_ports {HD_D2}];    # "HD-D2"
#set_property PACKAGE_PIN Y14  [get_ports {HD_D3}];    # "HD-D3"
#set_property PACKAGE_PIN AB15 [get_ports {HD_D4}];    # "HD-D4"
#set_property PACKAGE_PIN AB16 [get_ports {HD_D5}];    # "HD-D5"
#set_property PACKAGE_PIN AA16 [get_ports {HD_D6}];    # "HD-D6"
#set_property PACKAGE_PIN AB17 [get_ports {HD_D7}];    # "HD-D7"
#set_property PACKAGE_PIN AA17 [get_ports {HD_D8}];    # "HD-D8"
#set_property PACKAGE_PIN Y15  [get_ports {HD_D9}];    # "HD-D9"
#set_property PACKAGE_PIN U16  [get_ports {HD_DE}];    # "HD-DE"
#set_property PACKAGE_PIN V17  [get_ports {HD_HSYNC}]; # "HD-HSYNC"
#set_property PACKAGE_PIN W16  [get_ports {HD_INT}];   # "HD-INT"
#set_property PACKAGE_PIN AA18 [get_ports {HD_SCL}];   # "HD-SCL"
#set_property PACKAGE_PIN Y16  [get_ports {HD_SDA}];   # "HD-SDA"
#set_property PACKAGE_PIN U15  [get_ports {HD_SPDIF}]; # "HD-SPDIF"
#set_property PACKAGE_PIN Y18  [get_ports {HD_SPDIFO}];# "HD-SPDIFO"
#set_property PACKAGE_PIN W17  [get_ports {HD_VSYNC}]; # "HD-VSYNC"

# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN T22 [get_ports LD0]
set_property PACKAGE_PIN T21 [get_ports LD1]
set_property PACKAGE_PIN U22 [get_ports LD2]
set_property PACKAGE_PIN U21 [get_ports LD3]
#set_property PACKAGE_PIN V22 [get_ports {LD4 LED[4]}];  # "LD4"
#set_property PACKAGE_PIN W22 [get_ports {LD5 LED[5]}];  # "LD5"
#set_property PACKAGE_PIN U19 [get_ports {LD6 LED[6]}];  # "LD6"
#set_property PACKAGE_PIN U14 [get_ports {LD7 LED[7]}];  # "LD7"

# ----------------------------------------------------------------------------
# VGA Output - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN Y21  [get_ports {VGA_B1}];  # "VGA-B1"
#set_property PACKAGE_PIN Y20  [get_ports {VGA_B2}];  # "VGA-B2"
#set_property PACKAGE_PIN AB20 [get_ports {VGA_B3}];  # "VGA-B3"
#set_property PACKAGE_PIN AB19 [get_ports {VGA_B4}];  # "VGA-B4"
#set_property PACKAGE_PIN AB22 [get_ports {VGA_G1}];  # "VGA-G1"
#set_property PACKAGE_PIN AA22 [get_ports {VGA_G2}];  # "VGA-G2"
#set_property PACKAGE_PIN AB21 [get_ports {VGA_G3}];  # "VGA-G3"
#set_property PACKAGE_PIN AA21 [get_ports {VGA_G4}];  # "VGA-G4"
#set_property PACKAGE_PIN AA19 [get_ports {VGA_HS}];  # "VGA-HS"
#set_property PACKAGE_PIN V20  [get_ports {VGA_R1}];  # "VGA-R1"
#set_property PACKAGE_PIN U20  [get_ports {VGA_R2}];  # "VGA-R2"
#set_property PACKAGE_PIN V19  [get_ports {VGA_R3}];  # "VGA-R3"
#set_property PACKAGE_PIN V18  [get_ports {VGA_R4}];  # "VGA-R4"
#set_property PACKAGE_PIN Y19  [get_ports {VGA_VS}];  # "VGA-VS"

# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN P16 [get_ports {BTNC}];  # "BTNC"
#set_property PACKAGE_PIN R16 [get_ports {BTND}];  # "BTND"
set_property PACKAGE_PIN N15 [get_ports {BTNL}];  # "BTNL"
set_property PACKAGE_PIN R18 [get_ports BTNR]
#set_property PACKAGE_PIN T18 [get_ports {BTNU}];  # "BTNU"

# ----------------------------------------------------------------------------
# USB OTG Reset - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN L16 [get_ports {OTG_VBUSOC}];  # "OTG-VBUSOC"

# ----------------------------------------------------------------------------
# XADC GIO - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN H15 [get_ports {XADC_GIO0}];  # "XADC-GIO0"
#set_property PACKAGE_PIN R15 [get_ports {XADC_GIO1}];  # "XADC-GIO1"
#set_property PACKAGE_PIN K15 [get_ports {XADC_GIO2}];  # "XADC-GIO2"
#set_property PACKAGE_PIN J15 [get_ports {XADC_GIO3}];  # "XADC-GIO3"

# ----------------------------------------------------------------------------
# Miscellaneous - Bank 34
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN K16 [get_ports {PUDC_B}];  # "PUDC_B"

## ----------------------------------------------------------------------------
## USB OTG Reset - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN G17 [get_ports {OTG_RESETN}];  # "OTG-RESETN"

## ----------------------------------------------------------------------------
## User DIP Switches - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN F22 [get_ports {SW0 SW[0]}];  # "SW0"
#set_property PACKAGE_PIN G22 [get_ports {SW1 SW[1]}];  # "SW1"
#set_property PACKAGE_PIN H22 [get_ports {SW2 SW[2]}];  # "SW2"
#set_property PACKAGE_PIN F21 [get_ports {SW3 SW[3]}];  # "SW3"
#set_property PACKAGE_PIN H19 [get_ports {SW4 SW[4]}];  # "SW4"
#set_property PACKAGE_PIN H18 [get_ports {SW5 SW[5]}];  # "SW5"
#set_property PACKAGE_PIN H17 [get_ports {SW6 SW[6]}];  # "SW6"
#set_property PACKAGE_PIN M15 [get_ports {SW7 SW[7]}];  # "SW7"

## ----------------------------------------------------------------------------
## XADC AD Channels - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN E16 [get_ports {AD0N_R}];  # "XADC-AD0N-R"
#set_property PACKAGE_PIN F16 [get_ports {AD0P_R}];  # "XADC-AD0P-R"
#set_property PACKAGE_PIN D17 [get_ports {AD8N_N}];  # "XADC-AD8N-R"
#set_property PACKAGE_PIN D16 [get_ports {AD8P_R}];  # "XADC-AD8P-R"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 13
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN R7 [get_ports {FMC_SCL}];  # "FMC-SCL"
#set_property PACKAGE_PIN U7 [get_ports {FMC_SDA}];  # "FMC-SDA"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 33
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN AB14 [get_ports {FMC_PRSNT}];  # "FMC-PRSNT"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 34
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN L19 [get_ports {FMC_CLK0_N}];  # "FMC-CLK0_N"
#set_property PACKAGE_PIN L18 [get_ports {FMC_CLK0_P}];  # "FMC-CLK0_P"
#set_property PACKAGE_PIN M20 [get_ports {FMC_LA00_CC_N}];  # "FMC-LA00_CC_N"
#set_property PACKAGE_PIN M19 [get_ports {FMC_LA00_CC_P}];  # "FMC-LA00_CC_P"
#set_property PACKAGE_PIN N20 [get_ports {FMC_LA01_CC_N}];  # "FMC-LA01_CC_N"
#set_property PACKAGE_PIN N19 [get_ports {FMC_LA01_CC_P}];  # "FMC-LA01_CC_P" - corrected 6/6/16 GE
#set_property PACKAGE_PIN P18 [get_ports {FMC_LA02_N}];  # "FMC-LA02_N"
#set_property PACKAGE_PIN P17 [get_ports {FMC_LA02_P}];  # "FMC-LA02_P"
#set_property PACKAGE_PIN P22 [get_ports {FMC_LA03_N}];  # "FMC-LA03_N"
#set_property PACKAGE_PIN N22 [get_ports {FMC_LA03_P}];  # "FMC-LA03_P"
#set_property PACKAGE_PIN M22 [get_ports {FMC_LA04_N}];  # "FMC-LA04_N"
#set_property PACKAGE_PIN M21 [get_ports {FMC_LA04_P}];  # "FMC-LA04_P"
#set_property PACKAGE_PIN K18 [get_ports {FMC_LA05_N}];  # "FMC-LA05_N"
#set_property PACKAGE_PIN J18 [get_ports {FMC_LA05_P}];  # "FMC-LA05_P"
#set_property PACKAGE_PIN L22 [get_ports {FMC_LA06_N}];  # "FMC-LA06_N"
#set_property PACKAGE_PIN L21 [get_ports {FMC_LA06_P}];  # "FMC-LA06_P"
#set_property PACKAGE_PIN T17 [get_ports {FMC_LA07_N}];  # "FMC-LA07_N"
#set_property PACKAGE_PIN T16 [get_ports {FMC_LA07_P}];  # "FMC-LA07_P"
#set_property PACKAGE_PIN J22 [get_ports {FMC_LA08_N}];  # "FMC-LA08_N"
#set_property PACKAGE_PIN J21 [get_ports {FMC_LA08_P}];  # "FMC-LA08_P"
#set_property PACKAGE_PIN R21 [get_ports {FMC_LA09_N}];  # "FMC-LA09_N"
#set_property PACKAGE_PIN R20 [get_ports {FMC_LA09_P}];  # "FMC-LA09_P"
#set_property PACKAGE_PIN T19 [get_ports {FMC_LA10_N}];  # "FMC-LA10_N"
#set_property PACKAGE_PIN R19 [get_ports {FMC_LA10_P}];  # "FMC-LA10_P"
#set_property PACKAGE_PIN N18 [get_ports {FMC_LA11_N}];  # "FMC-LA11_N"
#set_property PACKAGE_PIN N17 [get_ports {FMC_LA11_P}];  # "FMC-LA11_P"
#set_property PACKAGE_PIN P21 [get_ports {FMC_LA12_N}];  # "FMC-LA12_N"
#set_property PACKAGE_PIN P20 [get_ports {FMC_LA12_P}];  # "FMC-LA12_P"
#set_property PACKAGE_PIN M17 [get_ports {FMC_LA13_N}];  # "FMC-LA13_N"
#set_property PACKAGE_PIN L17 [get_ports {FMC_LA13_P}];  # "FMC-LA13_P"
#set_property PACKAGE_PIN K20 [get_ports {FMC_LA14_N}];  # "FMC-LA14_N"
#set_property PACKAGE_PIN K19 [get_ports {FMC_LA14_P}];  # "FMC-LA14_P"
#set_property PACKAGE_PIN J17 [get_ports {FMC_LA15_N}];  # "FMC-LA15_N"
#set_property PACKAGE_PIN J16 [get_ports {FMC_LA15_P}];  # "FMC-LA15_P"
#set_property PACKAGE_PIN K21 [get_ports {FMC_LA16_N}];  # "FMC-LA16_N"
#set_property PACKAGE_PIN J20 [get_ports {FMC_LA16_P}];  # "FMC-LA16_P"

## ----------------------------------------------------------------------------
## FMC Expansion Connector - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN C19 [get_ports {FMC_CLK1_N}];  # "FMC-CLK1_N"
#set_property PACKAGE_PIN D18 [get_ports {FMC_CLK1_P}];  # "FMC-CLK1_P"
#set_property PACKAGE_PIN B20 [get_ports {FMC_LA17_CC_N}];  # "FMC-LA17_CC_N"
#set_property PACKAGE_PIN B19 [get_ports {FMC_LA17_CC_P}];  # "FMC-LA17_CC_P"
#set_property PACKAGE_PIN C20 [get_ports {FMC_LA18_CC_N}];  # "FMC-LA18_CC_N"
#set_property PACKAGE_PIN D20 [get_ports {FMC_LA18_CC_P}];  # "FMC-LA18_CC_P"
#set_property PACKAGE_PIN G16 [get_ports {FMC_LA19_N}];  # "FMC-LA19_N"
#set_property PACKAGE_PIN G15 [get_ports {FMC_LA19_P}];  # "FMC-LA19_P"
#set_property PACKAGE_PIN G21 [get_ports {FMC_LA20_N}];  # "FMC-LA20_N"
#set_property PACKAGE_PIN G20 [get_ports {FMC_LA20_P}];  # "FMC-LA20_P"
#set_property PACKAGE_PIN E20 [get_ports {FMC_LA21_N}];  # "FMC-LA21_N"
#set_property PACKAGE_PIN E19 [get_ports {FMC_LA21_P}];  # "FMC-LA21_P"
#set_property PACKAGE_PIN F19 [get_ports {FMC_LA22_N}];  # "FMC-LA22_N"
#set_property PACKAGE_PIN G19 [get_ports {FMC_LA22_P}];  # "FMC-LA22_P"
#set_property PACKAGE_PIN D15 [get_ports {FMC_LA23_N}];  # "FMC-LA23_N"
#set_property PACKAGE_PIN E15 [get_ports {FMC_LA23_P}];  # "FMC-LA23_P"
#set_property PACKAGE_PIN A19 [get_ports {FMC_LA24_N}];  # "FMC-LA24_N"
#set_property PACKAGE_PIN A18 [get_ports {FMC_LA24_P}];  # "FMC-LA24_P"
#set_property PACKAGE_PIN C22 [get_ports {FMC_LA25_N}];  # "FMC-LA25_N"
#set_property PACKAGE_PIN D22 [get_ports {FMC_LA25_P}];  # "FMC-LA25_P"
#set_property PACKAGE_PIN E18 [get_ports {FMC_LA26_N}];  # "FMC-LA26_N"
#set_property PACKAGE_PIN F18 [get_ports {FMC_LA26_P}];  # "FMC-LA26_P"
#set_property PACKAGE_PIN D21 [get_ports {FMC_LA27_N}];  # "FMC-LA27_N"
#set_property PACKAGE_PIN E21 [get_ports {FMC_LA27_P}];  # "FMC-LA27_P"
#set_property PACKAGE_PIN A17 [get_ports {FMC_LA28_N}];  # "FMC-LA28_N"
#set_property PACKAGE_PIN A16 [get_ports {FMC_LA28_P}];  # "FMC-LA28_P"
#set_property PACKAGE_PIN C18 [get_ports {FMC_LA29_N}];  # "FMC-LA29_N"
#set_property PACKAGE_PIN C17 [get_ports {FMC_LA29_P}];  # "FMC-LA29_P"
#set_property PACKAGE_PIN B15 [get_ports {FMC_LA30_N}];  # "FMC-LA30_N"
#set_property PACKAGE_PIN C15 [get_ports {FMC_LA30_P}];  # "FMC-LA30_P"
#set_property PACKAGE_PIN B17 [get_ports {FMC_LA31_N}];  # "FMC-LA31_N"
#set_property PACKAGE_PIN B16 [get_ports {FMC_LA31_P}];  # "FMC-LA31_P"
#set_property PACKAGE_PIN A22 [get_ports {FMC_LA32_N}];  # "FMC-LA32_N"
#set_property PACKAGE_PIN A21 [get_ports {FMC_LA32_P}];  # "FMC-LA32_P"
#set_property PACKAGE_PIN B22 [get_ports {FMC_LA33_N}];  # "FMC-LA33_N"
#set_property PACKAGE_PIN B21 [get_ports {FMC_LA33_P}];  # "FMC-LA33_P"


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are
# evaluated prior to other PACKAGE_PIN constraints being applied, then
# the IOSTANDARD specified will likely not be applied properly to those
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed
# within the XDC file in a location that is evaluated AFTER all
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ----------------------------------------------------------------------------

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]

# Set the bank voltage for IO Bank 34 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 34]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 34]]

# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]];

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]


connect_debug_port u_ila_1/clk [get_nets [list dut/memMux/n_1_0_BUFG]]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_n_1_0_BUFG]

set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[3]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[0]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[1]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[2]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[4]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[5]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[6]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[7]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[25]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[26]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[27]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[28]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[29]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[30]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[31]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[17]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[18]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[19]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[20]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[21]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[22]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[23]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[24]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[8]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[9]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[10]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[11]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[12]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[13]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[14]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[15]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ID_PC[16]}]
set_property MARK_DEBUG true [get_nets dut/MEM_Stall]

set_property MARK_DEBUG true [get_nets {dut/ID_Inst[13]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[5]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[1]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[0]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[2]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[3]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[4]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[6]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[11]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[12]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[7]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[8]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[9]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[10]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[15]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[16]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[14]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[19]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[20]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[17]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[18]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[23]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[24]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[21]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[22]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[27]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[28]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[25]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[26]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[31]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[0]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[29]}]
set_property MARK_DEBUG true [get_nets {dut/ID_Inst[30]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[3]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[4]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[1]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[2]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[7]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[9]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[5]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[6]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[11]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[12]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[8]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[10]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[15]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[16]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[13]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[14]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[28]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[29]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[22]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[27]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[20]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[19]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[17]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[18]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[21]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[30]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[31]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[23]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[24]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[25]}]
set_property MARK_DEBUG true [get_nets {dut/ID_PC[26]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[13]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[5]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[1]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[0]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[2]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[3]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[4]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[6]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[11]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[12]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[7]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[8]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[9]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[10]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[15]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[16]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[14]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[19]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[20]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[17]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[18]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[23]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[24]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[21]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[22]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[27]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[28]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[25]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[26]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[31]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[29]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PCNext[30]}]

connect_debug_port u_ila_0/probe0 [get_nets [list {SevenSeg[B][0]} {SevenSeg[B][1]} {SevenSeg[B][2]} {SevenSeg[B][3]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {SevenSeg[D][0]} {SevenSeg[D][1]} {SevenSeg[D][2]} {SevenSeg[D][3]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {SevenSeg[A][0]} {SevenSeg[A][1]} {SevenSeg[A][2]} {SevenSeg[A][3]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {SevenSeg[C][0]} {SevenSeg[C][1]} {SevenSeg[C][2]} {SevenSeg[C][3]}]]
connect_debug_port u_ila_0/probe19 [get_nets [list BTNR_inv]]
set_property MARK_DEBUG true [get_nets dut/ID_Aux]


set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][11]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][15]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][15]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][11]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][15][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][14][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][15]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][11]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[1][1][10]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][14]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][2]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][0]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][12]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][1]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][3]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][18]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][16]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][19]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][17]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][15]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][11]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][13]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][21]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][26]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][28]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][29]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][27]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][22]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][25]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][20]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][23]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][30]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][31]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][4]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][5]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][6]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][7]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][24]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][8]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][9]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[1][10][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][11]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][1][15]}]
set_property MARK_DEBUG true [get_nets {dut/decode/SpawnThread[0]}]
set_property MARK_DEBUG true [get_nets {dut/decode/SpawnThread[1]}]
set_property MARK_DEBUG true [get_nets {dut/decode/ThreadTag[0]}]
set_property MARK_DEBUG true [get_nets {dut/decode/ThreadTag[1]}]

set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnThread[1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnThread[0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/SpawnTarget[15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/thread_pc_next[3][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/ThreadTagNext[1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/ThreadTagNext[0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[18]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[8]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[0]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[1]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[2]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[7]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[9]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[10]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[11]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[12]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[13]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[14]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[22]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[6]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[3]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[4]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[5]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[15]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[16]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[17]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[23]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[24]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[21]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[27]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[28]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[25]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[31]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[29]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[0]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[4]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[5]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[2]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[8]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[6]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[10]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[16]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[17]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[14]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[20]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[21]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[18]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[24]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[25]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[22]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[28]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[29]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[26]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[30]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[31]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[27]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[23]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[19]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[15]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[11]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[12]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[13]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[9]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[7]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[3]}]
set_property MARK_DEBUG true [get_nets {dut/decode/PC[1]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[30]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[26]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[18]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[19]}]
set_property MARK_DEBUG true [get_nets {dut/decode/Inst[20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][15]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][1][11]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][15]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][11]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[0][2][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][2]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][0]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][1]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][30]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][31]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][28]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][29]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][26]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][27]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][24]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][25]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][22]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][23]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][20]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][21]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][18]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][19]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][16]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][17]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][3]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][4]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][5]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][6]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][7]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][8]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][9]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][10]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][12]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][14]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][15]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][13]}]
set_property MARK_DEBUG true [get_nets {dut/regset/RegisterSets_reg[2][10][11]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][20]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][2]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][0]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][30]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][28]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][26]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][24]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][22]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][18]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][16]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][14]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][12]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][10]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][6]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][7]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][4]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][2]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][0]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][16]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][18]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][20]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][22]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][24]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][26]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][28]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][30]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][4]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][6]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][7]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][10]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][12]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][14]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][27]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][1]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][31]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][29]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][25]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][23]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][21]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][19]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][17]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][15]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][13]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][11]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][9]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][8]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][5]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][3]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][1]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][29]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][31]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][25]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][27]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][21]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][23]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][17]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][15][19]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][3]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][5]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][8]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][9]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][15]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][13]}]
set_property MARK_DEBUG false [get_nets {dut/regset/RegisterSets_reg[2][14][11]}]

set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[6]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[3]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[2]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[15]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[18]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[13]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[29]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[21]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[27]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[22]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[4]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[5]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[7]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[25]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[28]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[20]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[24]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[8]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[9]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[26]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[10]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[16]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[30]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[11]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[31]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[17]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[23]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[12]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[14]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData1[19]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[2]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[15]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[23]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[20]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[3]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[4]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[16]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[18]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[5]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[6]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[7]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[8]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[9]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[24]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[26]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[28]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[29]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[25]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[19]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[21]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[11]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[14]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[10]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[12]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[13]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[17]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[22]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[31]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[30]}]
set_property MARK_DEBUG true [get_nets {dut/EX_Imm[27]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[5]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[26]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[20]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[28]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[25]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[14]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[19]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[24]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[31]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[2]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[3]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[18]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[4]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[6]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[11]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[12]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[17]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[29]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[13]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[7]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[8]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[15]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[21]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[22]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[23]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[16]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[27]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[9]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[10]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SrcData2[30]}]
set_property MARK_DEBUG true [get_nets dut/EX_SelSrc2]
set_property MARK_DEBUG true [get_nets dut/EX_SetThreadTag]
set_property MARK_DEBUG true [get_nets {dut/EX_SpawnThread[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_SpawnThread[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_ThreadTag[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_ThreadTag[1]}]

set_property MARK_DEBUG true [get_nets {dut/IF_PC[7]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[4]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[0]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[1]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[2]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[3]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[5]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[6]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[8]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[11]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[13]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[15]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[17]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[19]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[21]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[23]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[25]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[27]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[29]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[31]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[30]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[28]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[26]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[24]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[22]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[20]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[18]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[16]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[14]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[12]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[9]}]
set_property MARK_DEBUG true [get_nets {dut/IF_PC[10]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[23]}]
set_property MARK_DEBUG true [get_nets {dut/EX_JumpO[ThreadTag][0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[17]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[19]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[21]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[25]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[27]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[29]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[31]}]
set_property MARK_DEBUG true [get_nets {dut/ID_IF_Interlock[ThreadTag][1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_JumpO[Value]}]
set_property MARK_DEBUG true [get_nets dut/BTNR_inv]
set_property MARK_DEBUG true [get_nets {dut/IF_ThreadTag[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[26]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[24]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[2]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[4]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[30]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[28]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[18]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[16]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[22]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[20]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[10]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[7]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[2]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[12]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[14]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[6]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[4]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[6]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[7]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[14]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[12]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[10]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[22]}]
set_property MARK_DEBUG true [get_nets {dut/EX_JumpO[ThreadTag][1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[16]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[18]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[20]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[24]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[26]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[28]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[30]}]
set_property MARK_DEBUG true [get_nets {dut/ID_IF_Interlock[ThreadTag][0]}]
set_property MARK_DEBUG true [get_nets {dut/ID_IF_Interlock[Value]}]
set_property MARK_DEBUG true [get_nets {dut/IF_ThreadTag[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[27]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[3]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[5]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[25]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[31]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[29]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[19]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[17]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[23]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[21]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[11]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[8]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[3]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[13]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[15]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[1]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[9]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnTarget[5]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[8]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[15]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[13]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[9]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_JumpTarget[11]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnThread[0]}]
set_property MARK_DEBUG true [get_nets {dut/EX_IF_SpawnThread[1]}]
connect_debug_port u_ila_0/probe28 [get_nets [list {dut/EX_JumpO[Value]}]]
connect_debug_port u_ila_0/probe32 [get_nets [list {dut/ID_IF_Interlock[Value]}]]

set_property MARK_DEBUG false [get_nets dut/n_6_2]
set_property MARK_DEBUG false [get_nets dut/n_6_0]
set_property MARK_DEBUG false [get_nets dut/n_6_21]
set_property MARK_DEBUG false [get_nets dut/n_6_1]
set_property MARK_DEBUG false [get_nets dut/n_6_18]
set_property MARK_DEBUG false [get_nets dut/n_6_10]
set_property MARK_DEBUG false [get_nets dut/n_6_22]
set_property MARK_DEBUG false [get_nets dut/n_6_11]
set_property MARK_DEBUG false [get_nets dut/n_6_12]
set_property MARK_DEBUG false [get_nets dut/n_6_13]
set_property MARK_DEBUG false [get_nets dut/n_6_20]
set_property MARK_DEBUG false [get_nets dut/n_6_24]
set_property MARK_DEBUG false [get_nets dut/n_6_23]
set_property MARK_DEBUG false [get_nets dut/n_6_14]
set_property MARK_DEBUG false [get_nets dut/n_6_15]
set_property MARK_DEBUG false [get_nets dut/n_6_17]
set_property MARK_DEBUG false [get_nets dut/n_6_25]
set_property MARK_DEBUG false [get_nets dut/n_6_16]
set_property MARK_DEBUG false [get_nets dut/n_6_19]
set_property MARK_DEBUG false [get_nets dut/n_6_5]
set_property MARK_DEBUG false [get_nets dut/n_6_3]
set_property MARK_DEBUG false [get_nets dut/n_6_4]
set_property MARK_DEBUG false [get_nets dut/n_6_28]
set_property MARK_DEBUG false [get_nets dut/n_6_6]
set_property MARK_DEBUG false [get_nets dut/n_6_7]
set_property MARK_DEBUG false [get_nets dut/n_6_8]
set_property MARK_DEBUG false [get_nets dut/n_6_9]
set_property MARK_DEBUG false [get_nets dut/n_6_29]
set_property MARK_DEBUG false [get_nets dut/n_6_26]
set_property MARK_DEBUG false [get_nets dut/n_6_27]


connect_debug_port u_ila_0/probe0 [get_nets [list {dut/fetch/PCNext[0]} {dut/fetch/PCNext[1]} {dut/fetch/PCNext[12]} {dut/fetch/PCNext[13]} {dut/fetch/PCNext[14]} {dut/fetch/PCNext[15]} {dut/fetch/PCNext[16]} {dut/fetch/PCNext[17]} {dut/fetch/PCNext[18]} {dut/fetch/PCNext[19]} {dut/fetch/PCNext[20]} {dut/fetch/PCNext[21]} {dut/fetch/PCNext[22]} {dut/fetch/PCNext[23]} {dut/fetch/PCNext[24]} {dut/fetch/PCNext[25]} {dut/fetch/PCNext[26]} {dut/fetch/PCNext[27]} {dut/fetch/PCNext[28]} {dut/fetch/PCNext[29]} {dut/fetch/PCNext[30]} {dut/fetch/PCNext[31]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {dut/fetch/thread_tag_next_sig[0]} {dut/fetch/thread_tag_next_sig[1]}]]
connect_debug_port u_ila_0/probe4 [get_nets [list {dut/fetch/thread_pc_next_sig[0][0]} {dut/fetch/thread_pc_next_sig[0][1]} {dut/fetch/thread_pc_next_sig[0][2]} {dut/fetch/thread_pc_next_sig[0][3]} {dut/fetch/thread_pc_next_sig[0][4]} {dut/fetch/thread_pc_next_sig[0][5]} {dut/fetch/thread_pc_next_sig[0][6]} {dut/fetch/thread_pc_next_sig[0][7]} {dut/fetch/thread_pc_next_sig[0][8]} {dut/fetch/thread_pc_next_sig[0][9]} {dut/fetch/thread_pc_next_sig[0][10]} {dut/fetch/thread_pc_next_sig[0][11]} {dut/fetch/thread_pc_next_sig[0][12]} {dut/fetch/thread_pc_next_sig[0][13]} {dut/fetch/thread_pc_next_sig[0][14]} {dut/fetch/thread_pc_next_sig[0][15]} {dut/fetch/thread_pc_next_sig[0][16]} {dut/fetch/thread_pc_next_sig[0][17]} {dut/fetch/thread_pc_next_sig[0][18]} {dut/fetch/thread_pc_next_sig[0][19]} {dut/fetch/thread_pc_next_sig[0][20]} {dut/fetch/thread_pc_next_sig[0][21]} {dut/fetch/thread_pc_next_sig[0][22]} {dut/fetch/thread_pc_next_sig[0][23]} {dut/fetch/thread_pc_next_sig[0][24]} {dut/fetch/thread_pc_next_sig[0][25]} {dut/fetch/thread_pc_next_sig[0][26]} {dut/fetch/thread_pc_next_sig[0][27]} {dut/fetch/thread_pc_next_sig[0][28]} {dut/fetch/thread_pc_next_sig[0][29]} {dut/fetch/thread_pc_next_sig[0][30]} {dut/fetch/thread_pc_next_sig[0][31]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {dut/fetch/thread_pc_next_sig[1][0]} {dut/fetch/thread_pc_next_sig[1][1]} {dut/fetch/thread_pc_next_sig[1][2]} {dut/fetch/thread_pc_next_sig[1][3]} {dut/fetch/thread_pc_next_sig[1][4]} {dut/fetch/thread_pc_next_sig[1][5]} {dut/fetch/thread_pc_next_sig[1][6]} {dut/fetch/thread_pc_next_sig[1][7]} {dut/fetch/thread_pc_next_sig[1][8]} {dut/fetch/thread_pc_next_sig[1][9]} {dut/fetch/thread_pc_next_sig[1][10]} {dut/fetch/thread_pc_next_sig[1][11]} {dut/fetch/thread_pc_next_sig[1][12]} {dut/fetch/thread_pc_next_sig[1][13]} {dut/fetch/thread_pc_next_sig[1][14]} {dut/fetch/thread_pc_next_sig[1][15]} {dut/fetch/thread_pc_next_sig[1][16]} {dut/fetch/thread_pc_next_sig[1][17]} {dut/fetch/thread_pc_next_sig[1][18]} {dut/fetch/thread_pc_next_sig[1][19]} {dut/fetch/thread_pc_next_sig[1][20]} {dut/fetch/thread_pc_next_sig[1][21]} {dut/fetch/thread_pc_next_sig[1][22]} {dut/fetch/thread_pc_next_sig[1][23]} {dut/fetch/thread_pc_next_sig[1][24]} {dut/fetch/thread_pc_next_sig[1][25]} {dut/fetch/thread_pc_next_sig[1][26]} {dut/fetch/thread_pc_next_sig[1][27]} {dut/fetch/thread_pc_next_sig[1][28]} {dut/fetch/thread_pc_next_sig[1][29]} {dut/fetch/thread_pc_next_sig[1][30]} {dut/fetch/thread_pc_next_sig[1][31]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {dut/IF_PCNext[0]} {dut/IF_PCNext[1]} {dut/IF_PCNext[2]} {dut/IF_PCNext[3]} {dut/IF_PCNext[4]} {dut/IF_PCNext[5]} {dut/IF_PCNext[6]} {dut/IF_PCNext[7]} {dut/IF_PCNext[8]} {dut/IF_PCNext[9]} {dut/IF_PCNext[10]} {dut/IF_PCNext[11]} {dut/IF_PCNext[12]} {dut/IF_PCNext[13]} {dut/IF_PCNext[14]} {dut/IF_PCNext[15]} {dut/IF_PCNext[16]} {dut/IF_PCNext[17]} {dut/IF_PCNext[18]} {dut/IF_PCNext[19]} {dut/IF_PCNext[20]} {dut/IF_PCNext[21]} {dut/IF_PCNext[22]} {dut/IF_PCNext[23]} {dut/IF_PCNext[24]} {dut/IF_PCNext[25]} {dut/IF_PCNext[26]} {dut/IF_PCNext[27]} {dut/IF_PCNext[28]} {dut/IF_PCNext[29]} {dut/IF_PCNext[30]} {dut/IF_PCNext[31]}]]
connect_debug_port u_ila_0/probe27 [get_nets [list {dut/fetch/thread_pc_next_sig[3][0]} {dut/fetch/thread_pc_next_sig[3][1]} {dut/fetch/thread_pc_next_sig[3][2]} {dut/fetch/thread_pc_next_sig[3][3]} {dut/fetch/thread_pc_next_sig[3][4]} {dut/fetch/thread_pc_next_sig[3][5]} {dut/fetch/thread_pc_next_sig[3][6]} {dut/fetch/thread_pc_next_sig[3][7]} {dut/fetch/thread_pc_next_sig[3][8]} {dut/fetch/thread_pc_next_sig[3][9]} {dut/fetch/thread_pc_next_sig[3][10]} {dut/fetch/thread_pc_next_sig[3][11]} {dut/fetch/thread_pc_next_sig[3][12]} {dut/fetch/thread_pc_next_sig[3][13]} {dut/fetch/thread_pc_next_sig[3][14]} {dut/fetch/thread_pc_next_sig[3][15]} {dut/fetch/thread_pc_next_sig[3][16]} {dut/fetch/thread_pc_next_sig[3][17]} {dut/fetch/thread_pc_next_sig[3][18]} {dut/fetch/thread_pc_next_sig[3][19]} {dut/fetch/thread_pc_next_sig[3][20]} {dut/fetch/thread_pc_next_sig[3][21]} {dut/fetch/thread_pc_next_sig[3][22]} {dut/fetch/thread_pc_next_sig[3][23]} {dut/fetch/thread_pc_next_sig[3][24]} {dut/fetch/thread_pc_next_sig[3][25]} {dut/fetch/thread_pc_next_sig[3][26]} {dut/fetch/thread_pc_next_sig[3][27]} {dut/fetch/thread_pc_next_sig[3][28]} {dut/fetch/thread_pc_next_sig[3][29]} {dut/fetch/thread_pc_next_sig[3][30]} {dut/fetch/thread_pc_next_sig[3][31]}]]
connect_debug_port u_ila_0/probe31 [get_nets [list {dut/fetch/thread_pc_next_sig[2][0]} {dut/fetch/thread_pc_next_sig[2][1]} {dut/fetch/thread_pc_next_sig[2][2]} {dut/fetch/thread_pc_next_sig[2][3]} {dut/fetch/thread_pc_next_sig[2][4]} {dut/fetch/thread_pc_next_sig[2][5]} {dut/fetch/thread_pc_next_sig[2][6]} {dut/fetch/thread_pc_next_sig[2][7]} {dut/fetch/thread_pc_next_sig[2][8]} {dut/fetch/thread_pc_next_sig[2][9]} {dut/fetch/thread_pc_next_sig[2][10]} {dut/fetch/thread_pc_next_sig[2][11]} {dut/fetch/thread_pc_next_sig[2][12]} {dut/fetch/thread_pc_next_sig[2][13]} {dut/fetch/thread_pc_next_sig[2][14]} {dut/fetch/thread_pc_next_sig[2][15]} {dut/fetch/thread_pc_next_sig[2][16]} {dut/fetch/thread_pc_next_sig[2][17]} {dut/fetch/thread_pc_next_sig[2][18]} {dut/fetch/thread_pc_next_sig[2][19]} {dut/fetch/thread_pc_next_sig[2][20]} {dut/fetch/thread_pc_next_sig[2][21]} {dut/fetch/thread_pc_next_sig[2][22]} {dut/fetch/thread_pc_next_sig[2][23]} {dut/fetch/thread_pc_next_sig[2][24]} {dut/fetch/thread_pc_next_sig[2][25]} {dut/fetch/thread_pc_next_sig[2][26]} {dut/fetch/thread_pc_next_sig[2][27]} {dut/fetch/thread_pc_next_sig[2][28]} {dut/fetch/thread_pc_next_sig[2][29]} {dut/fetch/thread_pc_next_sig[2][30]} {dut/fetch/thread_pc_next_sig[2][31]}]]

set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[2][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[1][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[3][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCI[0][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][17]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][19]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][11]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][23]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][31]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][10]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][6]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][30]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][26]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][28]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][22]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][27]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][25]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][16]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][0]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][9]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][13]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][3]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][14]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][4]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][29]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][8]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][15]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][24]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][18]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][21]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][7]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][5]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][12]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[2][1]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[0][20]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[3][2]}]
set_property MARK_DEBUG true [get_nets {dut/fetch/PCNext[1][9]}]


connect_debug_port u_ila_0/probe4 [get_nets [list {dut/regset/RegisterSets_reg[0][15][0]} {dut/regset/RegisterSets_reg[0][15][1]} {dut/regset/RegisterSets_reg[0][15][2]} {dut/regset/RegisterSets_reg[0][15][3]} {dut/regset/RegisterSets_reg[0][15][4]} {dut/regset/RegisterSets_reg[0][15][5]} {dut/regset/RegisterSets_reg[0][15][6]} {dut/regset/RegisterSets_reg[0][15][7]} {dut/regset/RegisterSets_reg[0][15][8]} {dut/regset/RegisterSets_reg[0][15][9]} {dut/regset/RegisterSets_reg[0][15][10]} {dut/regset/RegisterSets_reg[0][15][11]} {dut/regset/RegisterSets_reg[0][15][12]} {dut/regset/RegisterSets_reg[0][15][13]} {dut/regset/RegisterSets_reg[0][15][14]} {dut/regset/RegisterSets_reg[0][15][15]} {dut/regset/RegisterSets_reg[0][15][16]} {dut/regset/RegisterSets_reg[0][15][17]} {dut/regset/RegisterSets_reg[0][15][18]} {dut/regset/RegisterSets_reg[0][15][19]} {dut/regset/RegisterSets_reg[0][15][20]} {dut/regset/RegisterSets_reg[0][15][21]} {dut/regset/RegisterSets_reg[0][15][22]} {dut/regset/RegisterSets_reg[0][15][23]} {dut/regset/RegisterSets_reg[0][15][24]} {dut/regset/RegisterSets_reg[0][15][25]} {dut/regset/RegisterSets_reg[0][15][26]} {dut/regset/RegisterSets_reg[0][15][27]} {dut/regset/RegisterSets_reg[0][15][28]} {dut/regset/RegisterSets_reg[0][15][29]} {dut/regset/RegisterSets_reg[0][15][30]} {dut/regset/RegisterSets_reg[0][15][31]}]]
connect_debug_port u_ila_0/probe5 [get_nets [list {dut/regset/RegisterSets_reg[0][14][0]} {dut/regset/RegisterSets_reg[0][14][1]} {dut/regset/RegisterSets_reg[0][14][2]} {dut/regset/RegisterSets_reg[0][14][3]} {dut/regset/RegisterSets_reg[0][14][4]} {dut/regset/RegisterSets_reg[0][14][5]} {dut/regset/RegisterSets_reg[0][14][6]} {dut/regset/RegisterSets_reg[0][14][7]} {dut/regset/RegisterSets_reg[0][14][8]} {dut/regset/RegisterSets_reg[0][14][9]} {dut/regset/RegisterSets_reg[0][14][10]} {dut/regset/RegisterSets_reg[0][14][11]} {dut/regset/RegisterSets_reg[0][14][12]} {dut/regset/RegisterSets_reg[0][14][13]} {dut/regset/RegisterSets_reg[0][14][14]} {dut/regset/RegisterSets_reg[0][14][15]} {dut/regset/RegisterSets_reg[0][14][16]} {dut/regset/RegisterSets_reg[0][14][17]} {dut/regset/RegisterSets_reg[0][14][18]} {dut/regset/RegisterSets_reg[0][14][19]} {dut/regset/RegisterSets_reg[0][14][20]} {dut/regset/RegisterSets_reg[0][14][21]} {dut/regset/RegisterSets_reg[0][14][22]} {dut/regset/RegisterSets_reg[0][14][23]} {dut/regset/RegisterSets_reg[0][14][24]} {dut/regset/RegisterSets_reg[0][14][25]} {dut/regset/RegisterSets_reg[0][14][26]} {dut/regset/RegisterSets_reg[0][14][27]} {dut/regset/RegisterSets_reg[0][14][28]} {dut/regset/RegisterSets_reg[0][14][29]} {dut/regset/RegisterSets_reg[0][14][30]} {dut/regset/RegisterSets_reg[0][14][31]}]]
connect_debug_port u_ila_0/probe6 [get_nets [list {dut/regset/RegisterSets_reg[0][1][0]} {dut/regset/RegisterSets_reg[0][1][1]} {dut/regset/RegisterSets_reg[0][1][2]} {dut/regset/RegisterSets_reg[0][1][3]} {dut/regset/RegisterSets_reg[0][1][4]} {dut/regset/RegisterSets_reg[0][1][5]} {dut/regset/RegisterSets_reg[0][1][6]} {dut/regset/RegisterSets_reg[0][1][7]} {dut/regset/RegisterSets_reg[0][1][8]} {dut/regset/RegisterSets_reg[0][1][9]} {dut/regset/RegisterSets_reg[0][1][10]} {dut/regset/RegisterSets_reg[0][1][11]} {dut/regset/RegisterSets_reg[0][1][12]} {dut/regset/RegisterSets_reg[0][1][13]} {dut/regset/RegisterSets_reg[0][1][14]} {dut/regset/RegisterSets_reg[0][1][15]} {dut/regset/RegisterSets_reg[0][1][16]} {dut/regset/RegisterSets_reg[0][1][17]} {dut/regset/RegisterSets_reg[0][1][18]} {dut/regset/RegisterSets_reg[0][1][19]} {dut/regset/RegisterSets_reg[0][1][20]} {dut/regset/RegisterSets_reg[0][1][21]} {dut/regset/RegisterSets_reg[0][1][22]} {dut/regset/RegisterSets_reg[0][1][23]} {dut/regset/RegisterSets_reg[0][1][24]} {dut/regset/RegisterSets_reg[0][1][25]} {dut/regset/RegisterSets_reg[0][1][26]} {dut/regset/RegisterSets_reg[0][1][27]} {dut/regset/RegisterSets_reg[0][1][28]} {dut/regset/RegisterSets_reg[0][1][29]} {dut/regset/RegisterSets_reg[0][1][30]} {dut/regset/RegisterSets_reg[0][1][31]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {dut/EX_ThreadTag[0]} {dut/EX_ThreadTag[1]}]]
connect_debug_port u_ila_0/probe12 [get_nets [list {dut/fetch/PCI[3][0]} {dut/fetch/PCI[3][1]} {dut/fetch/PCI[3][2]} {dut/fetch/PCI[3][3]} {dut/fetch/PCI[3][4]} {dut/fetch/PCI[3][5]} {dut/fetch/PCI[3][6]} {dut/fetch/PCI[3][7]} {dut/fetch/PCI[3][8]} {dut/fetch/PCI[3][9]} {dut/fetch/PCI[3][10]} {dut/fetch/PCI[3][11]} {dut/fetch/PCI[3][12]} {dut/fetch/PCI[3][13]} {dut/fetch/PCI[3][14]} {dut/fetch/PCI[3][15]} {dut/fetch/PCI[3][16]} {dut/fetch/PCI[3][17]} {dut/fetch/PCI[3][18]} {dut/fetch/PCI[3][19]} {dut/fetch/PCI[3][20]} {dut/fetch/PCI[3][21]} {dut/fetch/PCI[3][22]} {dut/fetch/PCI[3][23]} {dut/fetch/PCI[3][24]} {dut/fetch/PCI[3][25]} {dut/fetch/PCI[3][26]} {dut/fetch/PCI[3][27]} {dut/fetch/PCI[3][28]} {dut/fetch/PCI[3][29]} {dut/fetch/PCI[3][30]} {dut/fetch/PCI[3][31]}]]
connect_debug_port u_ila_0/probe13 [get_nets [list {dut/regset/RegisterSets_reg[0][2][0]} {dut/regset/RegisterSets_reg[0][2][1]} {dut/regset/RegisterSets_reg[0][2][2]} {dut/regset/RegisterSets_reg[0][2][3]} {dut/regset/RegisterSets_reg[0][2][4]} {dut/regset/RegisterSets_reg[0][2][5]} {dut/regset/RegisterSets_reg[0][2][6]} {dut/regset/RegisterSets_reg[0][2][7]} {dut/regset/RegisterSets_reg[0][2][8]} {dut/regset/RegisterSets_reg[0][2][9]} {dut/regset/RegisterSets_reg[0][2][10]} {dut/regset/RegisterSets_reg[0][2][11]} {dut/regset/RegisterSets_reg[0][2][12]} {dut/regset/RegisterSets_reg[0][2][13]} {dut/regset/RegisterSets_reg[0][2][14]} {dut/regset/RegisterSets_reg[0][2][15]} {dut/regset/RegisterSets_reg[0][2][16]} {dut/regset/RegisterSets_reg[0][2][17]} {dut/regset/RegisterSets_reg[0][2][18]} {dut/regset/RegisterSets_reg[0][2][19]} {dut/regset/RegisterSets_reg[0][2][20]} {dut/regset/RegisterSets_reg[0][2][21]} {dut/regset/RegisterSets_reg[0][2][22]} {dut/regset/RegisterSets_reg[0][2][23]} {dut/regset/RegisterSets_reg[0][2][24]} {dut/regset/RegisterSets_reg[0][2][25]} {dut/regset/RegisterSets_reg[0][2][26]} {dut/regset/RegisterSets_reg[0][2][27]} {dut/regset/RegisterSets_reg[0][2][28]} {dut/regset/RegisterSets_reg[0][2][29]} {dut/regset/RegisterSets_reg[0][2][30]} {dut/regset/RegisterSets_reg[0][2][31]}]]
connect_debug_port u_ila_0/probe15 [get_nets [list {dut/regset/RegisterSets_reg[1][1][0]} {dut/regset/RegisterSets_reg[1][1][1]} {dut/regset/RegisterSets_reg[1][1][2]} {dut/regset/RegisterSets_reg[1][1][3]} {dut/regset/RegisterSets_reg[1][1][4]} {dut/regset/RegisterSets_reg[1][1][5]} {dut/regset/RegisterSets_reg[1][1][6]} {dut/regset/RegisterSets_reg[1][1][7]} {dut/regset/RegisterSets_reg[1][1][8]} {dut/regset/RegisterSets_reg[1][1][9]} {dut/regset/RegisterSets_reg[1][1][10]} {dut/regset/RegisterSets_reg[1][1][11]} {dut/regset/RegisterSets_reg[1][1][12]} {dut/regset/RegisterSets_reg[1][1][13]} {dut/regset/RegisterSets_reg[1][1][14]} {dut/regset/RegisterSets_reg[1][1][15]} {dut/regset/RegisterSets_reg[1][1][16]} {dut/regset/RegisterSets_reg[1][1][17]} {dut/regset/RegisterSets_reg[1][1][18]} {dut/regset/RegisterSets_reg[1][1][19]} {dut/regset/RegisterSets_reg[1][1][20]} {dut/regset/RegisterSets_reg[1][1][21]} {dut/regset/RegisterSets_reg[1][1][22]} {dut/regset/RegisterSets_reg[1][1][23]} {dut/regset/RegisterSets_reg[1][1][24]} {dut/regset/RegisterSets_reg[1][1][25]} {dut/regset/RegisterSets_reg[1][1][26]} {dut/regset/RegisterSets_reg[1][1][27]} {dut/regset/RegisterSets_reg[1][1][28]} {dut/regset/RegisterSets_reg[1][1][29]} {dut/regset/RegisterSets_reg[1][1][30]} {dut/regset/RegisterSets_reg[1][1][31]}]]
connect_debug_port u_ila_0/probe17 [get_nets [list {dut/fetch/PCI[0][0]} {dut/fetch/PCI[0][1]} {dut/fetch/PCI[0][2]} {dut/fetch/PCI[0][3]} {dut/fetch/PCI[0][4]} {dut/fetch/PCI[0][5]} {dut/fetch/PCI[0][6]} {dut/fetch/PCI[0][7]} {dut/fetch/PCI[0][8]} {dut/fetch/PCI[0][9]} {dut/fetch/PCI[0][10]} {dut/fetch/PCI[0][11]} {dut/fetch/PCI[0][12]} {dut/fetch/PCI[0][13]} {dut/fetch/PCI[0][14]} {dut/fetch/PCI[0][15]} {dut/fetch/PCI[0][16]} {dut/fetch/PCI[0][17]} {dut/fetch/PCI[0][18]} {dut/fetch/PCI[0][19]} {dut/fetch/PCI[0][20]} {dut/fetch/PCI[0][21]} {dut/fetch/PCI[0][22]} {dut/fetch/PCI[0][23]} {dut/fetch/PCI[0][24]} {dut/fetch/PCI[0][25]} {dut/fetch/PCI[0][26]} {dut/fetch/PCI[0][27]} {dut/fetch/PCI[0][28]} {dut/fetch/PCI[0][29]} {dut/fetch/PCI[0][30]} {dut/fetch/PCI[0][31]}]]
connect_debug_port u_ila_0/probe23 [get_nets [list {dut/EX_JumpO[ThreadTag][0]} {dut/EX_JumpO[ThreadTag][1]}]]
connect_debug_port u_ila_0/probe25 [get_nets [list {dut/EX_IF_SpawnThread[0]} {dut/EX_IF_SpawnThread[1]}]]
connect_debug_port u_ila_0/probe26 [get_nets [list {dut/regset/RegisterSets_reg[2][10][0]} {dut/regset/RegisterSets_reg[2][10][1]} {dut/regset/RegisterSets_reg[2][10][2]} {dut/regset/RegisterSets_reg[2][10][3]} {dut/regset/RegisterSets_reg[2][10][4]} {dut/regset/RegisterSets_reg[2][10][5]} {dut/regset/RegisterSets_reg[2][10][6]} {dut/regset/RegisterSets_reg[2][10][7]} {dut/regset/RegisterSets_reg[2][10][8]} {dut/regset/RegisterSets_reg[2][10][9]} {dut/regset/RegisterSets_reg[2][10][10]} {dut/regset/RegisterSets_reg[2][10][11]} {dut/regset/RegisterSets_reg[2][10][12]} {dut/regset/RegisterSets_reg[2][10][13]} {dut/regset/RegisterSets_reg[2][10][14]} {dut/regset/RegisterSets_reg[2][10][15]} {dut/regset/RegisterSets_reg[2][10][16]} {dut/regset/RegisterSets_reg[2][10][17]} {dut/regset/RegisterSets_reg[2][10][18]} {dut/regset/RegisterSets_reg[2][10][19]} {dut/regset/RegisterSets_reg[2][10][20]} {dut/regset/RegisterSets_reg[2][10][21]} {dut/regset/RegisterSets_reg[2][10][22]} {dut/regset/RegisterSets_reg[2][10][23]} {dut/regset/RegisterSets_reg[2][10][24]} {dut/regset/RegisterSets_reg[2][10][25]} {dut/regset/RegisterSets_reg[2][10][26]} {dut/regset/RegisterSets_reg[2][10][27]} {dut/regset/RegisterSets_reg[2][10][28]} {dut/regset/RegisterSets_reg[2][10][29]} {dut/regset/RegisterSets_reg[2][10][30]} {dut/regset/RegisterSets_reg[2][10][31]}]]
connect_debug_port u_ila_0/probe27 [get_nets [list {dut/regset/RegisterSets_reg[2][1][0]} {dut/regset/RegisterSets_reg[2][1][1]} {dut/regset/RegisterSets_reg[2][1][2]} {dut/regset/RegisterSets_reg[2][1][3]} {dut/regset/RegisterSets_reg[2][1][4]} {dut/regset/RegisterSets_reg[2][1][5]} {dut/regset/RegisterSets_reg[2][1][6]} {dut/regset/RegisterSets_reg[2][1][7]} {dut/regset/RegisterSets_reg[2][1][8]} {dut/regset/RegisterSets_reg[2][1][9]} {dut/regset/RegisterSets_reg[2][1][10]} {dut/regset/RegisterSets_reg[2][1][11]} {dut/regset/RegisterSets_reg[2][1][12]} {dut/regset/RegisterSets_reg[2][1][13]} {dut/regset/RegisterSets_reg[2][1][14]} {dut/regset/RegisterSets_reg[2][1][15]} {dut/regset/RegisterSets_reg[2][1][16]} {dut/regset/RegisterSets_reg[2][1][17]} {dut/regset/RegisterSets_reg[2][1][18]} {dut/regset/RegisterSets_reg[2][1][19]} {dut/regset/RegisterSets_reg[2][1][20]} {dut/regset/RegisterSets_reg[2][1][21]} {dut/regset/RegisterSets_reg[2][1][22]} {dut/regset/RegisterSets_reg[2][1][23]} {dut/regset/RegisterSets_reg[2][1][24]} {dut/regset/RegisterSets_reg[2][1][25]} {dut/regset/RegisterSets_reg[2][1][26]} {dut/regset/RegisterSets_reg[2][1][27]} {dut/regset/RegisterSets_reg[2][1][28]} {dut/regset/RegisterSets_reg[2][1][29]} {dut/regset/RegisterSets_reg[2][1][30]} {dut/regset/RegisterSets_reg[2][1][31]}]]
connect_debug_port u_ila_0/probe28 [get_nets [list {dut/fetch/PCNext[0][0]} {dut/fetch/PCNext[0][1]} {dut/fetch/PCNext[0][2]} {dut/fetch/PCNext[0][3]} {dut/fetch/PCNext[0][4]} {dut/fetch/PCNext[0][5]} {dut/fetch/PCNext[0][6]} {dut/fetch/PCNext[0][7]} {dut/fetch/PCNext[0][8]} {dut/fetch/PCNext[0][9]} {dut/fetch/PCNext[0][10]} {dut/fetch/PCNext[0][11]} {dut/fetch/PCNext[0][12]} {dut/fetch/PCNext[0][13]} {dut/fetch/PCNext[0][14]} {dut/fetch/PCNext[0][15]} {dut/fetch/PCNext[0][16]} {dut/fetch/PCNext[0][17]} {dut/fetch/PCNext[0][18]} {dut/fetch/PCNext[0][19]} {dut/fetch/PCNext[0][20]} {dut/fetch/PCNext[0][21]} {dut/fetch/PCNext[0][22]} {dut/fetch/PCNext[0][23]} {dut/fetch/PCNext[0][24]} {dut/fetch/PCNext[0][25]} {dut/fetch/PCNext[0][26]} {dut/fetch/PCNext[0][27]} {dut/fetch/PCNext[0][28]} {dut/fetch/PCNext[0][29]} {dut/fetch/PCNext[0][30]} {dut/fetch/PCNext[0][31]}]]
connect_debug_port u_ila_0/probe29 [get_nets [list {dut/fetch/PCNext[2][0]} {dut/fetch/PCNext[2][1]} {dut/fetch/PCNext[2][2]} {dut/fetch/PCNext[2][3]} {dut/fetch/PCNext[2][4]} {dut/fetch/PCNext[2][5]} {dut/fetch/PCNext[2][6]} {dut/fetch/PCNext[2][7]} {dut/fetch/PCNext[2][8]} {dut/fetch/PCNext[2][9]} {dut/fetch/PCNext[2][10]} {dut/fetch/PCNext[2][11]} {dut/fetch/PCNext[2][12]} {dut/fetch/PCNext[2][13]} {dut/fetch/PCNext[2][14]} {dut/fetch/PCNext[2][15]} {dut/fetch/PCNext[2][16]} {dut/fetch/PCNext[2][17]} {dut/fetch/PCNext[2][18]} {dut/fetch/PCNext[2][19]} {dut/fetch/PCNext[2][20]} {dut/fetch/PCNext[2][21]} {dut/fetch/PCNext[2][22]} {dut/fetch/PCNext[2][23]} {dut/fetch/PCNext[2][24]} {dut/fetch/PCNext[2][25]} {dut/fetch/PCNext[2][26]} {dut/fetch/PCNext[2][27]} {dut/fetch/PCNext[2][28]} {dut/fetch/PCNext[2][29]} {dut/fetch/PCNext[2][30]} {dut/fetch/PCNext[2][31]}]]
connect_debug_port u_ila_0/probe32 [get_nets [list {dut/ID_IF_Interlock[ThreadTag][0]} {dut/ID_IF_Interlock[ThreadTag][1]}]]
connect_debug_port u_ila_0/probe35 [get_nets [list {dut/IF_ThreadTag[0]} {dut/IF_ThreadTag[1]}]]
connect_debug_port u_ila_0/probe37 [get_nets [list {dut/ID_ThreadTag[0]} {dut/ID_ThreadTag[1]}]]
connect_debug_port u_ila_0/probe38 [get_nets [list {dut/fetch/thread_pc_next[3][0]} {dut/fetch/thread_pc_next[3][1]} {dut/fetch/thread_pc_next[3][2]} {dut/fetch/thread_pc_next[3][3]} {dut/fetch/thread_pc_next[3][4]} {dut/fetch/thread_pc_next[3][5]} {dut/fetch/thread_pc_next[3][6]} {dut/fetch/thread_pc_next[3][7]} {dut/fetch/thread_pc_next[3][8]} {dut/fetch/thread_pc_next[3][9]} {dut/fetch/thread_pc_next[3][10]} {dut/fetch/thread_pc_next[3][11]} {dut/fetch/thread_pc_next[3][12]} {dut/fetch/thread_pc_next[3][13]} {dut/fetch/thread_pc_next[3][14]} {dut/fetch/thread_pc_next[3][15]} {dut/fetch/thread_pc_next[3][16]} {dut/fetch/thread_pc_next[3][17]} {dut/fetch/thread_pc_next[3][18]} {dut/fetch/thread_pc_next[3][19]} {dut/fetch/thread_pc_next[3][20]} {dut/fetch/thread_pc_next[3][21]} {dut/fetch/thread_pc_next[3][22]} {dut/fetch/thread_pc_next[3][23]} {dut/fetch/thread_pc_next[3][24]} {dut/fetch/thread_pc_next[3][25]} {dut/fetch/thread_pc_next[3][26]} {dut/fetch/thread_pc_next[3][27]} {dut/fetch/thread_pc_next[3][28]} {dut/fetch/thread_pc_next[3][29]} {dut/fetch/thread_pc_next[3][30]} {dut/fetch/thread_pc_next[3][31]}]]
connect_debug_port u_ila_0/probe43 [get_nets [list {dut/MEM_ID_ThreadTag[0]} {dut/MEM_ID_ThreadTag[1]}]]
connect_debug_port u_ila_0/probe44 [get_nets [list {dut/EX_SpawnThread[0]} {dut/EX_SpawnThread[1]}]]
connect_debug_port u_ila_0/probe56 [get_nets [list dut/Matches]]
connect_debug_port u_ila_0/probe57 [get_nets [list dut/MatchesStd]]

connect_debug_port u_ila_0/probe24 [get_nets [list {dut/regset/RegisterSets_reg[0][10]_23[0]} {dut/regset/RegisterSets_reg[0][10]_23[1]} {dut/regset/RegisterSets_reg[0][10]_23[2]} {dut/regset/RegisterSets_reg[0][10]_23[3]} {dut/regset/RegisterSets_reg[0][10]_23[4]} {dut/regset/RegisterSets_reg[0][10]_23[5]} {dut/regset/RegisterSets_reg[0][10]_23[6]} {dut/regset/RegisterSets_reg[0][10]_23[7]} {dut/regset/RegisterSets_reg[0][10]_23[8]} {dut/regset/RegisterSets_reg[0][10]_23[9]} {dut/regset/RegisterSets_reg[0][10]_23[10]} {dut/regset/RegisterSets_reg[0][10]_23[11]} {dut/regset/RegisterSets_reg[0][10]_23[12]} {dut/regset/RegisterSets_reg[0][10]_23[13]} {dut/regset/RegisterSets_reg[0][10]_23[14]} {dut/regset/RegisterSets_reg[0][10]_23[15]} {dut/regset/RegisterSets_reg[0][10]_23[16]} {dut/regset/RegisterSets_reg[0][10]_23[17]} {dut/regset/RegisterSets_reg[0][10]_23[18]} {dut/regset/RegisterSets_reg[0][10]_23[19]} {dut/regset/RegisterSets_reg[0][10]_23[20]} {dut/regset/RegisterSets_reg[0][10]_23[21]} {dut/regset/RegisterSets_reg[0][10]_23[22]} {dut/regset/RegisterSets_reg[0][10]_23[23]} {dut/regset/RegisterSets_reg[0][10]_23[24]} {dut/regset/RegisterSets_reg[0][10]_23[25]} {dut/regset/RegisterSets_reg[0][10]_23[26]} {dut/regset/RegisterSets_reg[0][10]_23[27]} {dut/regset/RegisterSets_reg[0][10]_23[28]} {dut/regset/RegisterSets_reg[0][10]_23[29]} {dut/regset/RegisterSets_reg[0][10]_23[30]} {dut/regset/RegisterSets_reg[0][10]_23[31]}]]
connect_debug_port u_ila_0/probe28 [get_nets [list {dut/regset/RegisterSets_reg[1][10]_22[0]} {dut/regset/RegisterSets_reg[1][10]_22[1]} {dut/regset/RegisterSets_reg[1][10]_22[2]} {dut/regset/RegisterSets_reg[1][10]_22[3]} {dut/regset/RegisterSets_reg[1][10]_22[4]} {dut/regset/RegisterSets_reg[1][10]_22[5]} {dut/regset/RegisterSets_reg[1][10]_22[6]} {dut/regset/RegisterSets_reg[1][10]_22[7]} {dut/regset/RegisterSets_reg[1][10]_22[8]} {dut/regset/RegisterSets_reg[1][10]_22[9]} {dut/regset/RegisterSets_reg[1][10]_22[10]} {dut/regset/RegisterSets_reg[1][10]_22[11]} {dut/regset/RegisterSets_reg[1][10]_22[12]} {dut/regset/RegisterSets_reg[1][10]_22[13]} {dut/regset/RegisterSets_reg[1][10]_22[14]} {dut/regset/RegisterSets_reg[1][10]_22[15]} {dut/regset/RegisterSets_reg[1][10]_22[16]} {dut/regset/RegisterSets_reg[1][10]_22[17]} {dut/regset/RegisterSets_reg[1][10]_22[18]} {dut/regset/RegisterSets_reg[1][10]_22[19]} {dut/regset/RegisterSets_reg[1][10]_22[20]} {dut/regset/RegisterSets_reg[1][10]_22[21]} {dut/regset/RegisterSets_reg[1][10]_22[22]} {dut/regset/RegisterSets_reg[1][10]_22[23]} {dut/regset/RegisterSets_reg[1][10]_22[24]} {dut/regset/RegisterSets_reg[1][10]_22[25]} {dut/regset/RegisterSets_reg[1][10]_22[26]} {dut/regset/RegisterSets_reg[1][10]_22[27]} {dut/regset/RegisterSets_reg[1][10]_22[28]} {dut/regset/RegisterSets_reg[1][10]_22[29]} {dut/regset/RegisterSets_reg[1][10]_22[30]} {dut/regset/RegisterSets_reg[1][10]_22[31]}]]

connect_debug_port u_ila_0/probe24 [get_nets [list {dut/regset/RegisterSets_reg[2][10]_81[0]} {dut/regset/RegisterSets_reg[2][10]_81[1]} {dut/regset/RegisterSets_reg[2][10]_81[2]} {dut/regset/RegisterSets_reg[2][10]_81[3]} {dut/regset/RegisterSets_reg[2][10]_81[4]} {dut/regset/RegisterSets_reg[2][10]_81[5]} {dut/regset/RegisterSets_reg[2][10]_81[6]} {dut/regset/RegisterSets_reg[2][10]_81[7]} {dut/regset/RegisterSets_reg[2][10]_81[8]} {dut/regset/RegisterSets_reg[2][10]_81[9]} {dut/regset/RegisterSets_reg[2][10]_81[10]} {dut/regset/RegisterSets_reg[2][10]_81[11]} {dut/regset/RegisterSets_reg[2][10]_81[12]} {dut/regset/RegisterSets_reg[2][10]_81[13]} {dut/regset/RegisterSets_reg[2][10]_81[14]} {dut/regset/RegisterSets_reg[2][10]_81[15]} {dut/regset/RegisterSets_reg[2][10]_81[16]} {dut/regset/RegisterSets_reg[2][10]_81[17]} {dut/regset/RegisterSets_reg[2][10]_81[18]} {dut/regset/RegisterSets_reg[2][10]_81[19]} {dut/regset/RegisterSets_reg[2][10]_81[20]} {dut/regset/RegisterSets_reg[2][10]_81[21]} {dut/regset/RegisterSets_reg[2][10]_81[22]} {dut/regset/RegisterSets_reg[2][10]_81[23]} {dut/regset/RegisterSets_reg[2][10]_81[24]} {dut/regset/RegisterSets_reg[2][10]_81[25]} {dut/regset/RegisterSets_reg[2][10]_81[26]} {dut/regset/RegisterSets_reg[2][10]_81[27]} {dut/regset/RegisterSets_reg[2][10]_81[28]} {dut/regset/RegisterSets_reg[2][10]_81[29]} {dut/regset/RegisterSets_reg[2][10]_81[30]} {dut/regset/RegisterSets_reg[2][10]_81[31]}]]
connect_debug_port u_ila_0/probe31 [get_nets [list {dut/regset/RegisterSets_reg[1][10]_82[0]} {dut/regset/RegisterSets_reg[1][10]_82[1]} {dut/regset/RegisterSets_reg[1][10]_82[2]} {dut/regset/RegisterSets_reg[1][10]_82[3]} {dut/regset/RegisterSets_reg[1][10]_82[4]} {dut/regset/RegisterSets_reg[1][10]_82[5]} {dut/regset/RegisterSets_reg[1][10]_82[6]} {dut/regset/RegisterSets_reg[1][10]_82[7]} {dut/regset/RegisterSets_reg[1][10]_82[8]} {dut/regset/RegisterSets_reg[1][10]_82[9]} {dut/regset/RegisterSets_reg[1][10]_82[10]} {dut/regset/RegisterSets_reg[1][10]_82[11]} {dut/regset/RegisterSets_reg[1][10]_82[12]} {dut/regset/RegisterSets_reg[1][10]_82[13]} {dut/regset/RegisterSets_reg[1][10]_82[14]} {dut/regset/RegisterSets_reg[1][10]_82[15]} {dut/regset/RegisterSets_reg[1][10]_82[16]} {dut/regset/RegisterSets_reg[1][10]_82[17]} {dut/regset/RegisterSets_reg[1][10]_82[18]} {dut/regset/RegisterSets_reg[1][10]_82[19]} {dut/regset/RegisterSets_reg[1][10]_82[20]} {dut/regset/RegisterSets_reg[1][10]_82[21]} {dut/regset/RegisterSets_reg[1][10]_82[22]} {dut/regset/RegisterSets_reg[1][10]_82[23]} {dut/regset/RegisterSets_reg[1][10]_82[24]} {dut/regset/RegisterSets_reg[1][10]_82[25]} {dut/regset/RegisterSets_reg[1][10]_82[26]} {dut/regset/RegisterSets_reg[1][10]_82[27]} {dut/regset/RegisterSets_reg[1][10]_82[28]} {dut/regset/RegisterSets_reg[1][10]_82[29]} {dut/regset/RegisterSets_reg[1][10]_82[30]} {dut/regset/RegisterSets_reg[1][10]_82[31]}]]
connect_debug_port u_ila_0/probe37 [get_nets [list {dut/regset/RegisterSets_reg[0][10]_83[0]} {dut/regset/RegisterSets_reg[0][10]_83[1]} {dut/regset/RegisterSets_reg[0][10]_83[2]} {dut/regset/RegisterSets_reg[0][10]_83[3]} {dut/regset/RegisterSets_reg[0][10]_83[4]} {dut/regset/RegisterSets_reg[0][10]_83[5]} {dut/regset/RegisterSets_reg[0][10]_83[6]} {dut/regset/RegisterSets_reg[0][10]_83[7]} {dut/regset/RegisterSets_reg[0][10]_83[8]} {dut/regset/RegisterSets_reg[0][10]_83[9]} {dut/regset/RegisterSets_reg[0][10]_83[10]} {dut/regset/RegisterSets_reg[0][10]_83[11]} {dut/regset/RegisterSets_reg[0][10]_83[12]} {dut/regset/RegisterSets_reg[0][10]_83[13]} {dut/regset/RegisterSets_reg[0][10]_83[14]} {dut/regset/RegisterSets_reg[0][10]_83[15]} {dut/regset/RegisterSets_reg[0][10]_83[16]} {dut/regset/RegisterSets_reg[0][10]_83[17]} {dut/regset/RegisterSets_reg[0][10]_83[18]} {dut/regset/RegisterSets_reg[0][10]_83[19]} {dut/regset/RegisterSets_reg[0][10]_83[20]} {dut/regset/RegisterSets_reg[0][10]_83[21]} {dut/regset/RegisterSets_reg[0][10]_83[22]} {dut/regset/RegisterSets_reg[0][10]_83[23]} {dut/regset/RegisterSets_reg[0][10]_83[24]} {dut/regset/RegisterSets_reg[0][10]_83[25]} {dut/regset/RegisterSets_reg[0][10]_83[26]} {dut/regset/RegisterSets_reg[0][10]_83[27]} {dut/regset/RegisterSets_reg[0][10]_83[28]} {dut/regset/RegisterSets_reg[0][10]_83[29]} {dut/regset/RegisterSets_reg[0][10]_83[30]} {dut/regset/RegisterSets_reg[0][10]_83[31]}]]

connect_debug_port u_ila_0/probe0 [get_nets [list {dut/regset/RegisterSets_reg[3][10]_44[0]} {dut/regset/RegisterSets_reg[3][10]_44[1]} {dut/regset/RegisterSets_reg[3][10]_44[2]} {dut/regset/RegisterSets_reg[3][10]_44[3]} {dut/regset/RegisterSets_reg[3][10]_44[4]} {dut/regset/RegisterSets_reg[3][10]_44[5]} {dut/regset/RegisterSets_reg[3][10]_44[6]} {dut/regset/RegisterSets_reg[3][10]_44[7]} {dut/regset/RegisterSets_reg[3][10]_44[8]} {dut/regset/RegisterSets_reg[3][10]_44[9]} {dut/regset/RegisterSets_reg[3][10]_44[10]} {dut/regset/RegisterSets_reg[3][10]_44[11]} {dut/regset/RegisterSets_reg[3][10]_44[12]} {dut/regset/RegisterSets_reg[3][10]_44[13]} {dut/regset/RegisterSets_reg[3][10]_44[14]} {dut/regset/RegisterSets_reg[3][10]_44[15]} {dut/regset/RegisterSets_reg[3][10]_44[16]} {dut/regset/RegisterSets_reg[3][10]_44[17]} {dut/regset/RegisterSets_reg[3][10]_44[18]} {dut/regset/RegisterSets_reg[3][10]_44[19]} {dut/regset/RegisterSets_reg[3][10]_44[20]} {dut/regset/RegisterSets_reg[3][10]_44[21]} {dut/regset/RegisterSets_reg[3][10]_44[22]} {dut/regset/RegisterSets_reg[3][10]_44[23]} {dut/regset/RegisterSets_reg[3][10]_44[24]} {dut/regset/RegisterSets_reg[3][10]_44[25]} {dut/regset/RegisterSets_reg[3][10]_44[26]} {dut/regset/RegisterSets_reg[3][10]_44[27]} {dut/regset/RegisterSets_reg[3][10]_44[28]} {dut/regset/RegisterSets_reg[3][10]_44[29]} {dut/regset/RegisterSets_reg[3][10]_44[30]} {dut/regset/RegisterSets_reg[3][10]_44[31]}]]
connect_debug_port u_ila_0/probe1 [get_nets [list {dut/regset/RegisterSets_reg[2][10]_45[0]} {dut/regset/RegisterSets_reg[2][10]_45[1]} {dut/regset/RegisterSets_reg[2][10]_45[2]} {dut/regset/RegisterSets_reg[2][10]_45[3]} {dut/regset/RegisterSets_reg[2][10]_45[4]} {dut/regset/RegisterSets_reg[2][10]_45[5]} {dut/regset/RegisterSets_reg[2][10]_45[6]} {dut/regset/RegisterSets_reg[2][10]_45[7]} {dut/regset/RegisterSets_reg[2][10]_45[8]} {dut/regset/RegisterSets_reg[2][10]_45[9]} {dut/regset/RegisterSets_reg[2][10]_45[10]} {dut/regset/RegisterSets_reg[2][10]_45[11]} {dut/regset/RegisterSets_reg[2][10]_45[12]} {dut/regset/RegisterSets_reg[2][10]_45[13]} {dut/regset/RegisterSets_reg[2][10]_45[14]} {dut/regset/RegisterSets_reg[2][10]_45[15]} {dut/regset/RegisterSets_reg[2][10]_45[16]} {dut/regset/RegisterSets_reg[2][10]_45[17]} {dut/regset/RegisterSets_reg[2][10]_45[18]} {dut/regset/RegisterSets_reg[2][10]_45[19]} {dut/regset/RegisterSets_reg[2][10]_45[20]} {dut/regset/RegisterSets_reg[2][10]_45[21]} {dut/regset/RegisterSets_reg[2][10]_45[22]} {dut/regset/RegisterSets_reg[2][10]_45[23]} {dut/regset/RegisterSets_reg[2][10]_45[24]} {dut/regset/RegisterSets_reg[2][10]_45[25]} {dut/regset/RegisterSets_reg[2][10]_45[26]} {dut/regset/RegisterSets_reg[2][10]_45[27]} {dut/regset/RegisterSets_reg[2][10]_45[28]} {dut/regset/RegisterSets_reg[2][10]_45[29]} {dut/regset/RegisterSets_reg[2][10]_45[30]} {dut/regset/RegisterSets_reg[2][10]_45[31]}]]
connect_debug_port u_ila_0/probe2 [get_nets [list {dut/regset/RegisterSets_reg[1][10]_46[0]} {dut/regset/RegisterSets_reg[1][10]_46[1]} {dut/regset/RegisterSets_reg[1][10]_46[2]} {dut/regset/RegisterSets_reg[1][10]_46[3]} {dut/regset/RegisterSets_reg[1][10]_46[4]} {dut/regset/RegisterSets_reg[1][10]_46[5]} {dut/regset/RegisterSets_reg[1][10]_46[6]} {dut/regset/RegisterSets_reg[1][10]_46[7]} {dut/regset/RegisterSets_reg[1][10]_46[8]} {dut/regset/RegisterSets_reg[1][10]_46[9]} {dut/regset/RegisterSets_reg[1][10]_46[10]} {dut/regset/RegisterSets_reg[1][10]_46[11]} {dut/regset/RegisterSets_reg[1][10]_46[12]} {dut/regset/RegisterSets_reg[1][10]_46[13]} {dut/regset/RegisterSets_reg[1][10]_46[14]} {dut/regset/RegisterSets_reg[1][10]_46[15]} {dut/regset/RegisterSets_reg[1][10]_46[16]} {dut/regset/RegisterSets_reg[1][10]_46[17]} {dut/regset/RegisterSets_reg[1][10]_46[18]} {dut/regset/RegisterSets_reg[1][10]_46[19]} {dut/regset/RegisterSets_reg[1][10]_46[20]} {dut/regset/RegisterSets_reg[1][10]_46[21]} {dut/regset/RegisterSets_reg[1][10]_46[22]} {dut/regset/RegisterSets_reg[1][10]_46[23]} {dut/regset/RegisterSets_reg[1][10]_46[24]} {dut/regset/RegisterSets_reg[1][10]_46[25]} {dut/regset/RegisterSets_reg[1][10]_46[26]} {dut/regset/RegisterSets_reg[1][10]_46[27]} {dut/regset/RegisterSets_reg[1][10]_46[28]} {dut/regset/RegisterSets_reg[1][10]_46[29]} {dut/regset/RegisterSets_reg[1][10]_46[30]} {dut/regset/RegisterSets_reg[1][10]_46[31]}]]
connect_debug_port u_ila_0/probe3 [get_nets [list {dut/regset/RegisterSets_reg[0][10]_47[0]} {dut/regset/RegisterSets_reg[0][10]_47[1]} {dut/regset/RegisterSets_reg[0][10]_47[2]} {dut/regset/RegisterSets_reg[0][10]_47[3]} {dut/regset/RegisterSets_reg[0][10]_47[4]} {dut/regset/RegisterSets_reg[0][10]_47[5]} {dut/regset/RegisterSets_reg[0][10]_47[6]} {dut/regset/RegisterSets_reg[0][10]_47[7]} {dut/regset/RegisterSets_reg[0][10]_47[8]} {dut/regset/RegisterSets_reg[0][10]_47[9]} {dut/regset/RegisterSets_reg[0][10]_47[10]} {dut/regset/RegisterSets_reg[0][10]_47[11]} {dut/regset/RegisterSets_reg[0][10]_47[12]} {dut/regset/RegisterSets_reg[0][10]_47[13]} {dut/regset/RegisterSets_reg[0][10]_47[14]} {dut/regset/RegisterSets_reg[0][10]_47[15]} {dut/regset/RegisterSets_reg[0][10]_47[16]} {dut/regset/RegisterSets_reg[0][10]_47[17]} {dut/regset/RegisterSets_reg[0][10]_47[18]} {dut/regset/RegisterSets_reg[0][10]_47[19]} {dut/regset/RegisterSets_reg[0][10]_47[20]} {dut/regset/RegisterSets_reg[0][10]_47[21]} {dut/regset/RegisterSets_reg[0][10]_47[22]} {dut/regset/RegisterSets_reg[0][10]_47[23]} {dut/regset/RegisterSets_reg[0][10]_47[24]} {dut/regset/RegisterSets_reg[0][10]_47[25]} {dut/regset/RegisterSets_reg[0][10]_47[26]} {dut/regset/RegisterSets_reg[0][10]_47[27]} {dut/regset/RegisterSets_reg[0][10]_47[28]} {dut/regset/RegisterSets_reg[0][10]_47[29]} {dut/regset/RegisterSets_reg[0][10]_47[30]} {dut/regset/RegisterSets_reg[0][10]_47[31]}]]
connect_debug_port u_ila_0/probe28 [get_nets [list {dut/fetch/thread_pc_next[3][0]} {dut/fetch/thread_pc_next[3][1]} {dut/fetch/thread_pc_next[3][2]} {dut/fetch/thread_pc_next[3][3]} {dut/fetch/thread_pc_next[3][4]} {dut/fetch/thread_pc_next[3][5]} {dut/fetch/thread_pc_next[3][6]} {dut/fetch/thread_pc_next[3][7]} {dut/fetch/thread_pc_next[3][8]} {dut/fetch/thread_pc_next[3][9]} {dut/fetch/thread_pc_next[3][10]} {dut/fetch/thread_pc_next[3][11]} {dut/fetch/thread_pc_next[3][12]} {dut/fetch/thread_pc_next[3][13]} {dut/fetch/thread_pc_next[3][14]} {dut/fetch/thread_pc_next[3][15]} {dut/fetch/thread_pc_next[3][16]} {dut/fetch/thread_pc_next[3][17]} {dut/fetch/thread_pc_next[3][18]} {dut/fetch/thread_pc_next[3][19]} {dut/fetch/thread_pc_next[3][20]} {dut/fetch/thread_pc_next[3][21]} {dut/fetch/thread_pc_next[3][22]} {dut/fetch/thread_pc_next[3][23]} {dut/fetch/thread_pc_next[3][24]} {dut/fetch/thread_pc_next[3][25]} {dut/fetch/thread_pc_next[3][26]} {dut/fetch/thread_pc_next[3][27]} {dut/fetch/thread_pc_next[3][28]} {dut/fetch/thread_pc_next[3][29]} {dut/fetch/thread_pc_next[3][30]} {dut/fetch/thread_pc_next[3][31]}]]
connect_debug_port u_ila_0/probe29 [get_nets [list {dut/fetch/PCI[3][0]} {dut/fetch/PCI[3][1]} {dut/fetch/PCI[3][2]} {dut/fetch/PCI[3][3]} {dut/fetch/PCI[3][4]} {dut/fetch/PCI[3][5]} {dut/fetch/PCI[3][6]} {dut/fetch/PCI[3][7]} {dut/fetch/PCI[3][8]} {dut/fetch/PCI[3][9]} {dut/fetch/PCI[3][10]} {dut/fetch/PCI[3][11]} {dut/fetch/PCI[3][12]} {dut/fetch/PCI[3][13]} {dut/fetch/PCI[3][14]} {dut/fetch/PCI[3][15]} {dut/fetch/PCI[3][16]} {dut/fetch/PCI[3][17]} {dut/fetch/PCI[3][18]} {dut/fetch/PCI[3][19]} {dut/fetch/PCI[3][20]} {dut/fetch/PCI[3][21]} {dut/fetch/PCI[3][22]} {dut/fetch/PCI[3][23]} {dut/fetch/PCI[3][24]} {dut/fetch/PCI[3][25]} {dut/fetch/PCI[3][26]} {dut/fetch/PCI[3][27]} {dut/fetch/PCI[3][28]} {dut/fetch/PCI[3][29]} {dut/fetch/PCI[3][30]} {dut/fetch/PCI[3][31]}]]
connect_debug_port u_ila_0/probe34 [get_nets [list {dut/fetch/PCNext[0][0]} {dut/fetch/PCNext[0][1]} {dut/fetch/PCNext[0][2]} {dut/fetch/PCNext[0][3]} {dut/fetch/PCNext[0][4]} {dut/fetch/PCNext[0][5]} {dut/fetch/PCNext[0][6]} {dut/fetch/PCNext[0][7]} {dut/fetch/PCNext[0][8]} {dut/fetch/PCNext[0][9]} {dut/fetch/PCNext[0][10]} {dut/fetch/PCNext[0][11]} {dut/fetch/PCNext[0][12]} {dut/fetch/PCNext[0][13]} {dut/fetch/PCNext[0][14]} {dut/fetch/PCNext[0][15]} {dut/fetch/PCNext[0][16]} {dut/fetch/PCNext[0][17]} {dut/fetch/PCNext[0][18]} {dut/fetch/PCNext[0][19]} {dut/fetch/PCNext[0][20]} {dut/fetch/PCNext[0][21]} {dut/fetch/PCNext[0][22]} {dut/fetch/PCNext[0][23]} {dut/fetch/PCNext[0][24]} {dut/fetch/PCNext[0][25]} {dut/fetch/PCNext[0][26]} {dut/fetch/PCNext[0][27]} {dut/fetch/PCNext[0][28]} {dut/fetch/PCNext[0][29]} {dut/fetch/PCNext[0][30]} {dut/fetch/PCNext[0][31]}]]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list GCLK_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {dut/decode/Inst[0]} {dut/decode/Inst[1]} {dut/decode/Inst[2]} {dut/decode/Inst[3]} {dut/decode/Inst[4]} {dut/decode/Inst[5]} {dut/decode/Inst[6]} {dut/decode/Inst[7]} {dut/decode/Inst[8]} {dut/decode/Inst[9]} {dut/decode/Inst[10]} {dut/decode/Inst[11]} {dut/decode/Inst[12]} {dut/decode/Inst[13]} {dut/decode/Inst[14]} {dut/decode/Inst[15]} {dut/decode/Inst[16]} {dut/decode/Inst[17]} {dut/decode/Inst[18]} {dut/decode/Inst[19]} {dut/decode/Inst[20]} {dut/decode/Inst[21]} {dut/decode/Inst[22]} {dut/decode/Inst[23]} {dut/decode/Inst[24]} {dut/decode/Inst[25]} {dut/decode/Inst[26]} {dut/decode/Inst[27]} {dut/decode/Inst[28]} {dut/decode/Inst[29]} {dut/decode/Inst[30]} {dut/decode/Inst[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {dut/decode/PC[0]} {dut/decode/PC[1]} {dut/decode/PC[2]} {dut/decode/PC[3]} {dut/decode/PC[4]} {dut/decode/PC[5]} {dut/decode/PC[6]} {dut/decode/PC[7]} {dut/decode/PC[8]} {dut/decode/PC[9]} {dut/decode/PC[10]} {dut/decode/PC[11]} {dut/decode/PC[12]} {dut/decode/PC[13]} {dut/decode/PC[14]} {dut/decode/PC[15]} {dut/decode/PC[16]} {dut/decode/PC[17]} {dut/decode/PC[18]} {dut/decode/PC[19]} {dut/decode/PC[20]} {dut/decode/PC[21]} {dut/decode/PC[22]} {dut/decode/PC[23]} {dut/decode/PC[24]} {dut/decode/PC[25]} {dut/decode/PC[26]} {dut/decode/PC[27]} {dut/decode/PC[28]} {dut/decode/PC[29]} {dut/decode/PC[30]} {dut/decode/PC[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {dut/fetch/PCI[1][0]} {dut/fetch/PCI[1][1]} {dut/fetch/PCI[1][2]} {dut/fetch/PCI[1][3]} {dut/fetch/PCI[1][4]} {dut/fetch/PCI[1][5]} {dut/fetch/PCI[1][6]} {dut/fetch/PCI[1][7]} {dut/fetch/PCI[1][8]} {dut/fetch/PCI[1][9]} {dut/fetch/PCI[1][10]} {dut/fetch/PCI[1][11]} {dut/fetch/PCI[1][12]} {dut/fetch/PCI[1][13]} {dut/fetch/PCI[1][14]} {dut/fetch/PCI[1][15]} {dut/fetch/PCI[1][16]} {dut/fetch/PCI[1][17]} {dut/fetch/PCI[1][18]} {dut/fetch/PCI[1][19]} {dut/fetch/PCI[1][20]} {dut/fetch/PCI[1][21]} {dut/fetch/PCI[1][22]} {dut/fetch/PCI[1][23]} {dut/fetch/PCI[1][24]} {dut/fetch/PCI[1][25]} {dut/fetch/PCI[1][26]} {dut/fetch/PCI[1][27]} {dut/fetch/PCI[1][28]} {dut/fetch/PCI[1][29]} {dut/fetch/PCI[1][30]} {dut/fetch/PCI[1][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {dut/fetch/SpawnTarget[0]} {dut/fetch/SpawnTarget[1]} {dut/fetch/SpawnTarget[2]} {dut/fetch/SpawnTarget[3]} {dut/fetch/SpawnTarget[4]} {dut/fetch/SpawnTarget[5]} {dut/fetch/SpawnTarget[6]} {dut/fetch/SpawnTarget[7]} {dut/fetch/SpawnTarget[8]} {dut/fetch/SpawnTarget[9]} {dut/fetch/SpawnTarget[10]} {dut/fetch/SpawnTarget[11]} {dut/fetch/SpawnTarget[12]} {dut/fetch/SpawnTarget[13]} {dut/fetch/SpawnTarget[14]} {dut/fetch/SpawnTarget[15]} {dut/fetch/SpawnTarget[16]} {dut/fetch/SpawnTarget[17]} {dut/fetch/SpawnTarget[18]} {dut/fetch/SpawnTarget[19]} {dut/fetch/SpawnTarget[20]} {dut/fetch/SpawnTarget[21]} {dut/fetch/SpawnTarget[22]} {dut/fetch/SpawnTarget[23]} {dut/fetch/SpawnTarget[24]} {dut/fetch/SpawnTarget[25]} {dut/fetch/SpawnTarget[26]} {dut/fetch/SpawnTarget[27]} {dut/fetch/SpawnTarget[28]} {dut/fetch/SpawnTarget[29]} {dut/fetch/SpawnTarget[30]} {dut/fetch/SpawnTarget[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 2 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {dut/fetch/ThreadTagI[0]} {dut/fetch/ThreadTagI[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 2 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {dut/fetch/SpawnThread[0]} {dut/fetch/SpawnThread[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 2 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {dut/decode/ThreadTag[0]} {dut/decode/ThreadTag[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {dut/fetch/PCNext[2][0]} {dut/fetch/PCNext[2][1]} {dut/fetch/PCNext[2][2]} {dut/fetch/PCNext[2][3]} {dut/fetch/PCNext[2][4]} {dut/fetch/PCNext[2][5]} {dut/fetch/PCNext[2][6]} {dut/fetch/PCNext[2][7]} {dut/fetch/PCNext[2][8]} {dut/fetch/PCNext[2][9]} {dut/fetch/PCNext[2][10]} {dut/fetch/PCNext[2][11]} {dut/fetch/PCNext[2][12]} {dut/fetch/PCNext[2][13]} {dut/fetch/PCNext[2][14]} {dut/fetch/PCNext[2][15]} {dut/fetch/PCNext[2][16]} {dut/fetch/PCNext[2][17]} {dut/fetch/PCNext[2][18]} {dut/fetch/PCNext[2][19]} {dut/fetch/PCNext[2][20]} {dut/fetch/PCNext[2][21]} {dut/fetch/PCNext[2][22]} {dut/fetch/PCNext[2][23]} {dut/fetch/PCNext[2][24]} {dut/fetch/PCNext[2][25]} {dut/fetch/PCNext[2][26]} {dut/fetch/PCNext[2][27]} {dut/fetch/PCNext[2][28]} {dut/fetch/PCNext[2][29]} {dut/fetch/PCNext[2][30]} {dut/fetch/PCNext[2][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {dut/decode/SpawnThread[0]} {dut/decode/SpawnThread[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {dut/ID_RegData1[0]} {dut/ID_RegData1[1]} {dut/ID_RegData1[2]} {dut/ID_RegData1[3]} {dut/ID_RegData1[4]} {dut/ID_RegData1[5]} {dut/ID_RegData1[6]} {dut/ID_RegData1[7]} {dut/ID_RegData1[8]} {dut/ID_RegData1[9]} {dut/ID_RegData1[10]} {dut/ID_RegData1[11]} {dut/ID_RegData1[12]} {dut/ID_RegData1[13]} {dut/ID_RegData1[14]} {dut/ID_RegData1[15]} {dut/ID_RegData1[16]} {dut/ID_RegData1[17]} {dut/ID_RegData1[18]} {dut/ID_RegData1[19]} {dut/ID_RegData1[20]} {dut/ID_RegData1[21]} {dut/ID_RegData1[22]} {dut/ID_RegData1[23]} {dut/ID_RegData1[24]} {dut/ID_RegData1[25]} {dut/ID_RegData1[26]} {dut/ID_RegData1[27]} {dut/ID_RegData1[28]} {dut/ID_RegData1[29]} {dut/ID_RegData1[30]} {dut/ID_RegData1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {dut/ID_PC[0]} {dut/ID_PC[1]} {dut/ID_PC[2]} {dut/ID_PC[3]} {dut/ID_PC[4]} {dut/ID_PC[5]} {dut/ID_PC[6]} {dut/ID_PC[7]} {dut/ID_PC[8]} {dut/ID_PC[9]} {dut/ID_PC[10]} {dut/ID_PC[11]} {dut/ID_PC[12]} {dut/ID_PC[13]} {dut/ID_PC[14]} {dut/ID_PC[15]} {dut/ID_PC[16]} {dut/ID_PC[17]} {dut/ID_PC[18]} {dut/ID_PC[19]} {dut/ID_PC[20]} {dut/ID_PC[21]} {dut/ID_PC[22]} {dut/ID_PC[23]} {dut/ID_PC[24]} {dut/ID_PC[25]} {dut/ID_PC[26]} {dut/ID_PC[27]} {dut/ID_PC[28]} {dut/ID_PC[29]} {dut/ID_PC[30]} {dut/ID_PC[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {dut/ID_RegData2[0]} {dut/ID_RegData2[1]} {dut/ID_RegData2[2]} {dut/ID_RegData2[3]} {dut/ID_RegData2[4]} {dut/ID_RegData2[5]} {dut/ID_RegData2[6]} {dut/ID_RegData2[7]} {dut/ID_RegData2[8]} {dut/ID_RegData2[9]} {dut/ID_RegData2[10]} {dut/ID_RegData2[11]} {dut/ID_RegData2[12]} {dut/ID_RegData2[13]} {dut/ID_RegData2[14]} {dut/ID_RegData2[15]} {dut/ID_RegData2[16]} {dut/ID_RegData2[17]} {dut/ID_RegData2[18]} {dut/ID_RegData2[19]} {dut/ID_RegData2[20]} {dut/ID_RegData2[21]} {dut/ID_RegData2[22]} {dut/ID_RegData2[23]} {dut/ID_RegData2[24]} {dut/ID_RegData2[25]} {dut/ID_RegData2[26]} {dut/ID_RegData2[27]} {dut/ID_RegData2[28]} {dut/ID_RegData2[29]} {dut/ID_RegData2[30]} {dut/ID_RegData2[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 5 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {dut/ID_SrcReg1[0]} {dut/ID_SrcReg1[1]} {dut/ID_SrcReg1[2]} {dut/ID_SrcReg1[3]} {dut/ID_SrcReg1[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 5 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {dut/ID_SrcReg2[0]} {dut/ID_SrcReg2[1]} {dut/ID_SrcReg2[2]} {dut/ID_SrcReg2[3]} {dut/ID_SrcReg2[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 32 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {dut/IF_ID_PC[0]} {dut/IF_ID_PC[1]} {dut/IF_ID_PC[2]} {dut/IF_ID_PC[3]} {dut/IF_ID_PC[4]} {dut/IF_ID_PC[5]} {dut/IF_ID_PC[6]} {dut/IF_ID_PC[7]} {dut/IF_ID_PC[8]} {dut/IF_ID_PC[9]} {dut/IF_ID_PC[10]} {dut/IF_ID_PC[11]} {dut/IF_ID_PC[12]} {dut/IF_ID_PC[13]} {dut/IF_ID_PC[14]} {dut/IF_ID_PC[15]} {dut/IF_ID_PC[16]} {dut/IF_ID_PC[17]} {dut/IF_ID_PC[18]} {dut/IF_ID_PC[19]} {dut/IF_ID_PC[20]} {dut/IF_ID_PC[21]} {dut/IF_ID_PC[22]} {dut/IF_ID_PC[23]} {dut/IF_ID_PC[24]} {dut/IF_ID_PC[25]} {dut/IF_ID_PC[26]} {dut/IF_ID_PC[27]} {dut/IF_ID_PC[28]} {dut/IF_ID_PC[29]} {dut/IF_ID_PC[30]} {dut/IF_ID_PC[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 2 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {dut/IF_ThreadTag[0]} {dut/IF_ThreadTag[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {dut/MEM_DestData[0]} {dut/MEM_DestData[1]} {dut/MEM_DestData[2]} {dut/MEM_DestData[3]} {dut/MEM_DestData[4]} {dut/MEM_DestData[5]} {dut/MEM_DestData[6]} {dut/MEM_DestData[7]} {dut/MEM_DestData[8]} {dut/MEM_DestData[9]} {dut/MEM_DestData[10]} {dut/MEM_DestData[11]} {dut/MEM_DestData[12]} {dut/MEM_DestData[13]} {dut/MEM_DestData[14]} {dut/MEM_DestData[15]} {dut/MEM_DestData[16]} {dut/MEM_DestData[17]} {dut/MEM_DestData[18]} {dut/MEM_DestData[19]} {dut/MEM_DestData[20]} {dut/MEM_DestData[21]} {dut/MEM_DestData[22]} {dut/MEM_DestData[23]} {dut/MEM_DestData[24]} {dut/MEM_DestData[25]} {dut/MEM_DestData[26]} {dut/MEM_DestData[27]} {dut/MEM_DestData[28]} {dut/MEM_DestData[29]} {dut/MEM_DestData[30]} {dut/MEM_DestData[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 5 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {dut/MEM_DestRegNo[0]} {dut/MEM_DestRegNo[1]} {dut/MEM_DestRegNo[2]} {dut/MEM_DestRegNo[3]} {dut/MEM_DestRegNo[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {dut/ID_IF_Interlock[ThreadTag][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 32 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {dut/ID_Inst[0]} {dut/ID_Inst[1]} {dut/ID_Inst[2]} {dut/ID_Inst[3]} {dut/ID_Inst[4]} {dut/ID_Inst[5]} {dut/ID_Inst[6]} {dut/ID_Inst[7]} {dut/ID_Inst[8]} {dut/ID_Inst[9]} {dut/ID_Inst[10]} {dut/ID_Inst[11]} {dut/ID_Inst[12]} {dut/ID_Inst[13]} {dut/ID_Inst[14]} {dut/ID_Inst[15]} {dut/ID_Inst[16]} {dut/ID_Inst[17]} {dut/ID_Inst[18]} {dut/ID_Inst[19]} {dut/ID_Inst[20]} {dut/ID_Inst[21]} {dut/ID_Inst[22]} {dut/ID_Inst[23]} {dut/ID_Inst[24]} {dut/ID_Inst[25]} {dut/ID_Inst[26]} {dut/ID_Inst[27]} {dut/ID_Inst[28]} {dut/ID_Inst[29]} {dut/ID_Inst[30]} {dut/ID_Inst[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 32 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {dut/regset/RegisterSets_reg[0][10]_83[0]} {dut/regset/RegisterSets_reg[0][10]_83[1]} {dut/regset/RegisterSets_reg[0][10]_83[2]} {dut/regset/RegisterSets_reg[0][10]_83[3]} {dut/regset/RegisterSets_reg[0][10]_83[4]} {dut/regset/RegisterSets_reg[0][10]_83[5]} {dut/regset/RegisterSets_reg[0][10]_83[6]} {dut/regset/RegisterSets_reg[0][10]_83[7]} {dut/regset/RegisterSets_reg[0][10]_83[8]} {dut/regset/RegisterSets_reg[0][10]_83[9]} {dut/regset/RegisterSets_reg[0][10]_83[10]} {dut/regset/RegisterSets_reg[0][10]_83[11]} {dut/regset/RegisterSets_reg[0][10]_83[12]} {dut/regset/RegisterSets_reg[0][10]_83[13]} {dut/regset/RegisterSets_reg[0][10]_83[14]} {dut/regset/RegisterSets_reg[0][10]_83[15]} {dut/regset/RegisterSets_reg[0][10]_83[16]} {dut/regset/RegisterSets_reg[0][10]_83[17]} {dut/regset/RegisterSets_reg[0][10]_83[18]} {dut/regset/RegisterSets_reg[0][10]_83[19]} {dut/regset/RegisterSets_reg[0][10]_83[20]} {dut/regset/RegisterSets_reg[0][10]_83[21]} {dut/regset/RegisterSets_reg[0][10]_83[22]} {dut/regset/RegisterSets_reg[0][10]_83[23]} {dut/regset/RegisterSets_reg[0][10]_83[24]} {dut/regset/RegisterSets_reg[0][10]_83[25]} {dut/regset/RegisterSets_reg[0][10]_83[26]} {dut/regset/RegisterSets_reg[0][10]_83[27]} {dut/regset/RegisterSets_reg[0][10]_83[28]} {dut/regset/RegisterSets_reg[0][10]_83[29]} {dut/regset/RegisterSets_reg[0][10]_83[30]} {dut/regset/RegisterSets_reg[0][10]_83[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 32 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {dut/regset/RegisterSets_reg[0][1]_56[0]} {dut/regset/RegisterSets_reg[0][1]_56[1]} {dut/regset/RegisterSets_reg[0][1]_56[2]} {dut/regset/RegisterSets_reg[0][1]_56[3]} {dut/regset/RegisterSets_reg[0][1]_56[4]} {dut/regset/RegisterSets_reg[0][1]_56[5]} {dut/regset/RegisterSets_reg[0][1]_56[6]} {dut/regset/RegisterSets_reg[0][1]_56[7]} {dut/regset/RegisterSets_reg[0][1]_56[8]} {dut/regset/RegisterSets_reg[0][1]_56[9]} {dut/regset/RegisterSets_reg[0][1]_56[10]} {dut/regset/RegisterSets_reg[0][1]_56[11]} {dut/regset/RegisterSets_reg[0][1]_56[12]} {dut/regset/RegisterSets_reg[0][1]_56[13]} {dut/regset/RegisterSets_reg[0][1]_56[14]} {dut/regset/RegisterSets_reg[0][1]_56[15]} {dut/regset/RegisterSets_reg[0][1]_56[16]} {dut/regset/RegisterSets_reg[0][1]_56[17]} {dut/regset/RegisterSets_reg[0][1]_56[18]} {dut/regset/RegisterSets_reg[0][1]_56[19]} {dut/regset/RegisterSets_reg[0][1]_56[20]} {dut/regset/RegisterSets_reg[0][1]_56[21]} {dut/regset/RegisterSets_reg[0][1]_56[22]} {dut/regset/RegisterSets_reg[0][1]_56[23]} {dut/regset/RegisterSets_reg[0][1]_56[24]} {dut/regset/RegisterSets_reg[0][1]_56[25]} {dut/regset/RegisterSets_reg[0][1]_56[26]} {dut/regset/RegisterSets_reg[0][1]_56[27]} {dut/regset/RegisterSets_reg[0][1]_56[28]} {dut/regset/RegisterSets_reg[0][1]_56[29]} {dut/regset/RegisterSets_reg[0][1]_56[30]} {dut/regset/RegisterSets_reg[0][1]_56[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 32 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {dut/regset/RegisterSets_reg[1][10]_82[0]} {dut/regset/RegisterSets_reg[1][10]_82[1]} {dut/regset/RegisterSets_reg[1][10]_82[2]} {dut/regset/RegisterSets_reg[1][10]_82[3]} {dut/regset/RegisterSets_reg[1][10]_82[4]} {dut/regset/RegisterSets_reg[1][10]_82[5]} {dut/regset/RegisterSets_reg[1][10]_82[6]} {dut/regset/RegisterSets_reg[1][10]_82[7]} {dut/regset/RegisterSets_reg[1][10]_82[8]} {dut/regset/RegisterSets_reg[1][10]_82[9]} {dut/regset/RegisterSets_reg[1][10]_82[10]} {dut/regset/RegisterSets_reg[1][10]_82[11]} {dut/regset/RegisterSets_reg[1][10]_82[12]} {dut/regset/RegisterSets_reg[1][10]_82[13]} {dut/regset/RegisterSets_reg[1][10]_82[14]} {dut/regset/RegisterSets_reg[1][10]_82[15]} {dut/regset/RegisterSets_reg[1][10]_82[16]} {dut/regset/RegisterSets_reg[1][10]_82[17]} {dut/regset/RegisterSets_reg[1][10]_82[18]} {dut/regset/RegisterSets_reg[1][10]_82[19]} {dut/regset/RegisterSets_reg[1][10]_82[20]} {dut/regset/RegisterSets_reg[1][10]_82[21]} {dut/regset/RegisterSets_reg[1][10]_82[22]} {dut/regset/RegisterSets_reg[1][10]_82[23]} {dut/regset/RegisterSets_reg[1][10]_82[24]} {dut/regset/RegisterSets_reg[1][10]_82[25]} {dut/regset/RegisterSets_reg[1][10]_82[26]} {dut/regset/RegisterSets_reg[1][10]_82[27]} {dut/regset/RegisterSets_reg[1][10]_82[28]} {dut/regset/RegisterSets_reg[1][10]_82[29]} {dut/regset/RegisterSets_reg[1][10]_82[30]} {dut/regset/RegisterSets_reg[1][10]_82[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 32 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {dut/regset/RegisterSets_reg[1][1]_55[0]} {dut/regset/RegisterSets_reg[1][1]_55[1]} {dut/regset/RegisterSets_reg[1][1]_55[2]} {dut/regset/RegisterSets_reg[1][1]_55[3]} {dut/regset/RegisterSets_reg[1][1]_55[4]} {dut/regset/RegisterSets_reg[1][1]_55[5]} {dut/regset/RegisterSets_reg[1][1]_55[6]} {dut/regset/RegisterSets_reg[1][1]_55[7]} {dut/regset/RegisterSets_reg[1][1]_55[8]} {dut/regset/RegisterSets_reg[1][1]_55[9]} {dut/regset/RegisterSets_reg[1][1]_55[10]} {dut/regset/RegisterSets_reg[1][1]_55[11]} {dut/regset/RegisterSets_reg[1][1]_55[12]} {dut/regset/RegisterSets_reg[1][1]_55[13]} {dut/regset/RegisterSets_reg[1][1]_55[14]} {dut/regset/RegisterSets_reg[1][1]_55[15]} {dut/regset/RegisterSets_reg[1][1]_55[16]} {dut/regset/RegisterSets_reg[1][1]_55[17]} {dut/regset/RegisterSets_reg[1][1]_55[18]} {dut/regset/RegisterSets_reg[1][1]_55[19]} {dut/regset/RegisterSets_reg[1][1]_55[20]} {dut/regset/RegisterSets_reg[1][1]_55[21]} {dut/regset/RegisterSets_reg[1][1]_55[22]} {dut/regset/RegisterSets_reg[1][1]_55[23]} {dut/regset/RegisterSets_reg[1][1]_55[24]} {dut/regset/RegisterSets_reg[1][1]_55[25]} {dut/regset/RegisterSets_reg[1][1]_55[26]} {dut/regset/RegisterSets_reg[1][1]_55[27]} {dut/regset/RegisterSets_reg[1][1]_55[28]} {dut/regset/RegisterSets_reg[1][1]_55[29]} {dut/regset/RegisterSets_reg[1][1]_55[30]} {dut/regset/RegisterSets_reg[1][1]_55[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 32 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {dut/regset/RegisterSets_reg[2][10]_81[0]} {dut/regset/RegisterSets_reg[2][10]_81[1]} {dut/regset/RegisterSets_reg[2][10]_81[2]} {dut/regset/RegisterSets_reg[2][10]_81[3]} {dut/regset/RegisterSets_reg[2][10]_81[4]} {dut/regset/RegisterSets_reg[2][10]_81[5]} {dut/regset/RegisterSets_reg[2][10]_81[6]} {dut/regset/RegisterSets_reg[2][10]_81[7]} {dut/regset/RegisterSets_reg[2][10]_81[8]} {dut/regset/RegisterSets_reg[2][10]_81[9]} {dut/regset/RegisterSets_reg[2][10]_81[10]} {dut/regset/RegisterSets_reg[2][10]_81[11]} {dut/regset/RegisterSets_reg[2][10]_81[12]} {dut/regset/RegisterSets_reg[2][10]_81[13]} {dut/regset/RegisterSets_reg[2][10]_81[14]} {dut/regset/RegisterSets_reg[2][10]_81[15]} {dut/regset/RegisterSets_reg[2][10]_81[16]} {dut/regset/RegisterSets_reg[2][10]_81[17]} {dut/regset/RegisterSets_reg[2][10]_81[18]} {dut/regset/RegisterSets_reg[2][10]_81[19]} {dut/regset/RegisterSets_reg[2][10]_81[20]} {dut/regset/RegisterSets_reg[2][10]_81[21]} {dut/regset/RegisterSets_reg[2][10]_81[22]} {dut/regset/RegisterSets_reg[2][10]_81[23]} {dut/regset/RegisterSets_reg[2][10]_81[24]} {dut/regset/RegisterSets_reg[2][10]_81[25]} {dut/regset/RegisterSets_reg[2][10]_81[26]} {dut/regset/RegisterSets_reg[2][10]_81[27]} {dut/regset/RegisterSets_reg[2][10]_81[28]} {dut/regset/RegisterSets_reg[2][10]_81[29]} {dut/regset/RegisterSets_reg[2][10]_81[30]} {dut/regset/RegisterSets_reg[2][10]_81[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 32 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {dut/regset/RegisterSets_reg[2][1]_54[0]} {dut/regset/RegisterSets_reg[2][1]_54[1]} {dut/regset/RegisterSets_reg[2][1]_54[2]} {dut/regset/RegisterSets_reg[2][1]_54[3]} {dut/regset/RegisterSets_reg[2][1]_54[4]} {dut/regset/RegisterSets_reg[2][1]_54[5]} {dut/regset/RegisterSets_reg[2][1]_54[6]} {dut/regset/RegisterSets_reg[2][1]_54[7]} {dut/regset/RegisterSets_reg[2][1]_54[8]} {dut/regset/RegisterSets_reg[2][1]_54[9]} {dut/regset/RegisterSets_reg[2][1]_54[10]} {dut/regset/RegisterSets_reg[2][1]_54[11]} {dut/regset/RegisterSets_reg[2][1]_54[12]} {dut/regset/RegisterSets_reg[2][1]_54[13]} {dut/regset/RegisterSets_reg[2][1]_54[14]} {dut/regset/RegisterSets_reg[2][1]_54[15]} {dut/regset/RegisterSets_reg[2][1]_54[16]} {dut/regset/RegisterSets_reg[2][1]_54[17]} {dut/regset/RegisterSets_reg[2][1]_54[18]} {dut/regset/RegisterSets_reg[2][1]_54[19]} {dut/regset/RegisterSets_reg[2][1]_54[20]} {dut/regset/RegisterSets_reg[2][1]_54[21]} {dut/regset/RegisterSets_reg[2][1]_54[22]} {dut/regset/RegisterSets_reg[2][1]_54[23]} {dut/regset/RegisterSets_reg[2][1]_54[24]} {dut/regset/RegisterSets_reg[2][1]_54[25]} {dut/regset/RegisterSets_reg[2][1]_54[26]} {dut/regset/RegisterSets_reg[2][1]_54[27]} {dut/regset/RegisterSets_reg[2][1]_54[28]} {dut/regset/RegisterSets_reg[2][1]_54[29]} {dut/regset/RegisterSets_reg[2][1]_54[30]} {dut/regset/RegisterSets_reg[2][1]_54[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 2 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {dut/fetch/ThreadTagNext[0]} {dut/fetch/ThreadTagNext[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 32 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {dut/EX_DestData[0]} {dut/EX_DestData[1]} {dut/EX_DestData[2]} {dut/EX_DestData[3]} {dut/EX_DestData[4]} {dut/EX_DestData[5]} {dut/EX_DestData[6]} {dut/EX_DestData[7]} {dut/EX_DestData[8]} {dut/EX_DestData[9]} {dut/EX_DestData[10]} {dut/EX_DestData[11]} {dut/EX_DestData[12]} {dut/EX_DestData[13]} {dut/EX_DestData[14]} {dut/EX_DestData[15]} {dut/EX_DestData[16]} {dut/EX_DestData[17]} {dut/EX_DestData[18]} {dut/EX_DestData[19]} {dut/EX_DestData[20]} {dut/EX_DestData[21]} {dut/EX_DestData[22]} {dut/EX_DestData[23]} {dut/EX_DestData[24]} {dut/EX_DestData[25]} {dut/EX_DestData[26]} {dut/EX_DestData[27]} {dut/EX_DestData[28]} {dut/EX_DestData[29]} {dut/EX_DestData[30]} {dut/EX_DestData[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 32 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {dut/EX_IF_JumpTarget[0]} {dut/EX_IF_JumpTarget[1]} {dut/EX_IF_JumpTarget[2]} {dut/EX_IF_JumpTarget[3]} {dut/EX_IF_JumpTarget[4]} {dut/EX_IF_JumpTarget[5]} {dut/EX_IF_JumpTarget[6]} {dut/EX_IF_JumpTarget[7]} {dut/EX_IF_JumpTarget[8]} {dut/EX_IF_JumpTarget[9]} {dut/EX_IF_JumpTarget[10]} {dut/EX_IF_JumpTarget[11]} {dut/EX_IF_JumpTarget[12]} {dut/EX_IF_JumpTarget[13]} {dut/EX_IF_JumpTarget[14]} {dut/EX_IF_JumpTarget[15]} {dut/EX_IF_JumpTarget[16]} {dut/EX_IF_JumpTarget[17]} {dut/EX_IF_JumpTarget[18]} {dut/EX_IF_JumpTarget[19]} {dut/EX_IF_JumpTarget[20]} {dut/EX_IF_JumpTarget[21]} {dut/EX_IF_JumpTarget[22]} {dut/EX_IF_JumpTarget[23]} {dut/EX_IF_JumpTarget[24]} {dut/EX_IF_JumpTarget[25]} {dut/EX_IF_JumpTarget[26]} {dut/EX_IF_JumpTarget[27]} {dut/EX_IF_JumpTarget[28]} {dut/EX_IF_JumpTarget[29]} {dut/EX_IF_JumpTarget[30]} {dut/EX_IF_JumpTarget[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 5 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {dut/EX_DestRegNo[0]} {dut/EX_DestRegNo[1]} {dut/EX_DestRegNo[2]} {dut/EX_DestRegNo[3]} {dut/EX_DestRegNo[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 32 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {dut/EX_IF_SpawnTarget[0]} {dut/EX_IF_SpawnTarget[1]} {dut/EX_IF_SpawnTarget[2]} {dut/EX_IF_SpawnTarget[3]} {dut/EX_IF_SpawnTarget[4]} {dut/EX_IF_SpawnTarget[5]} {dut/EX_IF_SpawnTarget[6]} {dut/EX_IF_SpawnTarget[7]} {dut/EX_IF_SpawnTarget[8]} {dut/EX_IF_SpawnTarget[9]} {dut/EX_IF_SpawnTarget[10]} {dut/EX_IF_SpawnTarget[11]} {dut/EX_IF_SpawnTarget[12]} {dut/EX_IF_SpawnTarget[13]} {dut/EX_IF_SpawnTarget[14]} {dut/EX_IF_SpawnTarget[15]} {dut/EX_IF_SpawnTarget[16]} {dut/EX_IF_SpawnTarget[17]} {dut/EX_IF_SpawnTarget[18]} {dut/EX_IF_SpawnTarget[19]} {dut/EX_IF_SpawnTarget[20]} {dut/EX_IF_SpawnTarget[21]} {dut/EX_IF_SpawnTarget[22]} {dut/EX_IF_SpawnTarget[23]} {dut/EX_IF_SpawnTarget[24]} {dut/EX_IF_SpawnTarget[25]} {dut/EX_IF_SpawnTarget[26]} {dut/EX_IF_SpawnTarget[27]} {dut/EX_IF_SpawnTarget[28]} {dut/EX_IF_SpawnTarget[29]} {dut/EX_IF_SpawnTarget[30]} {dut/EX_IF_SpawnTarget[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {dut/EX_IF_SpawnThread[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 32 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {dut/EX_Imm[0]} {dut/EX_Imm[1]} {dut/EX_Imm[2]} {dut/EX_Imm[3]} {dut/EX_Imm[4]} {dut/EX_Imm[5]} {dut/EX_Imm[6]} {dut/EX_Imm[7]} {dut/EX_Imm[8]} {dut/EX_Imm[9]} {dut/EX_Imm[10]} {dut/EX_Imm[11]} {dut/EX_Imm[12]} {dut/EX_Imm[13]} {dut/EX_Imm[14]} {dut/EX_Imm[15]} {dut/EX_Imm[16]} {dut/EX_Imm[17]} {dut/EX_Imm[18]} {dut/EX_Imm[19]} {dut/EX_Imm[20]} {dut/EX_Imm[21]} {dut/EX_Imm[22]} {dut/EX_Imm[23]} {dut/EX_Imm[24]} {dut/EX_Imm[25]} {dut/EX_Imm[26]} {dut/EX_Imm[27]} {dut/EX_Imm[28]} {dut/EX_Imm[29]} {dut/EX_Imm[30]} {dut/EX_Imm[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 2 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {dut/EX_JumpO[ThreadTag][0]} {dut/EX_JumpO[ThreadTag][1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 32 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {dut/EX_SrcData1[0]} {dut/EX_SrcData1[1]} {dut/EX_SrcData1[2]} {dut/EX_SrcData1[3]} {dut/EX_SrcData1[4]} {dut/EX_SrcData1[5]} {dut/EX_SrcData1[6]} {dut/EX_SrcData1[7]} {dut/EX_SrcData1[8]} {dut/EX_SrcData1[9]} {dut/EX_SrcData1[10]} {dut/EX_SrcData1[11]} {dut/EX_SrcData1[12]} {dut/EX_SrcData1[13]} {dut/EX_SrcData1[14]} {dut/EX_SrcData1[15]} {dut/EX_SrcData1[16]} {dut/EX_SrcData1[17]} {dut/EX_SrcData1[18]} {dut/EX_SrcData1[19]} {dut/EX_SrcData1[20]} {dut/EX_SrcData1[21]} {dut/EX_SrcData1[22]} {dut/EX_SrcData1[23]} {dut/EX_SrcData1[24]} {dut/EX_SrcData1[25]} {dut/EX_SrcData1[26]} {dut/EX_SrcData1[27]} {dut/EX_SrcData1[28]} {dut/EX_SrcData1[29]} {dut/EX_SrcData1[30]} {dut/EX_SrcData1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 32 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {dut/EX_SrcData2[0]} {dut/EX_SrcData2[1]} {dut/EX_SrcData2[2]} {dut/EX_SrcData2[3]} {dut/EX_SrcData2[4]} {dut/EX_SrcData2[5]} {dut/EX_SrcData2[6]} {dut/EX_SrcData2[7]} {dut/EX_SrcData2[8]} {dut/EX_SrcData2[9]} {dut/EX_SrcData2[10]} {dut/EX_SrcData2[11]} {dut/EX_SrcData2[12]} {dut/EX_SrcData2[13]} {dut/EX_SrcData2[14]} {dut/EX_SrcData2[15]} {dut/EX_SrcData2[16]} {dut/EX_SrcData2[17]} {dut/EX_SrcData2[18]} {dut/EX_SrcData2[19]} {dut/EX_SrcData2[20]} {dut/EX_SrcData2[21]} {dut/EX_SrcData2[22]} {dut/EX_SrcData2[23]} {dut/EX_SrcData2[24]} {dut/EX_SrcData2[25]} {dut/EX_SrcData2[26]} {dut/EX_SrcData2[27]} {dut/EX_SrcData2[28]} {dut/EX_SrcData2[29]} {dut/EX_SrcData2[30]} {dut/EX_SrcData2[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 1 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {dut/EX_SpawnThread[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 2 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {dut/EX_ThreadTag[0]} {dut/EX_ThreadTag[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 32 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {dut/ID_EX_Data1[0]} {dut/ID_EX_Data1[1]} {dut/ID_EX_Data1[2]} {dut/ID_EX_Data1[3]} {dut/ID_EX_Data1[4]} {dut/ID_EX_Data1[5]} {dut/ID_EX_Data1[6]} {dut/ID_EX_Data1[7]} {dut/ID_EX_Data1[8]} {dut/ID_EX_Data1[9]} {dut/ID_EX_Data1[10]} {dut/ID_EX_Data1[11]} {dut/ID_EX_Data1[12]} {dut/ID_EX_Data1[13]} {dut/ID_EX_Data1[14]} {dut/ID_EX_Data1[15]} {dut/ID_EX_Data1[16]} {dut/ID_EX_Data1[17]} {dut/ID_EX_Data1[18]} {dut/ID_EX_Data1[19]} {dut/ID_EX_Data1[20]} {dut/ID_EX_Data1[21]} {dut/ID_EX_Data1[22]} {dut/ID_EX_Data1[23]} {dut/ID_EX_Data1[24]} {dut/ID_EX_Data1[25]} {dut/ID_EX_Data1[26]} {dut/ID_EX_Data1[27]} {dut/ID_EX_Data1[28]} {dut/ID_EX_Data1[29]} {dut/ID_EX_Data1[30]} {dut/ID_EX_Data1[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 32 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {dut/ID_EX_Data2[0]} {dut/ID_EX_Data2[1]} {dut/ID_EX_Data2[2]} {dut/ID_EX_Data2[3]} {dut/ID_EX_Data2[4]} {dut/ID_EX_Data2[5]} {dut/ID_EX_Data2[6]} {dut/ID_EX_Data2[7]} {dut/ID_EX_Data2[8]} {dut/ID_EX_Data2[9]} {dut/ID_EX_Data2[10]} {dut/ID_EX_Data2[11]} {dut/ID_EX_Data2[12]} {dut/ID_EX_Data2[13]} {dut/ID_EX_Data2[14]} {dut/ID_EX_Data2[15]} {dut/ID_EX_Data2[16]} {dut/ID_EX_Data2[17]} {dut/ID_EX_Data2[18]} {dut/ID_EX_Data2[19]} {dut/ID_EX_Data2[20]} {dut/ID_EX_Data2[21]} {dut/ID_EX_Data2[22]} {dut/ID_EX_Data2[23]} {dut/ID_EX_Data2[24]} {dut/ID_EX_Data2[25]} {dut/ID_EX_Data2[26]} {dut/ID_EX_Data2[27]} {dut/ID_EX_Data2[28]} {dut/ID_EX_Data2[29]} {dut/ID_EX_Data2[30]} {dut/ID_EX_Data2[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 32 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {dut/fetch/PCNext[1][0]} {dut/fetch/PCNext[1][1]} {dut/fetch/PCNext[1][2]} {dut/fetch/PCNext[1][3]} {dut/fetch/PCNext[1][4]} {dut/fetch/PCNext[1][5]} {dut/fetch/PCNext[1][6]} {dut/fetch/PCNext[1][7]} {dut/fetch/PCNext[1][8]} {dut/fetch/PCNext[1][9]} {dut/fetch/PCNext[1][10]} {dut/fetch/PCNext[1][11]} {dut/fetch/PCNext[1][12]} {dut/fetch/PCNext[1][13]} {dut/fetch/PCNext[1][14]} {dut/fetch/PCNext[1][15]} {dut/fetch/PCNext[1][16]} {dut/fetch/PCNext[1][17]} {dut/fetch/PCNext[1][18]} {dut/fetch/PCNext[1][19]} {dut/fetch/PCNext[1][20]} {dut/fetch/PCNext[1][21]} {dut/fetch/PCNext[1][22]} {dut/fetch/PCNext[1][23]} {dut/fetch/PCNext[1][24]} {dut/fetch/PCNext[1][25]} {dut/fetch/PCNext[1][26]} {dut/fetch/PCNext[1][27]} {dut/fetch/PCNext[1][28]} {dut/fetch/PCNext[1][29]} {dut/fetch/PCNext[1][30]} {dut/fetch/PCNext[1][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 32 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {dut/fetch/PCI[0]} {dut/fetch/PCI[1]} {dut/fetch/PCI[2]} {dut/fetch/PCI[3]} {dut/fetch/PCI[4]} {dut/fetch/PCI[5]} {dut/fetch/PCI[6]} {dut/fetch/PCI[7]} {dut/fetch/PCI[8]} {dut/fetch/PCI[9]} {dut/fetch/PCI[10]} {dut/fetch/PCI[11]} {dut/fetch/PCI[12]} {dut/fetch/PCI[13]} {dut/fetch/PCI[14]} {dut/fetch/PCI[15]} {dut/fetch/PCI[16]} {dut/fetch/PCI[17]} {dut/fetch/PCI[18]} {dut/fetch/PCI[19]} {dut/fetch/PCI[20]} {dut/fetch/PCI[21]} {dut/fetch/PCI[22]} {dut/fetch/PCI[23]} {dut/fetch/PCI[24]} {dut/fetch/PCI[25]} {dut/fetch/PCI[26]} {dut/fetch/PCI[27]} {dut/fetch/PCI[28]} {dut/fetch/PCI[29]} {dut/fetch/PCI[30]} {dut/fetch/PCI[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 32 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {dut/fetch/PCI[0][0]} {dut/fetch/PCI[0][1]} {dut/fetch/PCI[0][2]} {dut/fetch/PCI[0][3]} {dut/fetch/PCI[0][4]} {dut/fetch/PCI[0][5]} {dut/fetch/PCI[0][6]} {dut/fetch/PCI[0][7]} {dut/fetch/PCI[0][8]} {dut/fetch/PCI[0][9]} {dut/fetch/PCI[0][10]} {dut/fetch/PCI[0][11]} {dut/fetch/PCI[0][12]} {dut/fetch/PCI[0][13]} {dut/fetch/PCI[0][14]} {dut/fetch/PCI[0][15]} {dut/fetch/PCI[0][16]} {dut/fetch/PCI[0][17]} {dut/fetch/PCI[0][18]} {dut/fetch/PCI[0][19]} {dut/fetch/PCI[0][20]} {dut/fetch/PCI[0][21]} {dut/fetch/PCI[0][22]} {dut/fetch/PCI[0][23]} {dut/fetch/PCI[0][24]} {dut/fetch/PCI[0][25]} {dut/fetch/PCI[0][26]} {dut/fetch/PCI[0][27]} {dut/fetch/PCI[0][28]} {dut/fetch/PCI[0][29]} {dut/fetch/PCI[0][30]} {dut/fetch/PCI[0][31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 32 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {dut/fetch/PCNext[0]} {dut/fetch/PCNext[1]} {dut/fetch/PCNext[2]} {dut/fetch/PCNext[3]} {dut/fetch/PCNext[4]} {dut/fetch/PCNext[5]} {dut/fetch/PCNext[6]} {dut/fetch/PCNext[7]} {dut/fetch/PCNext[8]} {dut/fetch/PCNext[9]} {dut/fetch/PCNext[10]} {dut/fetch/PCNext[11]} {dut/fetch/PCNext[12]} {dut/fetch/PCNext[13]} {dut/fetch/PCNext[14]} {dut/fetch/PCNext[15]} {dut/fetch/PCNext[16]} {dut/fetch/PCNext[17]} {dut/fetch/PCNext[18]} {dut/fetch/PCNext[19]} {dut/fetch/PCNext[20]} {dut/fetch/PCNext[21]} {dut/fetch/PCNext[22]} {dut/fetch/PCNext[23]} {dut/fetch/PCNext[24]} {dut/fetch/PCNext[25]} {dut/fetch/PCNext[26]} {dut/fetch/PCNext[27]} {dut/fetch/PCNext[28]} {dut/fetch/PCNext[29]} {dut/fetch/PCNext[30]} {dut/fetch/PCNext[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 1 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list dut/BTNR_inv]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 1 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list dut/EX_DestWrEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 1 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list dut/EX_JumpO]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 1 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list dut/EX_SelSrc2]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 1 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list dut/EX_SetThreadTag]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 1 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list dut/ID_Aux]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 1 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list dut/ID_IF_Interlock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 1 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list dut/MEM_DestWrEn]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 1 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list dut/MEM_Stall]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets GCLK_IBUF_BUFG]
