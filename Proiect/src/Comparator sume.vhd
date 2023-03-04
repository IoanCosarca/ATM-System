library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity COMP2 is
	port(A,B,C: in std_logic_vector(15 downto 0);
	ok: out std_logic);
end COMP2;

architecture COMP2 of COMP2 is
begin 
	process(A,B,C)
	begin 
		if (A<=B and A<=C and A<="0000001111101000")  then 
			ok<='1';
		else ok<='0';
		end if;
	end process;
end COMP2;