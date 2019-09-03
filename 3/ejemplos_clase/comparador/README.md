ghdl -a comparador.vhd
ghdl -a --ieee=synopsys -fexplicit comparador_tb.vhd
ghdl -r --ieee=synopsys -fexplicit comparador_tb --vcd=comparador_tb_results.vcd 
gtkwave comparador_tb_results.vcd 
