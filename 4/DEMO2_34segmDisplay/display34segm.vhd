----------------------------------------------------------------------------------
-- Company: Universidad de Antiquia
-- email: john.buitrago@udea.edu.co 
-- Module Name:    34-segments Dysplay 
-- Description: Display 34-segmentos
--Dependencies:
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
USE ieee.numeric_std.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

entity display34segm is
       generic(SG_WD : integer range 0 to 31 := 5; --Segment width
               DL : integer range 0 to 511 := 100 --DYSPLAY_LENGTH
               --DW:  --TODO: Display width
        );  
        port(segments : in STD_LOGIC_VECTOR (33 downto 0);
             posx : in integer range 0 to 639;   --disp_posx 
             posy : in integer range 0 to 479;   --disp_posy
             hcount : in  STD_LOGIC_VECTOR (10 downto 0);
             vcount : in  STD_LOGIC_VECTOR (10 downto 0);
             paint : out  STD_LOGIC
        );
end display34segm;
    
architecture Behavioral of display34segm is
   
   constant v_bar : integer := (DL-5*SG_WD)/4; --vertical segment length
   constant h_bar : integer := v_bar + SG_WD;  --horizontal segment length
   
    --x-segments Reference positions 
    constant RX1 : INTEGER := posx;
    constant RX2 : INTEGER := RX1 + SG_WD;
    constant RX3 : INTEGER := RX2 + h_bar;
    constant RX4 : INTEGER := RX3 + SG_WD;
    constant RX5 : INTEGER := RX4 + h_bar;
    constant RX6 : INTEGER := RX5 + SG_WD;
    -- y-segments Reference positions     
    constant RY1 : INTEGER := posy;
    constant RY2 : INTEGER := RY1 + SG_WD;            
    constant RY3 : INTEGER := RY2 + v_bar;
    constant RY4 : INTEGER := RY3 + SG_WD;
    constant RY5 : INTEGER := RY4 + v_bar;             
    constant RY6 : INTEGER := RY5 + SG_WD;
    constant RY7 : INTEGER := RY6 + v_bar;
    constant RY8 : INTEGER := RY7 + SG_WD;
    constant RY9 : INTEGER := RY8 + v_bar;
    constant RY10 : INTEGER := RY9 + SG_WD;
        
    constant DIAG_SZ: INTEGER := v_bar; --Length of space for diagonals bars
        
    begin
     
    PAINT <= '1' WHEN ( --HORIZONTAL SEGMENTS
                        ((segments(33)='1') AND ((HCOUNT>=RX2) AND (HCOUNT<=RX3) AND (VCOUNT>RY1) AND (VCOUNT<(RY2))))  OR 
                        ((segments(32)='1') AND ((HCOUNT>=RX4) AND (HCOUNT<=RX5) AND (VCOUNT>RY1) AND (VCOUNT<(RY2))))  OR
                        ((segments(31)='1') AND ((HCOUNT>=RX2) AND (HCOUNT<=RX3) AND (VCOUNT>RY5) AND (VCOUNT<(RY6))))  OR
                        ((segments(30)='1') AND ((HCOUNT>=RX4) AND (HCOUNT<=RX5) AND (VCOUNT>RY5) AND (VCOUNT<(RY6))))  OR
                        ((segments(29)='1') AND ((HCOUNT>=RX2) AND (HCOUNT<=RX3) AND (VCOUNT>RY9) AND (VCOUNT<(RY10)))) OR 
                        ((segments(28)='1') AND ((HCOUNT>=RX4) AND (HCOUNT<=RX5) AND (VCOUNT>RY9) AND (VCOUNT<(RY10)))) OR
                        
                        --VERTICAL SEGMENTS
                        ((segments(27)='1') AND ((HCOUNT>RX1) AND (HCOUNT<RX2) AND (VCOUNT>=RY2) AND (VCOUNT<=(RY3))))  OR 
                        ((segments(26)='1') AND ((HCOUNT>RX1) AND (HCOUNT<RX2) AND (VCOUNT>=RY4) AND (VCOUNT<=(RY5))))  OR
                        ((segments(25)='1') AND ((HCOUNT>RX1) AND (HCOUNT<RX2) AND (VCOUNT>=RY6) AND (VCOUNT<=(RY7))))  OR
                        ((segments(24)='1') AND ((HCOUNT>RX1) AND (HCOUNT<RX2) AND (VCOUNT>=RY8) AND (VCOUNT<=(RY9))))  OR
                        ((segments(23)='1') AND ((HCOUNT>RX3) AND (HCOUNT<RX4) AND (VCOUNT>=RY2) AND (VCOUNT<=(RY3)))) OR 
                        ((segments(22)='1') AND ((HCOUNT>RX3) AND (HCOUNT<RX4) AND (VCOUNT>=RY4) AND (VCOUNT<=(RY5)))) OR
                        ((segments(21)='1') AND ((HCOUNT>RX3) AND (HCOUNT<RX4) AND (VCOUNT>=RY6) AND (VCOUNT<=(RY7)))) OR
                        ((segments(20)='1') AND ((HCOUNT>RX3) AND (HCOUNT<RX4) AND (VCOUNT>=RY8) AND (VCOUNT<=(RY9)))) OR
                        ((segments(19)='1') AND ((HCOUNT>RX5) AND (HCOUNT<RX6) AND (VCOUNT>=RY2) AND (VCOUNT<=(RY3)))) OR 
                        ((segments(18)='1') AND ((HCOUNT>RX5) AND (HCOUNT<RX6) AND (VCOUNT>=RY4) AND (VCOUNT<=(RY5)))) OR
                        ((segments(17)='1') AND ((HCOUNT>RX5) AND (HCOUNT<RX6) AND (VCOUNT>=RY6) AND (VCOUNT<=(RY7)))) OR
                        ((segments(16)='1') AND ((HCOUNT>RX5) AND (HCOUNT<RX6) AND (VCOUNT>=RY8) AND (VCOUNT<=(RY9)))) OR
                        
                        --DIAGONAL_1 SEGMENTS : (y-ptoy) = (x-ptox)
                        ((segments(15)='1') AND (((VCOUNT-RY2)<=(HCOUNT-RX2)) AND ((VCOUNT-RY2)>((HCOUNT-RX2)-SG_WD))
                                                  AND (HCOUNT>RX2) AND (VCOUNT <= RY2+DIAG_SZ) AND VCOUNT>RY2)       ) OR  
                        ((segments(14)='1') AND (((VCOUNT-RY2)<=(HCOUNT-RX4)) AND ((VCOUNT-RY2)>((HCOUNT-RX4)-SG_WD))
                                                  AND (HCOUNT>=RX4) AND (VCOUNT<=RY2+DIAG_SZ)  AND VCOUNT>RY2)       ) OR
                        ((segments(13)='1') AND (((VCOUNT-RY4)<=(HCOUNT-RX2)) AND ((VCOUNT-RY4)>((HCOUNT-RX2)-SG_WD))
                                                  AND (HCOUNT>RX2) AND (VCOUNT<RY4+DIAG_SZ) AND VCOUNT>RY4)          ) OR  
                        ((segments(12)='1') AND (((VCOUNT-RY4)<=(HCOUNT-RX4)) AND ((VCOUNT-RY4)>((HCOUNT-RX4)-SG_WD))
                                                  AND (HCOUNT>=RX4) AND (VCOUNT<=RY4+DIAG_SZ) AND VCOUNT>RY4)       )  OR
                        ((segments(11)='1') AND (((VCOUNT-RY6)<=(HCOUNT-RX2)) AND ((VCOUNT-RY6)>((HCOUNT-RX2)-SG_WD))
                                                  AND (HCOUNT>=RX2) AND (VCOUNT<=RY6+DIAG_SZ) AND VCOUNT>RY6)       )  OR  
                        ((segments(10)='1') AND (((VCOUNT-RY6)<=(HCOUNT-RX4)) AND ((VCOUNT-RY6)>((HCOUNT-RX4)-SG_WD))
                                                  AND (HCOUNT>=RX4) AND (VCOUNT<=RY6+DIAG_SZ) AND VCOUNT>RY6)       )  OR
                        ((segments(9)='1') AND (((VCOUNT-RY8)<=(HCOUNT-RX2)) AND ((VCOUNT-RY8)>((HCOUNT-RX2)-SG_WD))
                                                  AND (HCOUNT>=RX2) AND (VCOUNT<=RY8+DIAG_SZ) AND VCOUNT>RY8)       )  OR  
                        ((segments(8)='1') AND (((VCOUNT-RY8)<=(HCOUNT-RX4)) AND ((VCOUNT-RY8)>((HCOUNT-RX4)-SG_WD))
                                                  AND (HCOUNT>=RX4) AND (VCOUNT<=RY8+DIAG_SZ) AND VCOUNT>RY8)       )  OR
                        
                        --DIAGONAL_2 SEGMENTS : (y-ptoy) = -(x-ptox) 
                        ( (segments(7)='1') AND ((((VCOUNT-RY2)-(DIAG_SZ))>=-((HCOUNT-RX2))) AND 
                                                    (((VCOUNT-RY2)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX2)) AND 
                                                     (VCOUNT > RY2) AND (VCOUNT <= (RY2 + DIAG_SZ) )         ))       ) OR  
                        ( (segments(6)='1') AND ((((VCOUNT-RY2)-(DIAG_SZ))>=-((HCOUNT-RX4))) AND 
                                                    (((VCOUNT-RY2)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX4)) AND 
                                                     (VCOUNT > RY2) AND (VCOUNT <= (RY2 + DIAG_SZ) )         ))       ) OR                           
                        ( (segments(5)='1') AND ((((VCOUNT-RY4)-(DIAG_SZ))>=-((HCOUNT-RX2))) AND 
                                                    (((VCOUNT-RY4)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX2)) AND 
                                                     (VCOUNT > RY4) AND (VCOUNT <= (RY4 + DIAG_SZ) )         ))       ) OR  
                        ( (segments(4)='1') AND ((((VCOUNT-RY4)-(DIAG_SZ))>=-((HCOUNT-RX4))) AND 
                                                    (((VCOUNT-RY4)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX4)) AND 
                                                     (VCOUNT > RY4) AND (VCOUNT <= (RY4 + DIAG_SZ) )         ))       ) OR                          
                        ( (segments(3)='1') AND ((((VCOUNT-RY6)-(DIAG_SZ))>=-((HCOUNT-RX2))) AND 
                                                    (((VCOUNT-RY6)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX2)) AND 
                                                     (VCOUNT > RY6) AND (VCOUNT <= (RY6 + DIAG_SZ) )         ))       ) OR  
                        ( (segments(2)='1') AND ((((VCOUNT-RY6)-(DIAG_SZ))>=-((HCOUNT-RX4))) AND 
                                                    (((VCOUNT-RY6)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX4)) AND 
                                                     (VCOUNT > RY6) AND (VCOUNT <= (RY6 + DIAG_SZ) )         ))       ) OR                           
                        ( (segments(1)='1') AND ((((VCOUNT-RY8)-(DIAG_SZ))>=-((HCOUNT-RX2))) AND 
                                                    (((VCOUNT-RY8)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX2)) AND 
                                                     (VCOUNT > RY8) AND (VCOUNT <= (RY8 + DIAG_SZ) )         ))       ) OR  
                        ( (segments(0)='1') AND ((((VCOUNT-RY8)-(DIAG_SZ))>=-((HCOUNT-RX4))) AND 
                                                    (((VCOUNT-RY8)-(DIAG_SZ)-SG_WD)<-((HCOUNT-RX4)) AND 
                                                     (VCOUNT > RY8) AND (VCOUNT <= (RY8 + DIAG_SZ) )         ))       )
                       ) ELSE
             '0';
             
  end Behavioral;
