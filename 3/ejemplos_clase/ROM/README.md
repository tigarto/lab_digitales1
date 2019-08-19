

```
ghdl -a rom.vhd
ghdl -a --ieee=synopsys rom_tb.vhd
ghdl -r --ieee=synopsys rom_tb --vcd=rom_tb_results.vcd 
gtkwave rom_tb_results.vcd 
```
