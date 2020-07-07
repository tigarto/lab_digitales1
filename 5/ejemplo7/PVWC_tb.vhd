library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity PVWC_TB is
end PVWC_TB;

architecture PVWC_TB_arch of PVWC_TB is

    -- declaraciones modelo FSM

    signal Clock, Reset, Press, Open_CW, Close_CCW: STD_LOGIC;   

    component PVWC is
      Port ( Clock : in STD_LOGIC;
             Reset : in STD_LOGIC;
             Press : in STD_LOGIC;
             Open_CW : out STD_LOGIC;
             Close_CCW : out STD_LOGIC);
    end component;

begin

  DUT: PVWC
	Port map (
    Clock => Clock,
    Reset => Reset,
    Press => Press,
    Open_CW => Open_CW,
    Close_CCW => Close_CCW
  );
  
  Clock_stimulus: process
  begin
    Clock <= '0';
    wait for 10 ns;
    Clock <= '1';
    wait for 10 ns;
  end process;

  Reset_stimulus: process
  begin
    Reset <= '0';
    wait for 5 ns;     -- 5 ns
    Reset <= '1';
    wait;   -- 200 ns  
  end  process;

  Press_stimulus: process
  begin
    Press <= '0';
    wait for 25 ns;     -- 25 ns    
    Press <= '1';
    wait for 5 ns;      -- 30 ns    
    Press <= '0';
    wait for 15 ns;     -- 45 ns    
    Press <= '1';
    wait for 5 ns;     -- 50 ns    
    Press <= '0';
    wait;
  end process;
   
end architecture;