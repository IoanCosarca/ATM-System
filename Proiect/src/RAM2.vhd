library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity RAM2 is
	port(A_RAM: in std_logic_vector (1 downto 0);
		CS_RAM: in std_logic;
		WE: in std_logic;
		I_RAM: in std_logic_vector(15 downto 0);
		D_RAM: out std_logic_vector(15 downto 0));
end RAM2;

architecture RAM2 of RAM2 is
type RAM_MEM is array (0 to 3) of std_logic_vector(15 downto 0);
signal RAM: RAM_MEM :=(0=>"0000001110000100",
					1=>"0000001111111111",
					2=>"0000001111101000",
					3=>"0000000111111111");
begin
	D_RAM<=RAM(conv_integer(A_RAM)) when CS_RAM='1';
	RAM(conv_integer(A_RAM))<=I_RAM when WE='1';
end RAM2;