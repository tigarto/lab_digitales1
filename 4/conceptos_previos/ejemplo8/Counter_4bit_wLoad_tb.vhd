library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter_4bit_wLoad_tb is
end Counter_4bit_wLoad_tb;

architecture Behavioral of Counter_4bit_wLoad_tb is
    
    -- Declaracion de componentes
 
    component Counter_4bit_wLoad is
      port(
        clk , rst: in std_logic;
        en: in std_logic;
        load: in std_logic;
        cnt_in : in std_logic_vector(3 downto 0);
        cnt : out std_logic_vector(3 downto 0)
      );
    end component;
    -- Señales empleadas

    signal clk_sig: std_logic; 
    signal rst_sig: std_logic := '1'; 
    signal en_sig: std_logic; 
    signal load_sig: std_logic;  
    signal cnt_in_sig: std_logic_vector(3 downto 0) := "1011";   
    signal cnt_sig: std_logic_vector(3 downto 0);   

begin

  DUT: Counter_4bit_wLoad
	Port map (
        clk => clk_sig,
        rst => rst_sig,
        en => en_sig,
        load => load_sig,
        cnt_in => cnt_in_sig,
        cnt => cnt_sig
  );
  
  clk_gen_signal: process
  begin
    clk_sig <= '0';
    wait for 13 ns;
    clk_sig <= '1';
    wait for 13 ns;
  end process;

  en_gen_signal: process
  begin
    en_sig <= '1';
    wait for 200 ns;
    en_sig <= '0';
    wait for 100 ns;
    en_sig <= '1';
    wait;
  end process;

  load_gen_signal: process
  begin
    load_sig <= '0';
    wait for 110 ns;
    load_sig <= '1';
    wait for 20 ns;
    load_sig <= '0';
    wait;
  end process;

end Behavioral;
