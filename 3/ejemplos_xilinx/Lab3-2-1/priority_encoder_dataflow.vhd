--------------------------------------------
-- Module Name: priority_encoder_dataflow
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

Entity priority_encoder_dataflow Is
port(
		en_in_n  : in STD_LOGIC;
		x 		 : in STD_LOGIC_VECTOR(7 downto 0);
		en_out 	 : out STD_LOGIC;
		gs	 	 : out STD_LOGIC;
		y		 : out STD_LOGIC_VECTOR(2 downto 0)
	);
end priority_encoder_dataflow;

Architecture behavior of priority_encoder_dataflow Is
	
	Signal y_int  : STD_LOGIC_VECTOR(2 downto 0) := "000";
	Signal x_reduction : STD_LOGIC := '0';
	Signal en_out_int  : STD_LOGIC := '0';

begin
	
	x_reduction <= x(7) and x(6) and x(5) and x(4) and x(3) and x(2) and x(1) and x(0);
    en_out <= en_out_int;
    
process (en_out_int) begin	
	if (en_out_int = '1') then
		y <= y_int;
	else
		y <= "111";
	end if;
end process;

process (en_in_n, x_reduction) begin	
	if ((not(en_in_n) and x_reduction)) = '1' then
		en_out_int <= '0';
	else
		en_out_int <= '1';
	end if;	

	if ((en_in_n or x_reduction) = '1') then
		gs <= '1';
	else
		gs <= '0';
	end if;		
end process;

process (x(0), x(1), x(2), x(3), x(4), x(5), x(6), x(7)) begin	
	if (not(x(7)) = '1') then
		y_int <= "000";
	elsif (not(x(6)) = '1') then
		y_int <= "001";
	elsif (not(x(5)) = '1') then
		y_int <= "010";
	elsif (not(x(4)) = '1') then
		y_int <= "011";
	elsif (not(x(3)) = '1') then
		y_int <= "100";
	elsif (not(x(2)) = '1') then
		y_int <= "101";
	elsif (not(x(1)) = '1') then
		y_int <= "110";
	elsif (not(x(0)) = '1') then
		y_int <= "111";
	else
		y_int <= "111";
	end if;
end process;	
	
end behavior;