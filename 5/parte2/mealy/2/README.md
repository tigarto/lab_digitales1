

```bash
ghdl -a --ieee=synopsys -fexplicit mealy2.vhd 
ghdl -a --ieee=synopsys -fexplicit mealy2_tb.vhd
ghdl -r --ieee=synopsys -fexplicit  FSM_MEALY_TB --stop-time=200ns --vcd=FSM_MEALY_TB_results.vcd
gtkwave FSM_MEALY_TB_results.vcd
```