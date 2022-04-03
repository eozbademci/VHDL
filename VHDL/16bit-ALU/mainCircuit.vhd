-- Erdal Özbademci
-- B200109036

-- 0000 --  AC <- AC + DR
-- 0001 --  AC <- AC - DR
-- 0010 --	AC <- AC + DR + C
-- 0011 --	AC <- AC + DR'
-- 0100 --	AC <- DR
-- 0101 --	AC <- DR + 1
-- 0110 --	AC <- INP
-- 0111 --	AC <- INP + 1
-- 1000 --	AC <- AC + 1
-- 1001 --	AC <- AC - 1
-- 1010 --	AC <- DR - 1
-- 1011 --	AC <- AC and DR
-- 1100 --	AC <- AC or DR
-- 1101 --	AC <- AC xor DR
-- 1110 --	AC <- ror(AC)
-- 1111 --	AC <- rol(AC)

library ieee;
use ieee.std_logic_1164.all;

entity mainCircuit is
	port(
	AC : in std_logic_vector(15 downto 0);
	DR : in std_logic_vector(15 downto 0);
	INP : in std_logic_vector(15 downto 0);
	sec : in std_logic_vector(3 downto 0);
	C : in std_logic;
	
	Cout : out std_logic;
	Sonuc : out std_logic_vector(15 downto 0)
	);
end mainCircuit;

architecture func2 of mainCircuit is
component mux
	port(
	S : in std_logic_vector(3 downto 0);
	muxin: in std_logic_vector(15 downto 0);
	muxout : out std_logic
	);
end component;

component adder16bit
	port(
	A_in : in std_logic_vector(15 downto 0);
	B_in : in std_logic_vector(15 downto 0);
	C_in : in std_logic;
	C_out : out std_logic;
	F : out std_logic_vector(15 downto 0);
	and_sonuc : out std_logic_vector(15 downto 0);
	xor_sonuc : out std_logic_vector(15 downto 0)
	);
end component;

component or_16bit
	port(
	A_or : in std_logic_vector(15 downto 0);
	B_or : in std_logic_vector(15 downto 0);
	sonuc_or : out std_logic_vector(15 downto 0)
	);
end component;
component ror_16bit
	port(
	A : in std_logic_vector(15 downto 0);
	sonuc_rol : out std_logic_vector(15 downto 0);
	sonuc_ror : out std_logic_vector(15 downto 0)
	);
end component;


signal sonuc_AC : std_logic_vector(15 downto 0);
signal sonuc_DR : std_logic_vector(15 downto 0);
signal signal_c : std_logic;
signal signal_and : std_logic_vector(15 downto 0);
signal signal_toplam : std_logic_vector(15 downto 0);
signal signal_or : std_logic_vector(15 downto 0);
signal signal_xor : std_logic_vector(15 downto 0);
signal signal_ror : std_logic_vector(15 downto 0);
signal signal_rol : std_logic_vector(15 downto 0);


begin
C_CONTROL : mux port map(S => sec, muxin(0) => '0', muxin(1) => '1', muxin(2) => C, muxin(4 downto 3) => "00",
								 muxin(5) => '1', muxin(6) => '0', muxin(10 downto 7) => "1111", muxin(11) => '0', muxin(12) => '0', muxout => signal_c);

AC_D0 : mux port map(S => sec, muxin(0) => AC(0), muxin(1) => AC(0), muxin(2) => AC(0),  muxin(3) => AC(0),
							muxin(7 downto 4) => "0000", muxin(8) => AC(0), muxin(9) => AC(0), muxin(10)=> '0', muxin(11) => AC(0), muxin(12) => AC(0), muxin(13) => AC(0), muxin(14) => AC(0), muxin(15) => AC(0), muxout =>sonuc_AC(0));
							
DR_D0 : mux port map(S => sec, muxin(0) => DR(0), muxin(1) => not(DR(0)), muxin(2) => DR(0), muxin(3) => not(DR(0)),
							muxin(4) => DR(0), muxin(5) => DR(0), muxin(6) => INP(0), muxin(7) => INP(0), muxin(9 downto 8) => "00", muxin(10) => DR(0), 
							muxin(11) => DR(0), muxin(12) => DR(0), muxin(13) => DR(0), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(0));

