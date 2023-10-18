transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/_register8_r.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/_dff_r.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/mx2.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/gates.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/mx4.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/LSL8.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/shifter8.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/LSR8.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/ASR8.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/cc_logic.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8 {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment7/shifter8/tb_cc_logic.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_cc_logic

add wave *
view structure
view signals
run -all
