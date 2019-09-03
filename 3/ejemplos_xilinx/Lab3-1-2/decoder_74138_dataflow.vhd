--------------------------------------------
-- Module Name: decoder_74138_dataflow
--------------------------------------------

library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity decoder_74138_dataflow Is
port(
		g1  : in STD_LOGIC;
		g2a_n : in STD_LOGIC;
		g2b_n : in STD_LOGIC;
		x 	: in STD_LOGIC_VECTOR(2 downto 0);
		y	: out STD_LOGIC_VECTOR(7 downto 0)
	);
end decoder_74138_dataflow;

Architecture behavior of decoder_74138_dataflow Is
	Component decoder_3to8_dataflow
	port (
		x 		: in STD_LOGIC_VECTOR (2 downto 0);
		y 		: out STD_LOGIC_VECTOR (7 downto 0)
	);	
	End Component;
	
	Signal enable : STD_LOGIC;
	Signal y_int  : STD_LOGIC_VECTOR(7 downto 0);
	Signal reverse_x : STD_LOGIC_VECTOR(2 downto 0);	
	
begin
	U1:  decoder_3to8_dataflow PORT MAP (
			x => reverse_x,
			y => y_int
		 );

	reverse_x(2) <= x(0);
	reverse_x(1) <= x(1);
	reverse_x(0) <= x(2);
	enable <= (g1 and not(g2a_n) and not(g2b_n));

process (enable) begin	
	if (enable = '1') then
		y <= not(y_int);
	else
		y <= "11111111";
	end if;
end process;
	
end behavior;