AC_D1 : mux port map(S => sec, muxin(0) => AC(1), muxin(1) => AC(1), muxin(2) => AC(1),  muxin(3) => AC(1),
							muxin(7 downto 4) => "0000", muxin(8) => AC(1), muxin(9) => AC(1), muxin(10)=> '1', muxin(11) => AC(1), muxin(12) => AC(1), muxin(13) => AC(1), muxin(14) => AC(1), muxin(15) => AC(1), muxout =>sonuc_AC(1));
							
DR_D1 : mux port map(S => sec, muxin(0) => DR(1), muxin(1) => not(DR(1)), muxin(2) => DR(1), muxin(3) => not(DR(1)),
							muxin(4) => DR(1), muxin(5) => DR(1), muxin(6) => INP(1), muxin(7) => INP(1), muxin(9 downto 8) => "10", muxin(10) => DR(1), 
							muxin(11) => DR(1), muxin(12) => DR(1), muxin(13) => DR(1), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(1));


AC_D2 : mux port map(S => sec, muxin(0) => AC(2), muxin(1) => AC(2), muxin(2) => AC(2),  muxin(3) => AC(2),
							muxin(7 downto 4) => "0000", muxin(8) => AC(2), muxin(9) => AC(2), muxin(10)=> '1', muxin(11) => AC(2), muxin(12) => AC(2), muxin(13) => AC(2),  muxin(14) => AC(2), muxin(15) => AC(2), muxout =>sonuc_AC(2));
							
DR_D2 : mux port map(S => sec, muxin(0) => DR(2), muxin(1) => not(DR(2)), muxin(2) => DR(2), muxin(3) => not(DR(2)),
							muxin(4) => DR(2), muxin(5) => DR(2), muxin(6) => INP(2), muxin(7) => INP(2), muxin(9 downto 8) => "10", muxin(10) => DR(2), 
							muxin(11) => DR(2), muxin(12) => DR(2), muxin(13) => DR(2), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(2));


AC_D3 : mux port map(S => sec, muxin(0) => AC(3), muxin(1) => AC(3), muxin(2) => AC(3),  muxin(3) => AC(3),
							muxin(7 downto 4) => "0000", muxin(8) => AC(3), muxin(9) => AC(3), muxin(10)=> '1', muxin(11) => AC(3), muxin(12) => AC(3), muxin(13) => AC(3),  muxin(14) => AC(3), muxin(15) => AC(3), muxout =>sonuc_AC(3));
							
DR_D3 : mux port map(S => sec, muxin(0) => DR(3), muxin(1) => not(DR(3)), muxin(2) => DR(3), muxin(3) => not(DR(3)),
							muxin(4) => DR(3), muxin(5) => DR(3), muxin(6) => INP(3), muxin(7) => INP(3), muxin(9 downto 8) => "10", muxin(10) => DR(3), 
							muxin(11) => DR(3), muxin(12) => DR(3), muxin(13) => DR(3), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(3));


AC_D4 : mux port map(S => sec, muxin(0) => AC(4), muxin(1) => AC(4), muxin(2) => AC(4),  muxin(3) => AC(4),
							muxin(7 downto 4) => "0000", muxin(8) => AC(4), muxin(9) => AC(4), muxin(10)=> '1', muxin(11) => AC(4), muxin(12) => AC(4), muxin(13) => AC(4),  muxin(14) => AC(4), muxin(15) => AC(4), muxout =>sonuc_AC(4));
							
DR_D4 : mux port map(S => sec, muxin(0) => DR(4), muxin(1) => not(DR(4)), muxin(2) => DR(4), muxin(3) => not(DR(4)),
							muxin(4) => DR(4), muxin(5) => DR(4), muxin(6) => INP(4), muxin(7) => INP(4), muxin(9 downto 8) => "10", muxin(10) => DR(4), 
							muxin(11) => DR(4), muxin(12) => DR(4), muxin(13) => DR(4), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(4));


AC_D5 : mux port map(S => sec, muxin(0) => AC(5), muxin(1) => AC(5), muxin(2) => AC(5),  muxin(3) => AC(5),
							muxin(7 downto 4) => "0000", muxin(8) => AC(5), muxin(9) => AC(5), muxin(10)=> '1', muxin(11) => AC(5), muxin(12) => AC(5), muxin(13) => AC(5),  muxin(14) => AC(5), muxin(15) => AC(5), muxout =>sonuc_AC(5));
							
