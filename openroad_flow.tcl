########################################################################
# OpenROAD Flow Script for Sky130
########################################################################

############################
# Technology Files
############################

# EDIT THIS
set TECH_LEF "/home/veer_mukadam/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd__nom.tlef"

# EDIT THIS
set CELL_LEF "/home/veer_mukadam/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lef/sky130_fd_sc_hd.lef"

# EDIT THIS
set LIBERTY "/home/veer_mukadam/open_pdks/sky130/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"

############################
# Design Files
############################

# EDIT THIS
set NETLIST "./results/riscv_netlist.v"

# Top module name
set DESIGN "riscv_wrapper"

# EDIT THIS
set SDC "./input_constraints.sdc"

############################
# Read Technology
############################

read_lef $TECH_LEF
read_lef $CELL_LEF

read_liberty $LIBERTY

############################
# Read Design
############################

read_verilog $NETLIST
link_design $DESIGN

read_sdc $SDC

############################
# Floorplan
############################

initialize_floorplan \
    -site unithd \
    -die_area "0 0 1000 1000" \
    -core_area "100 100 900 900"

############################
# Placement
############################

place_pins \
	-random \
	-hor_layers met2 \
	-ver_layers met3

global_placement

detailed_placement

############################
# Clock Tree Synthesis
############################

clock_tree_synthesis

############################
# Routing
############################

global_route

detailed_route

############################
# Reports
############################

report_design_area

report_checks

report_wns

report_tns

############################
# Output
############################

write_def riscv.def

write_verilog riscv_postroute.v

puts "Flow Complete!"
