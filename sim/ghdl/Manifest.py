action = "simulation"
sim_tool = "ghdl"
sim_top = "processor_tb"

sim_post_cmd = "ghdl -r processor_tb --stop-time=6us --vcd=processor_tb.vcd && gtkwave processor_tb.vcd"

modules = {
  "local" : [ "../../testbench/processor_tb" ],
}
