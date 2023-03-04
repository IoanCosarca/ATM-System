library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE IEEE.numeric_std.ALL; 
entity convertor is
	port(c4,c3,c2,c1: in std_logic_vector (3 downto 0);
	bin	: out std_logic_vector(15 downto 0));
end  convertor;

architecture bhv of convertor is
signal int: integer:=0;
signal s4, s3, s2, s1: integer:=0; 
begin 
		s4 <= to_integer(UNSIGNED(c4));
		s3 <= to_integer(UNSIGNED(c3));
		s2 <= to_integer(UNSIGNED(c2));
		s1 <= to_integer(UNSIGNED(c1));
		int<= s4*1000+s3*100+s2*10+s1;
		bin <=std_logic_vector(to_unsigned(int,16));
end bhv;
	