vlib work
vlog tb_param_shift_reg.v param_shift_reg.v 
vsim -voptargs=+acc work.tb_param_shift_reg    
add wave *
run -all
#quit -sim