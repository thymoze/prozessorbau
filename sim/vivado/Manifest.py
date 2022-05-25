action = "simulation"
sim_tool = "vivado_sim"
sim_top = "processor_tb"

sim_post_cmd = "xsim %s -gui" % sim_top

modules = {
  "local" : [ "../../testbench/processor_tb" ],
}

