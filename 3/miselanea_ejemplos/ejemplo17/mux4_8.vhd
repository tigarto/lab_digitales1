library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux4_8 is
	port(d0, d1, d2, d3 : in  STD_LOGIC_VECTOR(7 downto 0);
	     s              : in  STD_LOGIC_VECTOR(1 downto 0);
	     y              : out STD_LOGIC_VECTOR(7 downto 0));
end;
architecture struct of mux4_8 is
	component mux2
		generic(width : integer := 8);
		port(d0, d1 : in  STD_LOGIC_VECTOR(width - 1 downto 0);
		     s      : in  STD_LOGIC;
		     y      : out STD_LOGIC_VECTOR(width - 1 downto 0));
	end component;
	signal low, hi : STD_LOGIC_VECTOR(7 downto 0);
begin
	lowmux : mux2
		port map(d0 => d0,
		         d1 => d1,
		         s  => s(0),
		         y  => low
		        );
	himux : mux2
		port map(d0 => d2,
		         d1 => d3,
		         s  => s(0),
		         y  => hi
		        );
	outmux : mux2
		port map(d0 => low,
		         d1 => hi,
		         s  => s(1),
		         y  => y
		        );
end;


