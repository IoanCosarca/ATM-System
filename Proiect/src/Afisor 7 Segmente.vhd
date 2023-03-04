library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity bcd_7segmente is
	Port (BCDin: in STD_LOGIC_VECTOR (3 downto 0);
	Sapte_Segmente: out STD_LOGIC_VECTOR (6 downto 0));
end bcd_7segmente;
 
architecture Comportamentala of bcd_7segmente is
begin
	process(BCDin)
	begin
		case BCDin is
			when "0000" => Sapte_Segmente <= "0000001"; --0
			when "0001" => Sapte_Segmente <= "1001111"; --1
			when "0010" => Sapte_Segmente <= "0010010"; --2
			when "0011" => Sapte_Segmente <= "0000110"; --3
			when "0100" => Sapte_Segmente <= "1001100"; --4
			when "0101" => Sapte_Segmente <= "0100100"; --5
			when "0110" => Sapte_Segmente <= "0100000"; --6
			when "0111" => Sapte_Segmente <= "0001111"; --7
			when "1000" => Sapte_Segmente <= "0000000"; --8
			when "1001" => Sapte_Segmente <= "0000100"; --9
			when others => Sapte_Segmente <= "1111111"; --null
		end case;
	end process;
end Comportamentala;