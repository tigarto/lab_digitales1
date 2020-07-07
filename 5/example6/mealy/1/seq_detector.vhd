library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity seq_detector is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           w : in STD_LOGIC;
           z : out STD_LOGIC);
end seq_detector;

architecture seq_detector_arch of seq_detector is

    type STATES is (A, B);
    signal current_state, next_state : STATES;

begin
    -------------------------------------------------------------------
    STATE_MEMORY: process(Clock, Reset)
    begin
        if Reset = '1' then
          current_state <= A;        
        elsif Clock'event and Clock='1' then
          current_state <= next_state;            
        end if;
    end process;
    -------------------------------------------------------------------
    NEXT_STATE_LOGIC : process(current_state, w)
    begin
      case (current_state) is
        when A => 
          if (w = '1') then
            next_state <= B;
          else
            next_state <= A;
          end if;
        when B => 
          if (w ='1') then
            next_state <= B;
          else
            next_state <= A;
          end if;        
      end case;
    end process;
    -------------------------------------------------------------------
    OUTPUT_LOGIC : process (current_state, w)
    begin
      case (current_state) is
        when A => 
          if (w ='1') then
            z <= '0';
          else
            z <= '0';
          end if;
        when B => 
          if (w ='1') then
            z <= '1';
          else
            z <= '0';
        end if;
      end case;
    end process;    
end architecture;