variable baseDir [file dirname [file normalize [info script]]]

create_project -force riscv [file join $baseDir project]
set_property "part" "xc7z020clg484-1" [current_project]
set_property "target_language" "VHDL" [current_project]
set_property "default_lib" "work" [current_project]

read_vhdl [glob -join -dir [file join $baseDir ../src/] * *.vhd]
read_vhdl [glob -join -dir [file join $baseDir ../src/test_files] hdl *.vhd]
read_vhdl [glob -join -dir [file join $baseDir ../testbench] * *.vhd]
read_vhdl [glob -join -dir [file join $baseDir ../top] *.vhd]
read_xdc [file join $baseDir ../top/zedboard.xdc]

source [file join $baseDir ip.tcl]

set_property top zedboard_top [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
