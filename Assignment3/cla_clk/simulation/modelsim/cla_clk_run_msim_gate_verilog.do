transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {cla_clk.vo}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/codes/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk {C:/Users/david/Desktop/codes/2022202092_Digital-Logic-Gate2/Assignment3/cla_clk/tb_cla_clk.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L altera_lnsim_ver -L cyclonev_ver -L lpm_ver -L sgate_ver -L cyclonev_hssi_ver -L altera_mf_ver -L cyclonev_pcie_hip_ver -L gate_work -L work -voptargs="+acc"  tb_cla_clk

add wave *
view structure
view signals
run -all
