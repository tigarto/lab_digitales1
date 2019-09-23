# Maquina Moore ##

## Maquina Moore 3 bloques ##

![maquina_moore_tres_bloques](maquina_moore_tres_bloques.jpg)

## Ejemplo ##

### Enunciado ###

### Diagrama de estados de la solución ###

![moore](moore_example2.jpg)

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MOORE is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : in STD_LOGIC;
           z : out STD_LOGIC);
end FSM_MOORE;

architecture Behavioral of FSM_MOORE is

    -- declaraciones modelo FSM
    type STATES is (S0, S1, S2, S3, S4);
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


    OUTPUT_DECODE : process (state)
    begin
      case (state) is 
         when S0 =>
           z <= '0';
         when S1 =>
           z <= '0';
         when S2 =>
           z <= '0';
         when S3 =>
           z <= '0'; 
         when S4 =>
           z <= '1';         
         when others =>
           z <= '0';
      end case;
    end process;

    
    NEXT_STATE_DECODE : process(state, x)
    begin
        next_state <= S0;
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
                next_state <= S4;                
              else 
                next_state <= S0;
              end if; 
            when S4 =>
              if (x = '1') then
                next_state <= S2;                
              else 
                next_state <= S0;
              end if;          
        end case;
    end process;
end Behavioral;
```

### Comandos de compilación en ghdl ###

```bash 
ghdl -a --ieee=synopsys -fexplicit moore.vhd 
ghdl -a --ieee=synopsys -fexplicit moore_tb.vhd
ghdl -r --ieee=synopsys -fexplicit  FSM_MOORE_TB --stop-time=230ns --vcd=FSM_MOORE_TB_results.vcd
gtkwave FSM_MOORE_TB_results.vcd
```

### Resultados  ###

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MOORE_TB is
end FSM_MOORE_TB;

architecture Behavioral of FSM_MOORE_TB is

    -- declaraciones modelo FSM

    signal clk_int, reset_int, x_int, z_int: STD_LOGIC;   

    component FSM_MOORE is
      Port ( reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             x : in STD_LOGIC;             
             z : out STD_LOGIC);
    end component;

begin

  DUT: FSM_MOORE
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

![moore_output](moore_output.png)
