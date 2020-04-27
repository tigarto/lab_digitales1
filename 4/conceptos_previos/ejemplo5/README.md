# Contador de 4 bits #

A continuación se muestra un contador implementado usando STD_LOGIC_VECTOR.

## Archivos ##

**Módulo**: [Counter_4bit_Up.vhd](Counter_4bit_Up.vhd)

```vhdl
-- Counters in VHDL Using the Type STD_LOGIC_VECTOR (1) --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;


entity Counter_4bit_Up is
	port(
		clk , rst: in std_logic;
		cnt : out std_logic_vector(3 downto 0)
	);
end entity Counter_4bit_Up;

architecture Counter_4bit_Up_arch of Counter_4bit_Up is

	signal cnt_std : std_logic_vector(3 downto 0);
	
begin
	
	COUNTER: process(clk, rst)
	begin
		if (rst = '0') then
			cnt_std <= "0000";		
		elsif (clk'event and clk = '1') then
			cnt_std <= cnt_std + 1;	
		end if;			
	end process; 
	
	cnt <= cnt_std;

end architecture;
```

**Test bench**: [Counter_4bit_Up_tb.vhd](Counter_4bit_Up_tb.vhd)

```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter_4bit_Up_tb is
end Counter_4bit_Up_tb;

architecture Behavioral of Counter_4bit_Up_tb is
    
    -- Declaracion de componentes
 
    component Counter_4bit_Up is
      port(
        clk , rst: in std_logic;
        cnt : out std_logic_vector(3 downto 0)
      );
    end component;
    -- Señales empleadas

    signal clk_sig, rst_sig: std_logic;   
    signal cnt_sig: std_logic_vector(3 downto 0);   

begin

  DUT: Counter_4bit_Up
	Port map (
        clk => clk_sig,
        rst => rst_sig,
        cnt => cnt_sig
  );
  
  clk_gen_signal: process
  begin
    clk_sig <= '0';
    wait for 13 ns;
    clk_sig <= '1';
    wait for 13 ns;
  end process;

  rst_gen_signal: process
  begin
    rst_sig <= '0';
    wait for 15 ns;     -- 15 ns
    rst_sig <= '1';
    wait;
  end process;

end Behavioral;
```

## Resultados de las simulaciones ##

### Formas de onda donde se resalta la señal interna de integer ###

![Counter_4bit_Up_waveform1](Counter_4bit_Up_wf1.png)

### Formas de onda donde se muestra el contador hasta que llega ###

![Counter_4bit_Up_waveform2](Counter_4bit_Up_wf2.png)

## Comandos aplicados ##

```
ghdl -a --ieee=synopsys -fexplicit Counter_4bit_Up.vhd 
ghdl -a --ieee=synopsys -fexplicit Counter_4bit_Up_tb.vhd
ghdl -r --ieee=synopsys -fexplicit  Counter_4bit_Up_tb --stop-time=500ns --vcd=Counter_4bit_Up_results.vcd
gtkwave Counter_4bit_Up_results.vcd
```