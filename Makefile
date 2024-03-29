ROOT_DIR  = $(PWD)
# taking default Xilinx install path if not propagated from environment var
VIVADO_VER    ?= 2021.2
XILINX_VIVADO ?= /opt/Xilinx/Vivado/$(VIVADO_VER)/
VIVADO_XLNX   := $(XILINX_VIVADO)/bin/vivado
VIVADO_OPT  := -mode batch -nolog -nojournal -notrace -source
FPGA_BOARD  ?= u55c

#Options: qsfp0, qsfp1, pcie

PORTS = qsfp0 qsfp1 pcie

all: qsfp0

#Generate the Ethernet IP

$(PORTS):
	@(echo "Generate 10Gb Ethernt IP for the Alveo $(FPGA_BOARD) and the port $@")
	$(VIVADO_XLNX) $(VIVADO_OPT)  ./tcl/gen_project.tcl -tclargs $(FPGA_BOARD) $@
	@(echo "IP created under folder $@")


clean:
	git clean -f
	@(cd ip; find . -type f ! -name "*.tcl" -exec rm -r {} \;)
	rm -rf xgui project qsfp* pcie



