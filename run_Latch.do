vlib work
vlog Latch_tb.v Latch.v 
vsim -voptargs=+acc work.Latch_tb    
add wave *
run -all
#quit -sim