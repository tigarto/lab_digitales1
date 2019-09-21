library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MEALY_TB is
end FSM_MEALY_TB;





architecture Behavioral of FSM_MEALY_TB is

    -- declaraciones modelo FSM

    signal clk_int, reset_int, ain_int, yout_int: STD_LOGIC;
    type STATES is (S0, S1, S2);
    signal state, state_next: STATES;

    component FSM_MEALY is
      Port ( reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             ain : in STD_LOGIC;
             yout : out STD_LOGIC);
    end component;

begin

  DUT: FSM_MEALY
	Port map (
    reset => reset_int,
    clk => clk_int,
    ain => ain_int,
    yout => yout_int
  );
  

  clk_gen_proc: process
  begin
    clk_int <= '0';
    wait for 5 ns;
    clk_int <= '1';
    wait for 5 ns;
  end process clk_gen_proc;

  data_gen_proc: process
  begin
    ain_int <= '0';
    reset_int <= '1';
    wait for 20 ns;
    reset_int <= '0';
    wait for 20 ns;
    ain_int <= '1';
    wait for 20 ns;
    ain_int <= '0';
    wait for 60 ns;
    ain_int <= '1';
    wait for 40 ns;
  end process data_gen_proc;
   
end Behavioral;