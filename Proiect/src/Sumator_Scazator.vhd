library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Sumator_Scazator is
   port(OP: in std_logic;
   A, B: in std_logic_vector(15 downto 0);
   R: out std_logic_vector(15 downto 0));
end Sumator_Scazator;
 
architecture bhv of Sumator_Scazator is
component Full_Adder is
	port(X, Y, Cin: in std_logic;
	sum, Cout: out std_logic);
end component;
signal C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16: std_logic;
signal TMP: std_logic_vector(15 downto 0);
begin
	TMP(0)<= OP xor B(0);
	TMP(1)<= OP xor B(1);
	TMP(2)<= OP xor B(2);
	TMP(3)<= OP xor B(3);
	TMP(4)<= OP xor B(4);
	TMP(5)<= OP xor B(5);
	TMP(6)<= OP xor B(6);
	TMP(7)<= OP xor B(7);
	TMP(8)<= OP xor B(8);
	TMP(9)<= OP xor B(9);
	TMP(10)<= OP xor B(10);
	TMP(11)<= OP xor B(11);
	TMP(12)<= OP xor B(12);
	TMP(13)<= OP xor B(13);
	TMP(14)<= OP xor B(14);
	TMP(15)<= OP xor B(15);
	FA0:Full_Adder port map(A(0),TMP(0),OP, R(0),C1);
	FA1:Full_Adder port map(A(1),TMP(1),C1, R(1),C2);
	FA2:Full_Adder port map(A(2),TMP(2),C2, R(2),C3);
	FA3:Full_Adder port map(A(3),TMP(3),C3, R(3),C4);
	FA4:Full_Adder port map(A(4),TMP(4),C4, R(4),C5);
	FA5:Full_Adder port map(A(5),TMP(5),C5, R(5),C6);
	FA6:Full_Adder port map(A(6),TMP(6),C6, R(6),C7);
	FA7:Full_Adder port map(A(7),TMP(7),C7, R(7),C8);
	FA8:Full_Adder port map(A(8),TMP(8),C8, R(8),C9);
	FA9:Full_Adder port map(A(9),TMP(9),C9, R(9),C10);
	FA10:Full_Adder port map(A(10),TMP(10),C10, R(10),C11);
	FA11:Full_Adder port map(A(11),TMP(11),C11, R(11),C12);
	FA12:Full_Adder port map(A(12),TMP(12),C12, R(12),C13);
	FA13:Full_Adder port map(A(13),TMP(13),C13, R(13),C14);
	FA14:Full_Adder port map(A(14),TMP(14),C14, R(14),C15);
	FA15:Full_Adder port map(A(15),TMP(15),C15, R(15),C16);
end bhv;