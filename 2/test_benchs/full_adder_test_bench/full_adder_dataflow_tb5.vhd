--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


Entity full_adder_dataflow_tb Is
end full_adder_dataflow_tb;

Architecture behavior of full_adder_dataflow_tb Is
	Component full_adder
	port (
		  x : in STD_LOGIC;
		  y : in STD_LOGIC;
		  cin : in STD_LOGIC;
          s : out STD_LOGIC;
          cout: out STD_LOGIC
		);	
	End Component;
    

    type pattern_type is record
      --  The inputs of the adder.
      x, y, cin : STD_LOGIC;
    end record;
    

    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant vector_signals : pattern_array :=
      (('0', '0', '0'),
       ('0', '0', '1'),
       ('0', '1', '0'),
       ('0', '1', '1'),
       ('1', '0', '0'),
       ('1', '0', '1'),
       ('1', '1', '0'),
	   ('1', '1', '1'));
  

	Signal test_vector  : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
	Signal s_sig    	: STD_LOGIC;
	Signal cout_sig    	: STD_LOGIC;


	
begin 
	DUT:  full_adder PORT MAP (
		x => test_vector(2),
		y => test_vector(1),
		cin => test_vector(0),
		s => s_sig,
		cout => cout_sig
	);
	

	testing: process
    -- Simple Testbench: loop con vectores de prueba
    constant PERIOD: time := 20 ns;
	begin
        for i in vector_signals'range loop
            test_vector(2) <= vector_signals(i).x;
			test_vector(1) <= vector_signals(i).y;
			test_vector(0) <= vector_signals(i).cin;
            wait for PERIOD;  
		end loop;							
		wait;
	end process testing;
end behavior;

-- Enlace de utilidad: https://surf-vhdl.com/vhdl-array/