vlib work
vlog tb_counter_4_bit.v counter_4_bit_behavioral.v 
vsim -voptargs=+acc work.tb_counter_4_bit   
add wave *
run -all
#quit -sim