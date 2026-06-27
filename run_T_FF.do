vlib work
vlog T_FF_tb.v parameterized_ff.v 
vsim -voptargs=+acc work.T_FF_tb    
add wave *
run -all
#quit -sim