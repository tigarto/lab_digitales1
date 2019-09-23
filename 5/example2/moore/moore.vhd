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