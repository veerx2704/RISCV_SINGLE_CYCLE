read_liberty $::env(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog results/riscv_netlist.v
link_design riscv_wrapper

read_sdc input_constraints.sdc

check_setup

report_checks -path_delay max -digits 4
report_checks -path_delay min -digits 4

report_wns
report_tns
report_power

