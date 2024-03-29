# Copyright 2022 Barcelona Supercomputing Center-Centro Nacional de Supercomputación

# Licensed under the Solderpad Hardware License v 2.1 (the "License");
# you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
# You may obtain a copy of the License at
#
#     http://www.solderpad.org/licenses/SHL-2.1
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Author: Ruben Cano, BSC-CNS
# Date: 22.02.2022
# Description:
# QSFP28 Interfaces
set_property -dict {LOC L53 } [get_ports qsfp_1x_grx_p] ; # MGTYRXP0_134 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10
set_property -dict {LOC L54 } [get_ports qsfp_1x_grx_n] ; # MGTYRXN0_134 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10
set_property -dict {LOC L48 } [get_ports qsfp_1x_gtx_p] ; # MGTYTXP0_134 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10
set_property -dict {LOC L49 } [get_ports qsfp_1x_gtx_n] ; # MGTYTXN0_134 GTYE4_CHANNEL_X0Y40 / GTYE4_COMMON_X0Y10

set_property -dict {LOC R40 } [get_ports qsfp_refclk_clk_p] ; # MGTREFCLK1P_134 from SI546
set_property -dict {LOC R41 } [get_ports qsfp_refclk_clk_n] ; # MGTREFCLK1N_134 from SI546

set_property -dict {LOC H32 IOSTANDARD LVCMOS18} [get_ports qsfp0_oe_b]
set_property -dict {LOC G32 IOSTANDARD LVCMOS18} [get_ports qsfp0_fs]

# 156.25 MHz MGT reference clock (from SI570)
#create_clock -period 6.400 -name qsfp0_mgt_refclk_0 [get_ports qsfp0_mgt_refclk_0_p]

# 156.25 MHz MGT reference clock (from SI546, fs = 0)
#create_clock -period 6.400 -name qsfp0_mgt_refclk_1 [get_ports qsfp0_mgt_refclk_1_p]

# 161.1328125 MHz MGT reference clock (from SI546, fs = 1)
create_clock -period 6.206 -name qsfp_refclk [get_ports qsfp_refclk_clk_p]

set_false_path -to [get_ports {qsfp0_oe_b qsfp0_fs}]
set_output_delay 0 [get_ports {qsfp0_oe_b qsfp0_fs}]

#set_false_path -from [get_pins -hierarchical -filter {NAME =~ interrupt*/C}]

