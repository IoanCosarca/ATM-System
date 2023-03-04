library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Citire is
	port(Clk1, Clk2, Clk3, Clk4: in std_logic;
	Nr:out std_logic_vector(15 downto 0));
end Citire;

architecture Comportamentala of Citire is
begin
	process(Clk1, Clk2, Clk3, Clk4)
	variable cif1: std_logic_vector(3 downto 0):="0000";
	variable cif2: std_logic_vector(3 downto 0):="0000";
	variable cif3: std_logic_vector(3 downto 0):="0000";
	variable cif4: std_logic_vector(3 downto 0):="0000";
	begin
		if(Clk1'EVENT and Clk1 = '1') then
			if (cif1="1001") then cif1 := "0000";
			else cif1 := cif1 + '1';
			end if;
		end if;
		
		if(Clk2'EVENT and Clk2 = '1') then
			if (cif2="1001") then cif2 := "0000";
			else cif2 := cif2 + '1';
			end if;
		end if;
		
		if(Clk3'EVENT and Clk3 = '1') then
			if (cif3="1001") then cif3 := "0000";
			else cif3 := cif3 + '1';
			end if;
		end if;
		
		if(Clk4'EVENT and Clk4 = '1') then
			if (cif4="1001") then cif4 := "0000";
			else cif4 := cif4 + '1';
			end if;
		end if;

	Nr(15 downto 12)<= cif4;
	Nr(11 downto 8)<= cif3;
	Nr(7 downto 4)<= cif2;
	Nr(3 downto 0)<= cif1;
	end process;
end Comportamentala;