library ieee;
use ieee.std_logic_1164.all;

entity ror_16bit is
port(
	  A : in std_logic_vector(15 downto 0);	  
	  sonuc_ror : out std_logic_vector(15 downto 0);
	  sonuc_rol : out std_logic_vector(15 downto 0)
	  );
end ror_16bit;

architecture func of ror_16bit is

begin
sonuc_ror(0) <= A(1);
sonuc_ror(1) <= A(2);
sonuc_ror(2) <= A(3);
sonuc_ror(3) <= A(4);
sonuc_ror(4) <= A(5);
sonuc_ror(5) <= A(6);
sonuc_ror(6) <= A(7);
sonuc_ror(7) <= A(8);
sonuc_ror(8) <= A(9);
sonuc_ror(9) <= A(10);
sonuc_ror(10) <= A(11);
sonuc_ror(11) <= A(12);
sonuc_ror(12) <= A(13);
sonuc_ror(13) <= A(14);
sonuc_ror(14) <= A(15);
sonuc_ror(15) <= A(0);


sonuc_rol(1) <= A(0);
sonuc_rol(2) <= A(1);
sonuc_rol(3) <= A(2);
sonuc_rol(4) <= A(3);
sonuc_rol(5) <= A(4);
sonuc_rol(6) <= A(5);
sonuc_rol(7) <= A(6);
sonuc_rol(8) <= A(7);
sonuc_rol(9) <= A(8);
sonuc_rol(10) <= A(9);
sonuc_rol(11) <= A(10);
sonuc_rol(12) <= A(11);
sonuc_rol(13) <= A(12);
sonuc_rol(14) <= A(13);
sonuc_rol(15) <= A(14);
sonuc_rol(0) <= A(15);
end func;

