----------------------------------------------------------------------------------
-- Company: Instituto Tecnólogico Metropolitano
-- Engineer: Ricardo Andrés Velásquez Vélez
-- 
-- Create Date:    09:49:23 05/12/2014 
-- Design Name: 
-- Module Name:    Simple_Test_VGA - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Este módulo verifica el correcto funcionamiento del modulo de control
--              VGA de un monitor o pantalla de computador. El test dibuja un cuadro
--              en el centro de la pantalla  y los switches en la board Digilent permiten
--			    seleccionar el color del cuadro del centro. El color del fondo es el 
--              inverso del cuadro.
--
-- Dependencies: vga_ctrl_640x480_60Hz
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--


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

entity vga_ctrl_tb3 is
end vga_ctrl_tb3;

architecture Behavioral of vga_ctrl_tb3 is

-- Declaracion segnales

	signal HCOUNT: STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
	signal VCOUNT: STD_LOGIC_VECTOR (10 downto 0) := "00000000000";
	signal COLOR : STD_LOGIC_VECTOR (11 downto 0) := "111111111111";
	signal INPUT_COLOR : STD_LOGIC_VECTOR (11 downto 0);
	signal clk_interno : STD_LOGIC;
	signal RST : STD_LOGIC := '1'; -- reset
	signal HS : STD_LOGIC; -- Se�al de sincronizacion horizontal
	signal VS : STD_LOGIC; -- Se�al de sincronizacion vertical
	signal OUTPUT_COLOR : STD_LOGIC_VECTOR (11 downto 0); 

-- Declaracion de componente vga_ctrl_640x480_60Hz
	COMPONENT vga_ctrl_640x480_60Hz
	PORT(
		rst : IN std_logic;
		clk : IN std_logic;
		rgb_in : IN std_logic_vector(11 downto 0);          
		HS : OUT std_logic;
		VS : OUT std_logic;
		hcount : OUT std_logic_vector(10 downto 0);
		vcount : OUT std_logic_vector(10 downto 0);
		rgb_out : OUT std_logic_vector(11 downto 0);
		blank : OUT std_logic
		);
	END COMPONENT;
	
begin

	-- Instanciacion componente vga_ctrl_640x480_60Hz
	DUT_VGA: vga_ctrl_640x480_60Hz 
	PORT MAP(
		rst => RST,
		clk => clk_interno,
		rgb_in => INPUT_COLOR,
		HS => HS,
		VS => VS,
		hcount => HCOUNT,
		vcount => VCOUNT,
		rgb_out => OUTPUT_COLOR,
		blank => open
	);


	-- generador de reloj de 50 MHZ (20 ns de periodo)
	clk_stimulus: process
	begin
		clk_interno <= '0';
		wait for 10 ns;
		clk_interno <= '1';
		wait for 10 ns;
	end process;

	
	-- proceso que escribe en el archivo siguiendo el siguiente formato:
	--
	-- current_sim_time time_units: hs vs red green blue (ex. 535 ns: 1 1 010 010 01)
	process (clk_interno)
	
	file file_pointer: text open WRITE_MODE is "write.txt";
	variable line_el: line;
		
	begin

		if rising_edge(clk_interno) then

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
			write(line_el, OUTPUT_COLOR(11 downto 8)); -- write the line (Red color).

			-- Write the green
			write(line_el, string'(" "));
			write(line_el, OUTPUT_COLOR(7 downto 4)); -- write the line (Green color).

        	-- Write the blue
        	write(line_el, string'(" "));
        	write(line_el, OUTPUT_COLOR(3 downto 0)); -- write the line (Blue color).

    	    writeline(file_pointer, line_el); -- write the contents into the file.

    	end if;
	end process;

	rst_stimulus: process
	begin
		RST <= '1';
		wait for 40 ns;
		RST <= '0';
		wait;
	end process;
   

	-- Dibuja el cuadro y asigna colores
    --
	--               |
	--     Rojo      |    Verde
	--               |
	-- -----------------------------
	--               | 
	--     Azul      |   Amarillo
	--               |
	--

	INPUT_COLOR <= "111100000000" when (((VCOUNT>=0) AND (VCOUNT<=239) AND (HCOUNT>=0) AND (HCOUNT<=319))) else 
				   "000011110000" when (((VCOUNT>=0) AND (VCOUNT<=239) AND (HCOUNT>319) AND (HCOUNT<640))) else
				   "000000001111" when (((VCOUNT>239) AND (VCOUNT<480) AND (HCOUNT>=0) AND (HCOUNT<=319))) else
				   "111111110000" when (((VCOUNT>239) AND (VCOUNT<480) AND (HCOUNT>319) AND (HCOUNT<640)));
	
	
	--figure: process(VCOUNT,HCOUNT)
	--	begin
	--		if ((VCOUNT>=0) AND (VCOUNT<=239) AND (HCOUNT>=0) AND (HCOUNT<=319)) then
	--			INPUT_COLOR <= COLOR;
	--		else
	--			INPUT_COLOR <= NOT(COLOR);
	--		end if;
	--	end process;


end Behavioral;


