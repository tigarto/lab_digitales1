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

----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity test_34seg_disp is
    Port ( CLK : in  STD_LOGIC; -- Clk  100MHz
           RST : in  STD_LOGIC; -- reset
		   MSG_SEL: in STD_LOGIC;
           RGB : out  STD_LOGIC_VECTOR (11 downto 0); -- RGB de salida a la pantalla
           HS : out  STD_LOGIC; -- Segnal de sincronizacion horizontal
           VS : out  STD_LOGIC); -- Segnal de sincronizacion vertical
end test_34seg_disp;

architecture Behavioral of test_34seg_disp is

-- Declaracion segnales para vga_ctrl_640x480_60Hz
	signal HCOUNT: STD_LOGIC_VECTOR (10 downto 0);
	signal VCOUNT: STD_LOGIC_VECTOR (10 downto 0);
	signal INT_RGB : STD_LOGIC_VECTOR (11 downto 0);
	signal clk_interno : STD_LOGIC;

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
	
	
	
	 --declaracion del display como componente
   COMPONENT display34segm is
       generic(SG_WD : integer range 0 to 31 := 5;
               DL : integer range 0 to 511 := 100 --DYSPLAY_LENGTH, the WIDTH is calculated by this module
               --DW:  --TODO: Display width
        );  
        port(segments : in STD_LOGIC_VECTOR (33 downto 0); --Which segments are actived: H-V-D1-D2
             posx : in integer range 0 to 639; 
             posy : in integer range 0 to 479;
             hcount : in  STD_LOGIC_VECTOR (10 downto 0);
             vcount : in  STD_LOGIC_VECTOR (10 downto 0);
             paint : out  STD_LOGIC --Signal to visualize the display
        );
   end COMPONENT;
	
	constant COLOR1: STD_LOGIC_VECTOR(11 downto 0) := x"0F0"; --GREEN
	constant COLOR3: STD_LOGIC_VECTOR(11 downto 0) := x"F00"; --RED
	
	constant LET1 : STD_LOGIC_VECTOR (33 downto 0):="0011000111000001110100000010000000"; --A
	constant LET2 : STD_LOGIC_VECTOR (33 downto 0):="0000001111011111111000000001000000"; --M
	
	signal sig_paint, sig_paint_disp1, sig_paint_disp2 : std_logic; --MUX to select displays
	signal sig_color : STD_LOGIC_VECTOR(11 downto 0) ; --MUX to select color in displays 
	signal sig_segm : STD_LOGIC_VECTOR (33 downto 0);   --MUX to select letter in displays
	
	
begin
    --MULTIPLEXERS TO SELECT COLOURS, DISPLAYS, MESSAGES, FONT
    sig_color <= COLOR1 when MSG_SEL='0' else
                 COLOR3;

    sig_paint <= sig_paint_disp1; --OR sig_paint_disp2;
    
    sig_segm <= LET1 when MSG_SEL='0' else
                LET2;
    
	INT_RGB <= sig_color when sig_paint='1' else
	           x"000"; --BLACK


   --Instanciación del display 34-segmentos
   Display1: display34segm  
       GENERIC MAP( SG_WD => 8, 
                    DL => 200
                   )
       PORT MAP( segments => sig_segm,
                 posx => 10,
                 posy => 100,
                 hcount => hcount,
                 vcount => vcount,
                 paint => sig_paint_disp1           
       );
   --Instanciación del display 34-segmentos
   --Display2: display34segm  
   --    GENERIC MAP( SG_WD => 4, 
   --                DL => 100
   --              )
   --    PORT MAP( segments => sig_segm,
   --              posx => 200,
   --              posy => 100,
   --              hcount => hcount,
   --              vcount => vcount,
   --             paint => sig_paint_disp2           
   --    );
       
       
    -- Instanciacion componente vga_ctrl_640x480_60Hz
	VGA: vga_ctrl_640x480_60Hz 
        PORT MAP(
            rst => RST,
            clk => clk_interno,
            rgb_in => INT_RGB,
            HS => HS,
            VS => VS,
            hcount => HCOUNT,
            vcount => VCOUNT,
            rgb_out => RGB,
            blank => open
        );
	
    -- generador de reloj de 50 MHZ
    process (clk)
	begin  
		if (clk'event and clk = '1') then
			clk_interno <= NOT clk_interno;
		end if;
	end process;
   
end Behavioral;
        
