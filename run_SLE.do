vlib work
vlog SLE_FForlatch_tb.v SLE_FForlatch.v 
vsim -voptargs=+acc work.SLE_FForlatch_tb    
add wave *
run -all
#quit -sim
