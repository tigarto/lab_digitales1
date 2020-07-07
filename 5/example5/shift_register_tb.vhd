library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity shift_register_tb is
end shift_register_tb;

architecture behavioral of shift_register_tb is

    -- declaraciones modelo FSM

    signal clock, reset, data_in: STD_LOGIC;   
    signal data_out: STD_LOGIC_VECTOR(2 downto 0);   

    component shift_register is
      Port ( clock : in STD_LOGIC;
             reset : in STD_LOGIC;           
             data_in : in STD_LOGIC;
             data_out : out STD_LOGIC_VECTOR(2 downto 0));
    end component;

begin

  DUT: shift_register
	Port map (
    clock => clock,
    reset => reset,
    data_in => data_in,
    data_out => data_out
  );
  
  clock_stimulus: process
  begin
    clock <= '0';
    wait for 5 ns;
    clock <= '1';
    wait for 5 ns;
  end process;

  reset_stimulus: process
  begin
    reset <= '0';
    wait for 8 ns;     -- 8 ns
    reset <= '1';
    wait;   
  end  process;

  data_in_stimulus: process
  begin
    data_in <= '0';
    wait for 30 ns;     -- 30 ns    
    data_in <= '1';
    wait for 20 ns;     -- 50 ns    
    data_in <= '0';
    wait for 10 ns;     -- 60 ns    
    data_in <= '1';
    wait;
  end process;
   
end architecture;