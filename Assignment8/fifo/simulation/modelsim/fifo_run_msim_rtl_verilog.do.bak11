transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/_8_to_1_MUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/_3_to_8_decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/register32_8.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/gates.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/write_operation.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/Register_file.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/register32_r_en.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/read_operation.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/fifo.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/fifo_ns.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/fifo_cal_addr.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/_dff_r_3.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/_dff_r_4.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/_dff_r_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/mux_32.v}
vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/fifo_out.v}

vlog -vlog01compat -work work +incdir+C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo {C:/Users/david/Desktop/code/2022202092_Digital-Logic-Gate2/Assignment8/fifo/tb_fifo.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_fifo

add wave *
view structure
view signals
run -all