DR_D5 : mux port map(S => sec, muxin(0) => DR(5), muxin(1) => not(DR(5)), muxin(2) => DR(5), muxin(3) => not(DR(5)),
							muxin(4) => DR(5), muxin(5) => DR(5), muxin(6) => INP(5), muxin(7) => INP(5), muxin(9 downto 8) => "10", muxin(10) => DR(5), 
							muxin(11) => DR(5), muxin(12) => DR(5), muxin(13) => DR(5), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(5));


AC_D6 : mux port map(S => sec, muxin(0) => AC(6), muxin(1) => AC(6), muxin(2) => AC(6),  muxin(3) => AC(6),
							muxin(7 downto 4) => "0000", muxin(8) => AC(6), muxin(9) => AC(6), muxin(10)=> '1', muxin(11) => AC(6), muxin(12) => AC(6), muxin(13) => AC(6),  muxin(14) => AC(6), muxin(15) => AC(6), muxout =>sonuc_AC(6));
							
DR_D6 : mux port map(S => sec, muxin(0) => DR(6), muxin(1) => not(DR(6)), muxin(2) => DR(6), muxin(3) => not(DR(6)),
							muxin(4) => DR(6), muxin(5) => DR(6), muxin(6) => INP(6), muxin(7) => INP(6), muxin(9 downto 8) => "10", muxin(10) => DR(6), 
							muxin(11) => DR(6), muxin(12) => DR(6), muxin(13) => DR(6), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(6));


AC_D7 : mux port map(S => sec, muxin(0) => AC(7), muxin(1) => AC(7), muxin(2) => AC(7),  muxin(3) => AC(7),
							muxin(7 downto 4) => "0000", muxin(8) => AC(7), muxin(9) => AC(7), muxin(10)=> '1', muxin(11) => AC(7), muxin(12) => AC(7), muxin(13) => AC(7),  muxin(14) => AC(7), muxin(15) => AC(7), muxout =>sonuc_AC(7));
							
DR_D7 : mux port map(S => sec, muxin(0) => DR(7), muxin(1) => not(DR(7)), muxin(2) => DR(7), muxin(3) => not(DR(7)),
							muxin(4) => DR(7), muxin(5) => DR(7), muxin(6) => INP(7), muxin(7) => INP(7), muxin(9 downto 8) => "10", muxin(10) => DR(7), 
							muxin(11) => DR(7), muxin(12) => DR(7), muxin(13) => DR(7), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(7));


AC_D8 : mux port map(S => sec, muxin(0) => AC(8), muxin(1) => AC(8), muxin(2) => AC(8),  muxin(3) => AC(8),
							muxin(7 downto 4) => "0000", muxin(8) => AC(8), muxin(9) => AC(8), muxin(10)=> '1', muxin(11) => AC(8), muxin(12) => AC(8), muxin(13) => AC(8),  muxin(14) => AC(8), muxin(15) => AC(8), muxout =>sonuc_AC(8));
							
DR_D8 : mux port map(S => sec, muxin(0) => DR(8), muxin(1) => not(DR(8)), muxin(2) => DR(8), muxin(3) => not(DR(8)),
							muxin(4) => DR(8), muxin(5) => DR(8), muxin(6) => INP(8), muxin(7) => INP(8), muxin(9 downto 8) => "10", muxin(10) => DR(8), 
							muxin(11) => DR(8), muxin(12) => DR(8), muxin(13) => DR(8), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(8));


AC_D9 : mux port map(S => sec, muxin(0) => AC(9), muxin(1) => AC(9), muxin(2) => AC(9),  muxin(3) => AC(9),
							muxin(7 downto 4) => "0000", muxin(8) => AC(9), muxin(9) => AC(9), muxin(10)=> '1', muxin(11) => AC(9), muxin(12) => AC(9), muxin(13) => AC(9),  muxin(14) => AC(9), muxin(15) => AC(9), muxout =>sonuc_AC(9));
							
DR_D9 : mux port map(S => sec, muxin(0) => DR(9), muxin(1) => not(DR(9)), muxin(2) => DR(9), muxin(3) => not(DR(9)),
							muxin(4) => DR(9), muxin(5) => DR(9), muxin(6) => INP(9), muxin(7) => INP(9), muxin(9 downto 8) => "10", muxin(10) => DR(9), 
							muxin(11) => DR(9), muxin(12) => DR(9), muxin(13) => DR(9), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(9));


