variable ipDir [file join [file dirname [file normalize [info script]]] ip]
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
        CONFIG.Use_Byte_Write_Enable {true} \
        CONFIG.Byte_Size {8} \
        CONFIG.Write_Width_A {32} \
        CONFIG.Write_Depth_A {1024} \
        CONFIG.Read_Width_A {32} \
        CONFIG.Write_Width_B {32} \
        CONFIG.Read_Width_B {32} \
        CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
        ] [get_ips memory]
}

generate_target all [get_ips]

synth_ip [get_ips]
