transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/_dff_r_2.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/mux3_64bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/mux2_64bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/mux2_16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/mux2.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/BUS.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/bus_arbit.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/bus_addr.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/project/tb_BUS.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_BUS

add wave *
view structure
view signals
run -all
