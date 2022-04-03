library ieee;
use ieee.std_logic_1164.all;

entity adder16bit is
	port(
	A_in : in std_logic_vector(15 downto 0);
	B_in : in std_logic_vector(15 downto 0);
	C_in : in std_logic;
	C_out : out std_logic;
	F : out std_logic_vector(15 downto 0);
	and_sonuc : out std_logic_vector(15 downto 0);
	xor_sonuc : out std_logic_vector(15 downto 0)
	);
end adder16bit;

architecture func of adder16bit is
component fulladder
	port(
	A : in std_logic;
	B : in std_logic;
	Cin : in std_logic;
	Cout : out std_logic;
	Q : out std_logic;
	AandB : out std_logic;
	AxorB : out std_logic
	);
end component;
signal sig_cout : std_logic_vector(15 downto 0);

begin
bit_0 : fulladder port map(A => A_in(0), B => B_in(0), Cin => C_in,Q => F(0), Cout => sig_cout(0), AandB => and_sonuc(0), AxorB => xor_sonuc(0));
bit_1 : fulladder port map(A => A_in(1), B => B_in(1), Cin => sig_cout(0),Q => F(1), Cout => sig_cout(1), AandB => and_sonuc(1), AxorB => xor_sonuc(1));
bit_2 : fulladder port map(A => A_in(2), B => B_in(2), Cin => sig_cout(1),Q => F(2), Cout => sig_cout(2), AandB => and_sonuc(2), AxorB => xor_sonuc(2));
bit_3 : fulladder port map(A => A_in(3), B => B_in(3), Cin => sig_cout(2),Q => F(3), Cout => sig_cout(3), AandB => and_sonuc(3), AxorB => xor_sonuc(3));
bit_4 : fulladder port map(A => A_in(4), B => B_in(4), Cin => sig_cout(3),Q => F(4), Cout => sig_cout(4), AandB => and_sonuc(4), AxorB => xor_sonuc(4));
bit_5 : fulladder port map(A => A_in(5), B => B_in(5), Cin => sig_cout(4),Q => F(5), Cout => sig_cout(5), AandB => and_sonuc(5), AxorB => xor_sonuc(5));
bit_6 : fulladder port map(A => A_in(6), B => B_in(6), Cin => sig_cout(5),Q => F(6), Cout => sig_cout(6), AandB => and_sonuc(6), AxorB => xor_sonuc(6));
bit_7 : fulladder port map(A => A_in(7), B => B_in(7), Cin => sig_cout(6),Q => F(7), Cout => sig_cout(7), AandB => and_sonuc(7), AxorB => xor_sonuc(7));
bit_8 : fulladder port map(A => A_in(8), B => B_in(8), Cin => sig_cout(7),Q => F(8), Cout => sig_cout(8), AandB => and_sonuc(8), AxorB => xor_sonuc(8));
bit_9 : fulladder port map(A => A_in(9), B => B_in(9), Cin => sig_cout(8),Q => F(9), Cout => sig_cout(9), AandB => and_sonuc(9), AxorB => xor_sonuc(9));
bit_10 : fulladder port map(A => A_in(10), B => B_in(10), Cin => sig_cout(9),Q => F(10), Cout => sig_cout(10), AandB => and_sonuc(10), AxorB => xor_sonuc(10));
bit_11 : fulladder port map(A => A_in(11), B => B_in(11), Cin => sig_cout(10),Q => F(11), Cout => sig_cout(11), AandB => and_sonuc(11), AxorB => xor_sonuc(11));
bit_12 : fulladder port map(A => A_in(12), B => B_in(12), Cin => sig_cout(11),Q => F(12), Cout => sig_cout(12), AandB => and_sonuc(12), AxorB => xor_sonuc(12));
bit_13 : fulladder port map(A => A_in(13), B => B_in(13), Cin => sig_cout(12),Q => F(13), Cout => sig_cout(13), AandB => and_sonuc(13), AxorB => xor_sonuc(13));
bit_14 : fulladder port map(A => A_in(14), B => B_in(14), Cin => sig_cout(13),Q => F(14), Cout => sig_cout(14), AandB => and_sonuc(14), AxorB => xor_sonuc(14));
bit_15 : fulladder port map(A => A_in(15), B => B_in(15), Cin => sig_cout(14),Q => F(15), Cout => C_out, AandB => and_sonuc(15), AxorB => xor_sonuc(15));													 
end func;