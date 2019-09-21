library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity FSM_MEALY is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           ain : in STD_LOGIC;
           yout : out STD_LOGIC);
end FSM_MEALY;

architecture Behavioral of FSM_MEALY is

    -- declaraciones modelo FSM
    type STATES is (S0, S1, S2, S3);
    signal state, next_state: STATES;

begin

    -- registro de estados
    SYNC_PROC: process(clk)
    begin
        if clk'event and clk='1' then
            if reset='1' then 
                state <= S0;
            else 
                state <= next_state;
            end if;
         end if;
    end process;

    -- Lógica de estado siguiente (circuito combinacional)
    OUTPUT_DECODE : process(state, ain)
    begin
        yout <= '0';
        case(state) is            
            when S0 =>
              if (ain = '1') then                
                next_state <= S1;
              else 
                yout <= '1';
                next_state <= S0;
              end if;
            when S1 =>
              if (ain = '1') then       
                next_state <= S2;
              else 
                next_state <= S1;
              end if;
            when S2 =>
              if (ain = '1') then
                next_state <= S3;
              else 
                next_state <= S2;
              end if;
            when S3 =>
              if (ain = '1') then
                yout <= '1';
                next_state <= S0;
              else 
                yout <= '1';
                next_state <= S3;
              end if;
            end case;
        end process;
end Behavioral;