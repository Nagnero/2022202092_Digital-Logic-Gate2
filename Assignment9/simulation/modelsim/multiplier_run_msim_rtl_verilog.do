transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/multiplier_ns.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/tb_multiplier_ns.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_multiplier_ns

add wave *
view structure
view signals
run -all
