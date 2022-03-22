# load script
source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl




adi_project ad7771evb_zed 0 

adi_project_files ad7771evb_zed [list \
  "../../../library/axi_ad7771/ad7771_if.v " \
  "system_top.v" \
  "system_constr.xdc" \
  "$ad_hdl_dir/projects/common/zed/zed_system_constr.xdc" \
  "$ad_hdl_dir/library/common/ad_iobuf.v" ]


adi_project_run ad7771evb_zed