library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity shift_register is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;           
           data_in : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR(2 downto 0));
end shift_register;

architecture bahavioral of shift_register is

    type State_Type is (A, B, C, D, E, F, G, H);
    signal current_state, next_state : State_Type;

begin
    -------------------------------------------------------------------
    STATE_MEMORY: process(clock, reset)
    begin
        if reset = '0' then
          current_state <= A;        
        elsif clock'event and clock='1' then
          current_state <= next_state;            
        end if;
    end process;
    -------------------------------------------------------------------
    NEXT_STATE_LOGIC : process(current_state, data_in)
    begin
      case (current_state) is
        when A => 
          if (data_in = '1') then
            next_state <= B;         
          end if;
        when B => 
          if (data_in ='1') then
            next_state <= F;
          else
            next_state <= C;
          end if;
        when C => 
          if (data_in ='1') then
            next_state <= E;
          else
            next_state <= D;
          end if;
        when D => 
          if (data_in ='1') then
            next_state <= B;
          else
            next_state <= A;
          end if;
        when E => 
          if (data_in ='1') then
            next_state <= F;
          else
            next_state <= C;
          end if;
        when F => 
          if (data_in ='1') then
            next_state <= G;
          else
            next_state <= H;
          end if;
        when G => 
          if (data_in ='0') then
            next_state <= H;
          end if;
        when H => 
          if (data_in ='1') then
            next_state <= E;
          else
            next_state <= D;
          end if;
      end case;
    end process;
    -------------------------------------------------------------------
    OUTPUT_LOGIC : process (current_state)
    begin
      case (current_state) is
        when A => 
          data_out <= "000";
        when B => 
          data_out <= "100";
        when C => 
          data_out <= "010";
        when D => 
          data_out <= "001";
        when E => 
          data_out <= "101";
        when F => 
          data_out <= "110";
        when G => 
          data_out <= "111";
        when H => 
          data_out <= "011";       
      end case;
    end process;    
end architecture;