library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
entity MUX is
	port(I0,I1,I2,I3: in std_logic_vector(15 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		Y: out std_logic_vector(15 downto 0));
end MUX;
architecture MUX of MUX is
begin 
	process(I0,I1,I2,I3,SEL)
		begin
			if SEL="00"
				then Y<=I0;
			elsif SEL="01"
				then Y<=I1;
			elsif SEL="10"
				then Y<=I2;
			elsif SEL="11"
				then Y<=I3;
			end if;
	end process;
end MUX;