AC_D10 : mux port map(S => sec, muxin(0) => AC(10), muxin(1) => AC(10), muxin(2) => AC(10),  muxin(3) => AC(10),
							muxin(7 downto 4) => "0000", muxin(8) => AC(10), muxin(9) => AC(10), muxin(10)=> '1', muxin(11) => AC(10), muxin(12) => AC(10), muxin(13) => AC(10),  muxin(14) => AC(10), muxin(15) => AC(10), muxout =>sonuc_AC(10));
							
DR_D10 : mux port map(S => sec, muxin(0) => DR(10), muxin(1) => not(DR(10)), muxin(2) => DR(10), muxin(3) => not(DR(10)),
							muxin(4) => DR(10), muxin(5) => DR(10), muxin(6) => INP(10), muxin(7) => INP(10), muxin(9 downto 8) => "10", muxin(10) => DR(10), 
							muxin(11) => DR(10), muxin(12) => DR(10), muxin(13) => DR(10), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(10));

AC_D11 : mux port map(S => sec, muxin(0) => AC(11), muxin(1) => AC(11), muxin(2) => AC(11),  muxin(3) => AC(11),
							muxin(7 downto 4) => "0000", muxin(8) => AC(11), muxin(9) => AC(11), muxin(10)=> '1', muxin(11) => AC(11), muxin(12) => AC(11), muxin(13) => AC(11),  muxin(14) => AC(11), muxin(15) => AC(11), muxout =>sonuc_AC(11));
							
DR_D11 : mux port map(S => sec, muxin(0) => DR(11), muxin(1) => not(DR(11)), muxin(2) => DR(11), muxin(3) => not(DR(11)),
							muxin(4) => DR(11), muxin(5) => DR(11), muxin(6) => INP(11), muxin(7) => INP(11), muxin(9 downto 8) => "10", muxin(10) => DR(11), 
							muxin(11) => DR(11), muxin(12) => DR(11), muxin(13) => DR(11), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(11));


AC_D12 : mux port map(S => sec, muxin(0) => AC(12), muxin(1) => AC(12), muxin(2) => AC(12),  muxin(3) => AC(12),
							muxin(7 downto 4) => "0000", muxin(8) => AC(12), muxin(9) => AC(12), muxin(10)=> '1', muxin(11) => AC(12), muxin(12) => AC(12), muxin(13) => AC(12),  muxin(14) => AC(12), muxin(15) => AC(12), muxout =>sonuc_AC(12));
							
DR_D12 : mux port map(S => sec, muxin(0) => DR(12), muxin(1) => not(DR(12)), muxin(2) => DR(12), muxin(3) => not(DR(12)),
							muxin(4) => DR(12), muxin(5) => DR(12), muxin(6) => INP(12), muxin(7) => INP(12), muxin(9 downto 8) => "10", muxin(10) => DR(12), 
							muxin(11) => DR(12), muxin(12) => DR(12), muxin(13) => DR(12), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(12));


AC_D13 : mux port map(S => sec, muxin(0) => AC(13), muxin(1) => AC(13), muxin(2) => AC(13),  muxin(3) => AC(13),
							muxin(7 downto 4) => "0000", muxin(8) => AC(13), muxin(9) => AC(13), muxin(10)=> '1', muxin(11) => AC(13), muxin(12) => AC(13), muxin(13) => AC(13),  muxin(14) => AC(13), muxin(15) => AC(13), muxout =>sonuc_AC(13));
							
DR_D13 : mux port map(S => sec, muxin(0) => DR(13), muxin(1) => not(DR(13)), muxin(2) => DR(13), muxin(3) => not(DR(13)),
							muxin(4) => DR(13), muxin(5) => DR(13), muxin(6) => INP(13), muxin(7) => INP(13), muxin(9 downto 8) => "10", muxin(10) => DR(13), 
							muxin(11) => DR(13), muxin(12) => DR(13), muxin(13) => DR(13), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(13));


AC_D14 : mux port map(S => sec, muxin(0) => AC(14), muxin(1) => AC(14), muxin(2) => AC(14),  muxin(3) => AC(14),
							muxin(7 downto 4) => "0000", muxin(8) => AC(14), muxin(9) => AC(14), muxin(10)=> '1', muxin(11) => AC(14), muxin(12) => AC(14), muxin(13) => AC(14),  muxin(14) => AC(14), muxin(15) => AC(14), muxout =>sonuc_AC(14));
							
