--------------------------------------------
-- Module Name: halfadder_bahavioral_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;


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
      x_t_cin_tv : STD_LOGIC_VECTOR(2 downto 0);
      s, cout : STD_LOGIC;      
    end record;
    

    --  The patterns to apply.
    type pattern_array is array (natural range <>) of pattern_type;
    constant vector_signals : pattern_array := (
        (x_t_cin_tv => "000", s => '0', cout =>'0'),
        (x_t_cin_tv => "001", s => '1', cout =>'0'),
        (x_t_cin_tv => "010", s => '1', cout =>'0'),
        (x_t_cin_tv => "011", s => '0', cout =>'1'),
        (x_t_cin_tv => "100", s => '1', cout =>'0'),
        (x_t_cin_tv => "101", s => '0', cout =>'1'),
        (x_t_cin_tv => "110", s => '0', cout =>'1'),
        (x_t_cin_tv => "111", s => '1', cout =>'1')
    );
  

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
    variable s : line;
    variable result: std_logic_vector(1 downto 0);


    begin
        -- result := s_sig & cout_sig;
        for i in vector_signals'range loop
            test_vector <= vector_signals(i).x_t_cin_tv;			
            wait for PERIOD;  

            write(s, string'("x,y,cin = ")); write(s, to_integer(unsigned(test_vector))); 
            
            -- chequeo de las salidas
            if (s_sig = vector_signals(i).s) AND (cout_sig = vector_signals(i).cout) then
                write(s, string'(" -> s,cin (correcto)"));  
            else
                write(s, string'(" -> s,cin (incorrecto)"));  
            end if;
            writeline(output,s);
		end loop;							
		wait;
	end process testing;
end behavior;

-- Enlace de utilidad: https://surf-vhdl.com/vhdl-array/
-- https://surf-vhdl.com/write-to-file-in-vhdl-using-textio-library/
