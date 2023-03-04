library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity COMP is
	port(A,B: in std_logic_vector(15 downto 0);
	egal: out std_logic);
end COMP;

architecture COMP of COMP is
begin 
	process(A,B)
	begin 
		if A>B then 
			egal<='0';
		elsif A<B then
			egal<='0';
		elsif A=B then
			egal<='1';
		end if;
	end process;
end COMP;