library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE IEEE.numeric_std.ALL;

entity Convertor2 is
	port(Bin: in std_logic_vector (15 downto 0);
	c4,c3,c2,c1: out std_logic_vector (3 downto 0));
end Convertor2;

architecture Comportamentala of Convertor2 is
signal int,int1,int2,int3: integer := 0;
signal s4, s3, s2, s1: integer := 0; 
begin
	int <= to_integer(UNSIGNED(Bin));
	s1 <= int mod 10;
	int1 <= int / 10;
	s2 <= int1 mod 10;
	int2 <= int1 / 10;
	s3 <= int2 mod 10;
	int3 <= int2 / 10;
	s4 <= int3;
	c1 <= std_logic_vector(to_unsigned(s1,4));
	c2 <= std_logic_vector(to_unsigned(s2,4));
	c3 <= std_logic_vector(to_unsigned(s3,4));
	c4 <= std_logic_vector(to_unsigned(s4,4));
end Comportamentala;