library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity RAM1 is
	port(A_RAM: in std_logic_vector (1 downto 0);
		CS_RAM: in std_logic;
		WE: in std_logic;
		I_RAM: in std_logic_vector(15 downto 0);
		D_RAM: out std_logic_vector(15 downto 0));
end RAM1;

architecture RAM1 of RAM1 is
type RAM_MEM is array (0 to 3) of std_logic_vector(15 downto 0);
signal RAM: RAM_MEM :=(0=>"1000000000000000",
					1=>"1100000000000000",
					2=>"1110000000000000",
					3=>"1111000000000000");
begin 	 
	 D_RAM<=RAM(conv_integer(A_RAM)) when CS_RAM='1';
	 RAM(conv_integer(A_RAM))<=I_RAM when WE='1';
end RAM1;