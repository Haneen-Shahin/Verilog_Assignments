vlib work
vlog Tesla_tb.v Tesla.v
vsim -voptargs=+acc work.Tesla_tb
add wave *
run -all
#quit -sim