variable baseDir [file normalize [file join [file dirname [file normalize [info script]]] ..]]
variable ipDir [file join $baseDir scripts ip]
file mkdir $ipDir

proc load_ip {name} {
    if { [file isdirectory [file join $::ipDir $name]] } {
        read_ip [file join $::ipDir $name "${name}.xci"]
        return 1
    } else {
        return 0
    }
}

if { ![load_ip memory] } {
    create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name memory -dir $ipDir
    set_property -dict [list \
        CONFIG.Component_Name {memory} \
        CONFIG.Use_Byte_Write_Enable {true} \
        CONFIG.Enable_32bit_Address {true} \
        CONFIG.Byte_Size {8} \
        CONFIG.Write_Width_A {32} \
        CONFIG.Write_Depth_A {2048} \
        CONFIG.Read_Width_A {32} \
        CONFIG.Write_Width_B {32} \
        CONFIG.Read_Width_B {32} \
        CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
        CONFIG.Use_RSTA_Pin {true} \
        CONFIG.EN_SAFETY_CKT {true} \
        ] [get_ips memory]
}

if { ![load_ip imemory] } {
    create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name imemory -dir $ipDir
    set_property -dict [list \
        CONFIG.Component_Name {imemory} \
        CONFIG.Memory_Type {Dual_Port_ROM} \
        CONFIG.Write_Width_A {32} \
        CONFIG.Write_Depth_A {1024} \
        CONFIG.Read_Width_A {32} \
        CONFIG.Enable_A {Use_ENA_Pin} \
        CONFIG.Write_Width_B {32} \
        CONFIG.Read_Width_B {32} \
        CONFIG.Enable_B {Always_Enabled} \
        CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
        CONFIG.Register_PortB_Output_of_Memory_Primitives {false} \
        CONFIG.Port_A_Write_Rate {0} \
        CONFIG.Port_B_Clock {100} \
        CONFIG.Port_B_Enable_Rate {100} \
        CONFIG.Load_Init_File {true} \
        CONFIG.Coe_File [ file join $baseDir src test_files hdl test108offset.coe ] \
        ] [get_ips imemory]
}

if { ![load_ip ram]} {
    create_ip -name axi_bram_ctrl -vendor xilinx.com -library ip -version 4.1 -module_name ram -dir $ipDir
    set_property -dict [list \
        CONFIG.PROTOCOL {AXI4LITE} \
        CONFIG.SUPPORTS_NARROW_BURST {0} \
        CONFIG.SINGLE_PORT_BRAM {1} \
        CONFIG.Component_Name {ram} \
        ] [get_ips ram]
}

generate_target all [get_ips]

# synth_ip [get_ips]
