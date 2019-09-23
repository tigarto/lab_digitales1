# Maquina Mealy ##

## Maquina Mealy 2 bloques ##

![maquina_mealy_dos_bloques](maquina_mealy_dos_bloques.jpg)

## Ejemplo ##

### Enunciado ##

Dibuje el diagrama de estados y la tabla de transición de estados de un circuito secuencial el cual da una salida Z = 1 cuando por una entrada X a ingresado la secuencia de bits 1101.

### Diagrama de estados de la solución ###

![mealy](example1_mealy.jpg)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MEALY is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : in STD_LOGIC;
           z : out STD_LOGIC);
end FSM_MEALY;

architecture Behavioral of FSM_MEALY is

    -- declaraciones modelo FSM
    type STATES is (S0, S1, S2, S3);
    signal state, next_state: STATES;

begin

    -- registro de estados
    SYNC_PROC: process(clk,reset)
    begin
        if reset = '1' then
          state <= S0;        
        elsif clk'event and clk='1' then
            state <= next_state;            
         end if;
    end process;

    
    NEXT_STATE_DECODE : process(state, x)
    begin
        z <= '0';
        case(state) is            
            when S0 =>
              if (x = '1') then                
                next_state <= S1;              
              end if;
            when S1 =>
              if (x = '1') then       
                next_state <= S2;
              else 
                next_state <= S0;
              end if;
            when S2 =>
              if (x = '1') then
                next_state <= S2;                
              else 
                next_state <= S3;
              end if; 
            when S3 =>
              if (x = '1') then
                z <= '1';
                next_state <= S1;                
              else 
                next_state <= S0;
              end if;           
        end case;
    end process;
end Behavioral;
```

### Comandos de compilación en ghdl ###

```bash 
ghdl -a --ieee=synopsys -fexplicit mealy1.vhd 
ghdl -a --ieee=synopsys -fexplicit mealy1_tb.vhd
ghdl -r --ieee=synopsys -fexplicit  FSM_MEALY_TB --stop-time=230ns --vcd=FSM_MEALY_TB_results.vcd
gtkwave FSM_MEALY_TB_results.vcd
```

### Resultados  ###

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MEALY_TB is
end FSM_MEALY_TB;

architecture Behavioral of FSM_MEALY_TB is

    -- declaraciones modelo FSM

    signal clk_int, reset_int, x_int, z_int: STD_LOGIC;   

    component FSM_MEALY is
      Port ( reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             x : in STD_LOGIC;             
             z : out STD_LOGIC);
    end component;

begin

  DUT: FSM_MEALY
	Port map (
    reset => reset_int,
    clk => clk_int,
    x => x_int,
    z => z_int
  );
  

  clk_gen_proc: process
  begin
    clk_int <= '0';
    wait for 5 ns;
    clk_int <= '1';
    wait for 5 ns;
  end process clk_gen_proc;

  reset_gen_proc: process
  begin
    reset_int <= '0';
    wait for 8 ns;     -- 8 ns
    reset_int <= '1';
    wait for 12 ns;    -- 20 ns
    reset_int <= '0';
    wait for 200 ns;   -- 230 ns  
  end  process reset_gen_proc;

  data_gen_proc: process
  begin    
    x_int <= '0'; 
    wait for 30 ns;    -- 30 ns
    x_int <= '1';
    wait for 10 ns;    -- 40 ns
    x_int <= '0';
    wait for 10 ns;    -- 50 ns
    x_int <= '1';
    wait for 20 ns;    -- 70 ns
    x_int <= '0';
    wait for 10 ns;    -- 80 ns
    x_int <= '1';
    wait for 20 ns;    -- 100 ns
    x_int <= '0';
    wait for 10 ns;    -- 110 ns
    x_int <= '1';
    wait for 7 ns;     -- 117 ns
    x_int <= '0';
    wait for 13 ns;    -- 130 ns
    x_int <= '1';
    wait for 10 ns;    -- 140 ns
    x_int <= '0';
    wait for 20 ns;    -- 160 ns
    x_int <= '1';
    wait for 30 ns;    -- 190 ns
    x_int <= '0';
    wait for 10 ns;    -- 200 ns
    x_int <= '1';
    wait for 20 ns;    -- 220 ns
    x_int <= '0';
    wait for 10 ns;    -- 230 ns    
  end process data_gen_proc;
   
end Behavioral;
```

![mealy_output](mealy_output_forma1.png)