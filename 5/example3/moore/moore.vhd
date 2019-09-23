library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MOORE is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           ain : in STD_LOGIC_VECTOR(1 DOWNTO 0);
           yout : out STD_LOGIC);
end FSM_MOORE;

architecture Behavioral of FSM_MOORE is

    -- declaraciones modelo FSM
    type STATES is (S0, S1, S2, S3, S4, S5, S6, S7);
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

    OUTPUT_DECODE : process (state)
    begin
      case (state) is 
         when S0 =>
           yout <= '0';
         when S1 =>
           yout <= '1';
         when S2 =>
           yout <= '0';
         when S3 =>
           yout <= '0';
         when S4 =>
           yout <= '0';
         when S5 =>
           yout <= '1';
         when S6 =>
           yout <= '1';
         when S7 =>
           yout <= '1';
         when others =>
           yout <= '0';
      end case;
    end process;


    -- Lógica de estado siguiente (circuito combinacional)

    NEXT_STATE_DECODE : process (state, ain)
    begin
      next_state <= S0;
      case (state) is
        -- S0 --
        when S0 =>                       
          if (ain = "00") then    -- 00
            next_state <= S0;
          elsif (ain = "01") then -- 01
            next_state <= S2;
          elsif (ain = "11") then -- 11
            next_state <= S3;
          else                    -- 10
            next_state <= S4;
          end if;
        -- S1 --
        when S1 =>                       
          if (ain = "00") then    -- 00
            next_state <= S1;
          elsif (ain = "01") then -- 01
            next_state <= S6;
          elsif (ain = "11") then -- 11
            next_state <= S7;
          else                    -- 10
            next_state <= S5;
          end if;
        -- S2 --
        when S2 =>                       
          if (ain = "00") then    -- 00
            next_state <= S0;
          elsif (ain = "01") then -- 01
            next_state <= S2;
          elsif (ain = "11") then -- 11
            next_state <= S3;
          else                    -- 10
            next_state <= S4;
          end if;
        -- S3 --
        when S3 =>                       
          if (ain = "00") then    -- 00
            next_state <= S1;
          elsif (ain = "01") then -- 01
            next_state <= S2;
          elsif (ain = "11") then -- 11
            next_state <= S3;
          else                    -- 10
            next_state <= S4;
          end if;
        -- S4 --
        when S4 =>                       
          if (ain = "00") then    -- 00
            next_state <= S1;
          elsif (ain = "01") then -- 01
            next_state <= S2;
          elsif (ain = "11") then -- 11
            next_state <= S3;
          else                    -- 10
            next_state <= S4;
          end if;
        -- S5 --
        when S5 =>                       
          if (ain = "00") then    -- 00
            next_state <= S0;
          elsif (ain = "01") then -- 01
            next_state <= S6;
          elsif (ain = "11") then -- 11
            next_state <= S7;
          else                    -- 10
            next_state <= S5;
          end if;
        -- S6 --
        when S6 =>                       
          if (ain = "00") then    -- 00
            next_state <= S0;
          elsif (ain = "01") then -- 01
            next_state <= S6;
          elsif (ain = "11") then -- 11
            next_state <= S7;
          else                    -- 10
            next_state <= S5;
          end if;
        -- S7 --
        when S7 =>                       
          if (ain = "00") then    -- 00
            next_state <= S1;
          elsif (ain = "01") then -- 01
            next_state <= S6;
          elsif (ain = "11") then -- 11
            next_state <= S7;
          else                    -- 10
            next_state <= S5;
          end if;          
        end case;
    end process;
end Behavioral;