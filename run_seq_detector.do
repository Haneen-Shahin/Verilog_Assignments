vlib work
vlog seq_detector_tb.v seq_detector.v
vsim -voptargs=+acc work.seq_detector_tb
add wave *
run -all
#quit -simS