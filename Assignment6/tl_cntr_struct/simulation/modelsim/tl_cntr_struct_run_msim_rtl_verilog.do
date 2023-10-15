transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/gates.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/tl_cntr_struct.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/ns_logic.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/o_logic.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/_dff_r_async.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/_dff.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/_dlatch.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/_register2_r_async.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment6/tl_cntr_struct/tb_tl_cntr_struct.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_tl_cntr_struct

add wave *
view structure
view signals
run -all
