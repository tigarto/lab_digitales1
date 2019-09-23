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
    type STATES is (A, B, C, D);
    signal state, next_state: STATES;

begin

    -- registro de estados
    SYNC_PROC: process(clk,reset)
    begin
        if reset = '1' then
          state <= A;        
        elsif clk'event and clk='1' then
            state <= next_state;            
        end if;
    end process;


    OUTPUT_DECODE : process (state)
    begin
      case (state) is 
         when A =>
           z <= '0';
         when B =>
           z <= '0';
         when C =>
           z <= '0';
         when D =>
           z <= '1';         
         when others =>
           z <= '0';
      end case;
    end process;

    
    NEXT_STATE_DECODE : process(state, x)
    begin
        next_state <= A;
        case(state) is            
            when A =>
              if (x = '1') then                
                next_state <= B;              
              end if;
            when B =>
              if (x = '1') then       
                next_state <= C;
              else 
                next_state <= A;
              end if;
            when C =>
              if (x = '1') then
                next_state <= D;                
              else 
                next_state <= A;
              end if; 
            when D =>
              if (x = '1') then
                next_state <= D;                
              else 
                next_state <= A;
              end if;           
        end case;
    end process;
end Behavioral;