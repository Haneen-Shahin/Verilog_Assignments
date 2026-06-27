vlib work
vlog add_DIV_tb.v add_DIV.v 
vsim -voptargs=+acc work.add_DIV_tb  
add wave *
run -all
#quit -sim