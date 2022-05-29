files = [
    "DecodeStage.vhd",
    "Decode.vhd",
    "RegisterSet.vhd",
    "Forward.vhd",

    "ExecuteStage.vhd",
    "ALU.vhd",

    "MemStage.vhd",

    "constants.vhd",
    "processor.vhd"
]

modules = {
    "local" : [
        "../inc10bit",
        "../mux",
        "../test/hdl"
    ],
}
