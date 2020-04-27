library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter_4bit_Up_tb is
end Counter_4bit_Up_tb;

architecture Behavioral of Counter_4bit_Up_tb is
    
    -- Declaracion de componentes

    component Counter_4bit_Up is
        port(
            clk , rst: in std_logic;
            cnt : out unsigned(3 downto 0)
        );
    end component;
    
    -- Señales empleadas

    signal clk_sig, rst_sig: std_logic;   
    signal cnt_sig: unsigned(3 downto 0);   

begin

  DUT: Counter_4bit_Up
	Port map (
        clk => clk_sig,
        rst => rst_sig,
        cnt => cnt_sig
  );
  
  clk_gen_signal: process
  begin
    clk_sig <= '0';
    wait for 13 ns;
    clk_sig <= '1';
    wait for 13 ns;
  end process;

  rst_gen_signal: process
  begin
    rst_sig <= '0';
    wait for 15 ns;     -- 15 ns
    rst_sig <= '1';
    wait;
  end process;

end Behavioral;
