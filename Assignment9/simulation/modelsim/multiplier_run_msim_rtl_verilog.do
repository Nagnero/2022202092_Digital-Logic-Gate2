transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/ha.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/rca6.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/fa.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/clb4.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/gates.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/fa_v2.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/cla4.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/_dff_r_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/multiplier.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/multiplier_ns.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/_dff_r_128.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/multiplier_cal.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/cla64.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/_dff_r_64.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/_dff_r_6.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment9/tb_multiplier.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_multiplier

add wave *
view structure
view signals
run -all