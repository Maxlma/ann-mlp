# vcom activation_function_tb.vhd
vsim -gui work.activation_function_tb(testbench) -t ns
add wave  \
sim:/activation_function_tb/X_real \
sim:/activation_function_tb/Y1_real \
sim:/activation_function_tb/Y2_real
run 25600 ns
# quit -sim