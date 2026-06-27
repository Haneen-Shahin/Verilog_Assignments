vlib work
vlog D_FF_tb.v parameterized_ff.v 
vsim -voptargs=+acc work.D_FF_tb    
add wave *
run -all
#quit -sim