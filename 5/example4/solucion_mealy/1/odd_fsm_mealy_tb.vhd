library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity ODD_FSM_MEALY_TB is
end ODD_FSM_MEALY_TB;

architecture Behavioral of ODD_FSM_MEALY_TB is

    -- declaraciones modelo FSM

    signal clk_int, reset_int, x_int, z_int: STD_LOGIC;   

    component ODD_FSM_MEALY is
      Port ( reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             x : in STD_LOGIC;             
             z : out STD_LOGIC);
    end component;

begin

  DUT: ODD_FSM_MEALY
	Port map (
    reset => reset_int,
    clk => clk_int,
    x => x_int,
    z => z_int
  );
  

  clk_gen_proc: process
  begin
    clk_int <= '0';
    wait for 9.5 ns;
    clk_int <= '1';
    wait for 0.5 ns;
  end process clk_gen_proc;

  reset_gen_proc: process
  begin
    reset_int <= '1';
    wait for 3 ns;     -- 3 ns
    reset_int <= '0';
    wait;   
  end  process reset_gen_proc;

  data_gen_proc: process
  begin    
    x_int <= '0'; 
    wait for 30 ns;    -- 30 ns
    x_int <= '1';
    wait for 10 ns;    -- 40 ns
    x_int <= '0';
    wait for 10 ns;    -- 50 ns
    x_int <= '1';
    wait for 30 ns;    -- 80 ns
    x_int <= '0';
    wait for 20 ns;    -- 100 ns
    x_int <= '1';
    wait for 40 ns;    -- 140 ns
    x_int <= '0';
    wait for 30 ns;    -- 170 ns
    x_int <= '1';
    wait for 20 ns;    -- 190 ns
    x_int <= '0';
    wait;
  end process data_gen_proc;
   
end Behavioral;