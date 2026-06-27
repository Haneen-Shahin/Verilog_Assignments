vlib work      
vlog Data_Latch_tb.v Data_Latch.v
vsim -voptargs=+acc work.Data_Latch_tb
add wave *
run -all
#quit -sim