# ip

source ../scripts/adi_env.tcl
source $ad_hdl_dir/library/scripts/adi_ip_xilinx.tcl

adi_ip_create axi_generic_adc
adi_ip_files axi_generic_adc [list \
  "$ad_hdl_dir/library/common/up_delay_cntrl.v" \
  "$ad_hdl_dir/library/xilinx/common/ad_rst_constr.xdc" \
  "$ad_hdl_dir/library/common/ad_rst.v" \
  "$ad_hdl_dir/library/common/up_axi.v" \
  "$ad_hdl_dir/library/common/up_xfer_cntrl.v" \
  "$ad_hdl_dir/library/common/up_xfer_status.v" \
  "$ad_hdl_dir/library/common/up_clock_mon.v" \
  "$ad_hdl_dir/library/common/up_adc_channel.v" \
  "$ad_hdl_dir/library/common/up_adc_common.v" \
  "axi_generic_adc.v" \
]

adi_ip_properties axi_generic_adc

ipx::infer_bus_interface adc_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]

ipx::infer_bus_interface delay_clk xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
adi_set_ports_dependency "delay_clk" \
	"(spirit:decode(id('MODELPARAM_VALUE.HAS_DELAY_CTRL')) = 1)"

adi_add_bus "delay_ctrl" "master" \
  "analog.com:interface:if_delay_ctrl_tx_rtl:1.0" \
  "analog.com:interface:if_delay_ctrl_tx:1.0" \
  { \
    { "delay_rst" "delay_rst" } \
    { "delay_locked" "delay_locked" } \
    { "up_dld" "up_dld" } \
    { "up_dwdata" "up_dwdata" } \
    { "up_drdata" "up_drdata" } \
  }

ipx::save_core [ipx::current_core]


