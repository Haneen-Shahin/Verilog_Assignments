vlib work      
vlog  shift_reg_tb.v shift_reg.v
vsim -voptargs=+acc work.shift_reg_tb 
add wave *
run -all
#quit -sim