DR_D14 : mux port map(S => sec, muxin(0) => DR(14), muxin(1) => not(DR(14)), muxin(2) => DR(14), muxin(3) => not(DR(14)),
							muxin(4) => DR(14), muxin(5) => DR(14), muxin(6) => INP(14), muxin(7) => INP(14), muxin(9 downto 8) => "10", muxin(10) => DR(14), 
							muxin(11) => DR(14), muxin(12) => DR(14), muxin(13) => DR(14), muxin(15 downto 14)=> "00", muxout =>sonuc_DR(14));


AC_D15 : mux port map(S => sec, muxin(0) => AC(15), muxin(1) => AC(15), muxin(2) => AC(15),  muxin(3) => AC(15),
							muxin(7 downto 4) => "0000", muxin(8) => AC(15), muxin(9) => AC(15), muxin(10)=> '1', muxin(11) => AC(15), muxin(12) => AC(15), muxin(13) => AC(15),  muxin(14) => AC(15), muxin(15) => AC(15), muxout =>sonuc_AC(15));
							
DR_D15 : mux port map(S => sec, muxin(0) => DR(15), muxin(1) => not(DR(15)), muxin(2) => DR(15), muxin(3) => not(DR(15)),
							muxin(4) => DR(15), muxin(5) => DR(15), muxin(6) => INP(15), muxin(7) => INP(15), muxin(9 downto 8) => "10", muxin(10) => DR(15), 
							muxin(11) => DR(15), muxin(12) => DR(15), muxin(13) => DR(15), muxin(15 downto 14)=> "00",  muxout =>sonuc_DR(15));





FULL_ADDER : adder16bit port map( C_in => signal_c, A_in(0) => sonuc_AC(0), B_in(0) => sonuc_DR(0),
											 A_in(1) => sonuc_AC(1), B_in(1) => sonuc_DR(1),
											 A_in(2) => sonuc_AC(2), B_in(2) => sonuc_DR(2),
											 A_in(3) => sonuc_AC(3), B_in(3) => sonuc_DR(3),
											 A_in(4) => sonuc_AC(4), B_in(4) => sonuc_DR(4),
											 A_in(5) => sonuc_AC(5), B_in(5) => sonuc_DR(5),
											 A_in(6) => sonuc_AC(6), B_in(6) => sonuc_DR(6),
											 A_in(7) => sonuc_AC(7), B_in(7) => sonuc_DR(7),
											 A_in(8) => sonuc_AC(8), B_in(8) => sonuc_DR(8),
											 A_in(9) => sonuc_AC(9), B_in(9) => sonuc_DR(9),
											 A_in(10) => sonuc_AC(10), B_in(10) => sonuc_DR(10),
											 A_in(11) => sonuc_AC(11), B_in(11) => sonuc_DR(11),
											 A_in(12) => sonuc_AC(12), B_in(12) => sonuc_DR(12),
											 A_in(13) => sonuc_AC(13), B_in(13) => sonuc_DR(13),
											 A_in(14) => sonuc_AC(14), B_in(14) => sonuc_DR(14),
											 A_in(15) => sonuc_AC(15), B_in(15) => sonuc_DR(15),
											 C_out => Cout, F => signal_toplam, and_sonuc => signal_and, xor_sonuc => signal_xor);

AC_DR : or_16bit port map(A_or => sonuc_AC, B_or => Sonuc_DR, sonuc_or => signal_or);

ROL_ROR : ror_16bit port map(A => sonuc_AC, sonuc_ror => signal_ror, sonuc_rol => signal_rol);
with sec select
	Sonuc <=  signal_toplam when "0000",
				 signal_toplam when "0001",
				 signal_toplam when "0010",
				 signal_toplam when "0011",
				 signal_toplam when "0100",
				 signal_toplam when "0101",
				 signal_toplam when "0110",
				 signal_toplam when "0111",
				 signal_toplam when "1000",
				 signal_toplam when "1001",
				 signal_toplam when "1010",
				 signal_and when "1011",
				 signal_or when "1100",
				 signal_xor when "1101",
				 signal_ror when "1110",
				 signal_rol when "1111";
				 


end func2;