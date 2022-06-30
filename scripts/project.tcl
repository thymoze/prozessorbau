variable scriptDir [file dirname [file normalize [info script]]]
variable srcDir [file join $scriptDir ../src/]
variable testDir [file join $scriptDir ../testbench/]
variable topDir [file join $scriptDir ../top/]

create_project -force riscv [file join $scriptDir project]
set_property "part" "xc7z020clg484-1" [current_project]
set_property "target_language" "VHDL" [current_project]
set_property "default_lib" "work" [current_project]

read_vhdl [glob -join -dir $srcDir *.vhd]
read_vhdl [glob -join -dir $srcDir * *.vhd]
read_vhdl [glob -join -dir $srcDir * * *.vhd]
read_vhdl [glob -join -dir $srcDir test_files hdl *.vhd]

read_vhdl [glob -join -dir $testDir * *.vhd]

read_vhdl [glob -join -dir $topDir *.vhd]
read_xdc [file join $topDir zedboard.xdc]

source [file join $scriptDir ip.tcl]

set_property top zedboard_top [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
