library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ODD_FSM_MEALY is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           x : in STD_LOGIC;
           z : out STD_LOGIC);
end ODD_FSM_MEALY;

architecture Behavioral of ODD_FSM_MEALY is

    -- declaraciones modelo FSM
    type STATES is (
                        even, 
                        odd
                   );
    signal state, next_state: STATES;

begin

    SYNC_PROC: process(clk, reset)
    begin
        if reset = '1' then
          state <= even;        
        elsif clk'event and clk='1' then
          state <= next_state;            
         end if;
    end process;

    OUTPUT_DECODE : process (state, x)
    begin
      z <= '0';
      case (state) is         
        when even =>
          if (x = '1') then
            z <= '1';          
          else
            z <= '0';            
          end if;
        when odd =>
          if (x = '0') then
            z <= '1';          
          else
            z <= '0';          
          end if;  
        when OTHERS =>
            z <= '0';
      end case;
    end process;
    
    NEXT_STATE_DECODE : process(state, x)
    begin
        next_state <= even;
        case(state) is            
            when even =>
              if (x = '1') then                
                next_state <= odd;
              else
                next_state <= even;                
              end if;
            when odd =>
              if (x = '1') then       
                next_state <= even;
              else 
                next_state <= odd;
              end if;
        end case;
    end process;
end Behavioral;