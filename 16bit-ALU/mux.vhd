library ieee;
use ieee.std_logic_1164.all;

entity mux is
	port(
	S : in std_logic_vector(3 downto 0);
	muxin : in std_logic_vector(15 downto 0);
	
	muxout : out std_logic
	);
end mux;

architecture func of mux is
begin
with S select
	muxout <= muxin(0) when "0000",
				 muxin(1) when "0001",
				 muxin(2) when "0010",
				 muxin(3) when "0011",
				 muxin(4) when "0100",
				 muxin(5) when "0101",
				 muxin(6) when "0110",
				 muxin(7) when "0111",
				 muxin(8) when "1000",
				 muxin(9) when "1001",
				 muxin(10) when "1010",
				 muxin(11) when "1011",
				 muxin(12) when "1100",
				 muxin(13) when "1101",
				 muxin(14) when "1110",
				 muxin(15) when "1111";
				 
end func;