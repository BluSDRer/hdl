
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

set p_device "xc7z020clg400-1"
adi_project blusdr
adi_project_files blusdr [list \
  "$ad_hdl_dir/library/xilinx/common/ad_iobuf.v" \
  "../common/blusdr_constr.xdc" \
  "../common/blusdr_constr_lvds.xdc" \
  "../common/ccbob_constr.xdc" \
  "system_top.v" ]

adi_project_run blusdr
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl

