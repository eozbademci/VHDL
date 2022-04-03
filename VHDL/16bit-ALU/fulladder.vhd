library ieee;
use ieee.std_logic_1164.all;

entity fulladder is
	port(
	A : in std_logic;
	B : in std_logic;
	Cin : in std_logic;
	Cout : out std_logic;
	AandB : out std_logic;
	AxorB : out std_logic;
	Q : out std_logic
	);
end fulladder;

architecture full_func of fulladder is
signal sig_1 : std_logic;
begin
sig_1 <= A xor B;
Q <= sig_1 xor Cin;
AandB <= A and B;
Cout <= (sig_1 and Cin) or (A and B);
AxorB <= sig_1;				 
end full_func;