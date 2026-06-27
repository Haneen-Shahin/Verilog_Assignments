vlib work
vlog Counter_4bit_tb.v Counter_4bit.v
vsim -voptargs=+acc work.Counter_4bit_tb
add wave *
run -all
#quit -sim