----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2018 11:04:42 AM
-- Design Name: 
-- Module Name: bin2gray_nbits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin2gray_nbits is
    generic (N : Integer := 4);
    Port ( BIN : in STD_LOGIC_VECTOR (N-1 downto 0);
           GRAY : out STD_LOGIC_VECTOR (N-1 downto 0));
end bin2gray_nbits;

architecture Behavioral of bin2gray_nbits is
begin
    G1: for I in 0 to N-2 generate
    begin
        GRAY(I) <= BIN(I) xor BIN(I+1);
    end generate;
    GRAY(N-1) <= BIN(N-1);
end Behavioral;
