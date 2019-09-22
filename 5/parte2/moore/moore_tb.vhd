library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity FSM_MOORE_TB is
end FSM_MOORE_TB;

architecture Behavioral of FSM_MOORE_TB is

    -- declaraciones modelo FSM

    signal clk_int, reset_int, yout_int: STD_LOGIC;
    signal ain_int: STD_LOGIC_VECTOR(1 DOWNTO 0);
  
    component FSM_MOORE is
      Port ( reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             ain : in STD_LOGIC_VECTOR(1 DOWNTO 0);            
             yout : out STD_LOGIC);
    end component;

begin

  DUT: FSM_MOORE
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

  -- Nota: Se puede hacer un proceso a parte para el reset
  data_gen_proc: process
  begin
    ain_int <= "00";    -- 0 ns
    reset_int <= '1';
    wait for 20 ns;    -- 20 ns
    reset_int <= '0';
    wait for 20 ns;    -- 40 ns
    ain_int <= "11";
    wait for 10 ns;    -- 50 ns
    ain_int <= "10";
    wait for 10 ns;    -- 60 ns
    ain_int <= "00";
    wait for 20 ns;    -- 80 ns
    ain_int <= "10";
    wait for 10 ns;    -- 90 ns
    ain_int <= "00";
    wait for 10 ns;    -- 100 ns
    ain_int <= "11";
    wait for 10 ns;    -- 110 ns
    ain_int <= "00";
    wait for 10 ns;    -- 120 ns
    ain_int <= "01";
    wait for 10 ns;    -- 130 ns
    ain_int <= "00";
    wait for 10 ns;    -- 140 ns
    ain_int <= "10";
    wait for 10 ns;    -- 150 ns
    ain_int <= "11";
    wait for 10 ns;    -- 160 ns
    ain_int <= "00";
    wait for 10 ns;    -- 170 ns
    reset_int <= '1';
    wait for 10 ns;    -- 180 ns
    reset_int <= '0';
    wait for 10 ns;    -- 190 ns
    ain_int <= "10";
    wait for 30 ns;    -- 220 ns
    ain_int <= "00";
    wait for 30 ns;    -- 250 ns
  end process data_gen_proc;
   
end Behavioral;