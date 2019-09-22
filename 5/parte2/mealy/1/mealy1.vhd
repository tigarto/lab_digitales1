library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MEALY is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           ain : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR(3 DOWNTO 0);
           yout : out STD_LOGIC);
end FSM_MEALY;

architecture Behavioral of FSM_MEALY is

    -- declaraciones modelo FSM
    type STATES is (S0, S1, S2, S3);
    signal state, next_state: STATES;
    signal count_signal: STD_LOGIC_VECTOR(3 DOWNTO 0);-- := "0000";

begin

    -- registro de estados
    SYNC_PROC: process(clk)
    
    begin
        if clk'event and clk='1' then
            if reset='1' then 
                state <= S0;
                count_signal <= "0000";
            else 
                state <= next_state;
                if ain = '1' then
                  count_signal <= count_signal + 1;
                  
                end if;
            end if;
         end if;
    end process;

    count <= count_signal;


    -- Lógica de estado siguiente (circuito combinacional)
    NEXT_STATE_DECODE : process(state, ain)
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
                next_state <= S1;
              else 
                -- yout <= '1';
                next_state <= S3;
              end if;
            end case;
        end process;
end Behavioral;