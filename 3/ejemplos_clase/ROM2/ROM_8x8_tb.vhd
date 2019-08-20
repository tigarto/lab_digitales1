--------------------------------------------
-- Module Name: ROM_8x8_tb
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.all; --for line
use IEEE.std_logic_textio.all; --for write
use ieee.numeric_std.all;


-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity ROM_8x8_tb Is
end ROM_8x8_tb;

Architecture behavior of ROM_8x8_tb Is


CONSTANT DELAY     : time := 10 ns;
	
	
Signal ROM_addr_signal    : std_logic_vector(2 downto 0);
Signal ROM_data_signal    : std_logic_vector(7 downto 0);
Signal ROM_addr2_signal   : std_logic_vector(2 downto 0);
	
	
Component ROM_8x8 is 
port (
	ROM_addr : in std_logic_vector(2 downto 0);
	ROM_data : out std_logic_vector(7 downto 0)
);
end Component;

procedure expected_data (
		proc_ROM_addr : in std_logic_vector(2 downto 0);
		proc_ROM_data : out std_logic_vector(7 downto 0)) is	

	type vector_array is array (0 to 7) of std_logic_vector (7 downto 0);

	CONSTANT memory: vector_array := (
		0 => X"00",
		1 => X"11",
		2 => X"F2",
		3 => X"C3",
		4 => X"A4",
		5 => X"95",
		6 => X"86",
		7 => X"E7"
	);

	begin
		case proc_ROM_addr is
			when "000" => proc_ROM_data := memory(0);
			when "001" => proc_ROM_data := memory(1);
			when "010" => proc_ROM_data := memory(2);
			when "011" => proc_ROM_data := memory(3);
			when "100" => proc_ROM_data := memory(4);
			when "101" => proc_ROM_data := memory(5);
			when "110" => proc_ROM_data := memory(6);
			when "111" => proc_ROM_data := memory(7);
			when others => proc_ROM_data := X"00";
		end case;
	end expected_data;


begin

	DUT: ROM_8x8  
	port map (
		ROM_addr => ROM_addr_signal,
		ROM_data => ROM_data_signal
	);


	Estim: process
	variable index: std_logic_vector(2 downto 0) := "000";
    begin
		--wait for DELAY;	
        for i in 0 to 7 loop
            ROM_addr_signal <= index;
			wait for DELAY; 
			index := index + '1';  
		end loop;
		wait;
	end process Estim;


	-- Asignacion necesaria para la verificacion
	ROM_addr2_signal <= ROM_addr_signal;

	Verific: process(ROM_addr2_signal)
	variable proc_ROM_data : std_logic_vector(7 downto 0);
	variable s : line;
	begin		
		expected_data(ROM_addr_signal, proc_ROM_data);
		-- If the outputs match, then announce it to the simulator console.
		if ( ROM_data_signal = proc_ROM_data) then
			write (s, string'("MEMORY DATA MATCHED")); 
			writeline (output, s);
			write (s, string'("MEMORY[")); write (s, ROM_addr_signal); write (s, string'("]: "));
			write (s, string'("Expected: ")); write (s, proc_ROM_data);
            write (s, string'("; Implemented: ")); write (s, ROM_data_signal); 
			writeline (output, s);
		else
		    write (s, string'("MEMORY DATA MISSMATCHED")); 
		    write (s, string'("MEMORY[")); write (s, ROM_addr_signal); write (s, string'("]: "));
			write (s, string'("Expected: ")); write (s, proc_ROM_data);
            write (s, string'("; Implemented: ")); write (s, ROM_data_signal); 
			writeline (output, s);
		end if;	
	end process Verific; 


end behavior;