transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/gates.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/fa_v2.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/clb4.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/cla4.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/cla32.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/cla_clk.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/tb_cla_clk.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_cla_clk

add wave *
view structure
view signals
run -all
