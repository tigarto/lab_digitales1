----------------------------------------------------------------------------------
-- Company: Universidad de Antioquia
-- email: john.buitrago@udea.edu.co
-- 
-- Create Date:     
-- Design Name: 
-- Module Name:    Test of VGA 34 segments display 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Este test prueba el funcionamiento del display 34 segmentos
--
-- Dependencies: vga_ctrl_640x480_60Hz
--		 display34segm
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
-- https://learn.digilentinc.com/Documents/269
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Agregar librerias necesarias
use ieee.std_logic_textio.all;

library STD;
use STD.textio.all;


--Library UNISIM;
--use UNISIM.vcomponents.all;

entity test_34_seg_disp_tb is
end test_34_seg_disp_tb;

architecture Behavioral of test_34_seg_disp_tb is

	-- Declaracion de componente vga_ctrl_640x480_60Hz
	component test_34seg_disp is
    	Port ( CLK : in  STD_LOGIC; -- Clk 100MHz
           	   RST : in  STD_LOGIC; -- reset
		       MSG_SEL: in STD_LOGIC;
               RGB : out  STD_LOGIC_VECTOR (11 downto 0); -- RGB de salida a la pantalla
               HS : out  STD_LOGIC;  -- Señal de sincronizacion horizontal
               VS : out  STD_LOGIC); -- Señal de sincronizacion vertical
	end component;

	-- Señales
	signal RST: STD_LOGIC; 
	signal MSG_SEL: STD_LOGIC; 
	signal RGB: STD_LOGIC_VECTOR (11 downto 0); 
	signal HS: STD_LOGIC; 
	signal VS: STD_LOGIC; 
	signal clk_50KHz: STD_LOGIC := '0'; 
	signal pixel_clk: STD_LOGIC := '0'; 


begin

	-- Instanciacion componente vga_ctrl_640x480_60Hz
	DUT: test_34seg_disp 
	PORT MAP(
		CLK => clk_50KHz,
		RST  => RST,
		MSG_SEL => MSG_SEL,
		RGB => RGB,
		HS => HS,
		VS => VS		
	);

	-- generador de reloj de 50 MHZ (20 ns de periodo)
	clk_stimulus: process
	begin
		clk_50KHz <= '0';
		wait for 10 ns;
		clk_50KHz <= '1';
		wait for 10 ns;
	end process;

	pixel_clk_stimulus: process(clk_50KHz)
	begin
		if (clk_50KHz'event and clk_50KHz = '1') then
			pixel_clk <= NOT pixel_clk;
		end if;
	end process;

	

	rst_stimulus: process
	begin
		RST <= '1';
		wait for 3 ns;
		RST <= '0';
		wait;
	end process;


	letter_stimulus: process
	begin
		MSG_SEL <= '0'; -- Para visualizar la letra A
		wait for 34 ms;
		MSG_SEL <= '1'; -- Para visualizar la letra M
		wait;
	end process;

	
   
	-- proceso que escribe en el archivo siguiendo el siguiente formato:
	--
	-- current_sim_time time_units: hs vs red green blue (ex. 535 ns: 1 1 010 010 01)
	process (pixel_clk)
	
	file file_pointer: text open WRITE_MODE is "test_34_seg_disp_tb.txt";
	variable line_el: line;
		
	begin

		if rising_edge(pixel_clk) then

			-- Write the time
			write(line_el, now); -- write the line.
			write(line_el, string'(":")); -- write the line.

			-- Write the hsync
			write(line_el, string'(" "));
			write(line_el, HS); -- write the line.

			-- Write the vsync
			write(line_el, string'(" "));
			write(line_el, VS); -- write the line.

			-- Write the red
			write(line_el, string'(" "));
			write(line_el, RGB(11 downto 8)); -- write the line (Red color).

			-- Write the green
			write(line_el, string'(" "));
			write(line_el, RGB(7 downto 4)); -- write the line (Green color).

        	-- Write the blue
        	write(line_el, string'(" "));
        	write(line_el, RGB(3 downto 0)); -- write the line (Blue color).

    	    writeline(file_pointer, line_el); -- write the contents into the file.

    	end if;
	end process;			   
	



end Behavioral;


