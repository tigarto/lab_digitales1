-- Counters in VHDL Using the Type UNSIGNED --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY simple_int_counter IS
	PORT(
		clock : IN STD_LOGIC;
		reset : IN STD_LOGIC;
		q 	  : OUT INTEGER RANGE 0 TO 255
	);
END simple_int_counter;


ARCHITECTURE counter OF simple_int_counter IS

BEGIN
	PROCESS (clock, reset)
		VARIABLE count : INTEGER RANGE 0 to 255;
	BEGIN		
		IF (clock'EVENT AND clock = '1') THEN				
			IF (reset = '0') THEN
				count := 0;
			ELSIF (count = 255) THEN
				count := 0;
			ELSE
				count := count + 1;
			END IF;
		END IF;
		q <= count;
	END PROCESS;
END counter;


