library ieee;
use ieee.std_logic_1164.all;

entity or_16bit is
port(
	  A_or : in std_logic_vector(15 downto 0);
	  B_or : in std_logic_vector(15 downto 0);
	  sonuc_or : out std_logic_vector(15 downto 0)
	  );
end or_16bit;

architecture func of or_16bit is

begin
sonuc_or <= A_or or B_or;

end func;

