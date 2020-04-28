library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_int_counter_tb is
end simple_int_counter_tb;

architecture test_arch of simple_int_counter_tb is
    
    -- Declaracion de componentes

    component simple_int_counter is
	      port(
		          clock : IN STD_LOGIC;
		          reset : IN STD_LOGIC;
		          q : OUT INTEGER RANGE 0 TO 255
	      );
    end component;
    
    -- Señales empleadas

    signal clock, reset: std_logic;   
    signal q: integer range 0 to 255;   

begin

  DUT: simple_int_counter
	Port map (
        clock => clock,
        reset => reset,
        q => q
  );
  
  clock_gen_signal: process
  begin
    clock <= '0';
    wait for 10 ns;
    clock <= '1';
    wait for 10 ns;
  end process;

  clear_gen_signal: process
  begin
    reset <= '1';
    wait for 200 ns;     -- 200 ns
    reset <= '0';
    wait for 200 ns;     -- 200 ns
    reset <= '1';
    wait;
  end process;

end test_arch;
