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
    signal count_int: STD_LOGIC_VECTOR(3 DOWNTO 0);

    component FSM_MEALY is
      Port ( reset : in STD_LOGIC;
             clk : in STD_LOGIC;
             ain : in STD_LOGIC;
             count : out STD_LOGIC_VECTOR(3 DOWNTO 0);
             yout : out STD_LOGIC);
    end component;

begin

  DUT: FSM_MEALY
	Port map (
    reset => reset_int,
    clk => clk_int,
    ain => ain_int,
    count => count_int,
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
    ain_int <= '0';    -- 0 ns
    reset_int <= '1';
    wait for 20 ns;    -- 20 ns
    reset_int <= '0';
    wait for 20 ns;    -- 40 ns
    ain_int <= '1';
    wait for 20 ns;    -- 60 ns
    ain_int <= '0';
    wait for 60 ns;    -- 120 ns
    ain_int <= '1';
    wait for 40 ns;    -- 160 ns
    ain_int <= '0';
    wait for 20 ns;    -- 180 ns
    ain_int <= '1';
    wait for 20 ns;    -- 200 ns
  end process data_gen_proc;
   
end Behavioral;