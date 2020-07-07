library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PVWC is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Press : in STD_LOGIC;
           Open_CW : out STD_LOGIC;
           Close_CCW : out STD_LOGIC);
end PVWC;

architecture PVWC_arch of PVWC is

    type State_Type is (w_closed, w_open);
    signal current_state, next_state : State_Type;

begin
    -------------------------------------------------------------------
    STATE_MEMORY: process(Clock, Reset)
    begin
        if Reset = '0' then
          current_state <= w_closed;        
        elsif Clock'event and Clock='1' then
          current_state <= next_state;            
        end if;
    end process;
    -------------------------------------------------------------------
    NEXT_STATE_LOGIC : process(current_state, Press)
    begin
      case (current_state) is
        when w_closed => 
          if (Press = '1') then
            next_state <= w_open;
          else
            next_state <= w_closed;
          end if;
        when w_open => 
          if (Press ='1') then
            next_state <= w_closed;
          else
            next_state <= w_open;
          end if;
        when others => next_state <= w_closed;
      end case;
    end process;
    -------------------------------------------------------------------
    OUTPUT_LOGIC : process (current_state, Press)
    begin
      case (current_state) is
        when w_closed => 
          if (Press = '1') then
            Open_CW <= '1'; 
            Close_CCW <= '0';
          else
            Open_CW <= '0'; 
            Close_CCW <= '0';
          end if;
        when w_open => 
          if (Press = '1') then
            Open_CW <= '0'; 
            Close_CCW <= '1';
          else
            Open_CW <= '0'; 
            Close_CCW <= '0';
          end if;
        when others => 
          Open_CW <= '0'; Close_CCW <= '0';
      end case;
    end process;    
end architecture;