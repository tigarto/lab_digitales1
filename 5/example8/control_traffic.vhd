library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity control_traffic is
    Port ( CLK : in STD_LOGIC;
           Reset : in STD_LOGIC;
           TA : in STD_LOGIC;
           TB : in STD_LOGIC;
           LA : out STD_LOGIC_VECTOR (1 downto 0);
           LB : out STD_LOGIC_VECTOR (1 downto 0));
end control_traffic;

architecture control_traffic_arch of control_traffic is

    type STATES is (S0, S1, S2, S3);
    signal current_state, next_state : STATES;
    constant GREEN: STD_LOGIC_VECTOR(1 downto 0) := "00";
    constant YELLOW: STD_LOGIC_VECTOR(1 downto 0) := "01";
    constant RED: STD_LOGIC_VECTOR(1 downto 0) := "10";

begin
    -------------------------------------------------------------------
    STATE_MEMORY: process(CLK, Reset)
    begin
        if Reset = '1' then
          current_state <= S0;        
        elsif CLK'event and CLK='1' then
          current_state <= next_state;            
        end if;
    end process;
    -------------------------------------------------------------------
    NEXT_STATE_LOGIC : process(current_state, TA, TB)
    begin
      case (current_state) is
        when S0 => 
          if (TA = '1') then
            next_state <= S0;
          else
            next_state <= S1;
          end if;
        when S1 => 
          next_state <= S2;          
        when S2 => 
          if (TB = '1') then
            next_state <= S2;
          else
            next_state <= S3;
          end if;
        when S3 => 
          next_state <= S0;         
      end case;
    end process;
    -------------------------------------------------------------------
    OUTPUT_LOGIC : process (current_state)
    begin
      case (current_state) is
        when S0 => 
          LA <= GREEN;  -- Verde
          LB <= RED;  -- Rojo
        when S1 => 
          LA <= YELLOW;  -- Amarillo
          LB <= RED;  -- Rojo
        when S2 => 
          LA <= RED;  -- Rojo
          LB <= GREEN;  -- Verde
        when S3 => 
          LA <= RED;  -- Rojo
          LB <= YELLOW;  -- Amarillo        
      end case;
    end process;    
end architecture;