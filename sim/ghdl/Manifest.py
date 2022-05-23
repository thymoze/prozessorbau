action = "simulation"
sim_tool = "ghdl"
sim_top = "processor_tb"

sim_post_cmd = "ghdl -r processor_tb --stop-time=6us --wave=processor_tb.ghw && gtkwave processor_tb.ghw"

modules = {
  "local" : [ "../../testbench/processor_tb" ],
}
