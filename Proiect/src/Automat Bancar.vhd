library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Bancomat is
	port(CONTINUA: in std_logic;
	IDCard: in std_logic_vector(1 downto 0);
	PIN0, PIN1, PIN2, PIN3: in std_logic;
	PINN0, PINN1, PINN2, PINN3: in std_logic;
	Sel: in std_logic_vector (1 downto 0);
	ValidPIN: in std_logic;
	Sum0, Sum1, Sum2, Sum3:	in std_logic;
	ChitantaIN: in std_logic;
	Sapte_Segmente1: out std_logic_vector (6 downto 0);	
	Sapte_Segmente2: out std_logic_vector (6 downto 0);
	Sapte_Segmente3: out std_logic_vector (6 downto 0);
	Sapte_Segmente4: out std_logic_vector (6 downto 0);
	ChitantaOUT: out std_logic;
	CardOUT: out std_logic);
end Bancomat;

architecture Bhv of Bancomat is

component Citire is
	port(Clk1, Clk2, Clk3, Clk4: in std_logic;
	Nr: out std_logic_vector(15 downto 0));
end component;

component convertor is
	port(c4,c3,c2,c1: in std_logic_vector (3 downto 0);
	bin	: out std_logic_vector(15 downto 0));
end component;

component Convertor2 is
	port(Bin: in std_logic_vector (15 downto 0);
	c4,c3,c2,c1: out std_logic_vector (3 downto 0)
	);
end component;

component RAM1 is
	port(A_RAM: in std_logic_vector (1 downto 0);
		CS_RAM: in std_logic;
		WE: in std_logic;
		I_RAM: in std_logic_vector(15 downto 0);
		D_RAM: out std_logic_vector(15 downto 0));
end component;

component COMP is
	port(A,B: in std_logic_vector(15 downto 0);
	egal: out std_logic);
end component;

component RAM2 is
	port(A_RAM: in std_logic_vector (1 downto 0);
		CS_RAM: in std_logic;
		WE: in std_logic;
		I_RAM: in std_logic_vector(15 downto 0);
		D_RAM: out std_logic_vector(15 downto 0));
end component;

component bcd_7segmente is
	Port (BCDin: in STD_LOGIC_VECTOR (3 downto 0);
	Sapte_Segmente: out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Sumator_Scazator is
   port(OP: in std_logic;
   A, B: in std_logic_vector(15 downto 0);
   R: out std_logic_vector(15 downto 0));
end component;

component MUX is
	port(I0,I1,I2,I3: in std_logic_vector(15 downto 0);
		SEL: in std_logic_vector(1 downto 0);
		Y: out std_logic_vector(15 downto 0));
end component;

component COMP2 is
	port(A,B,C: in std_logic_vector(15 downto 0);
	ok: out std_logic);
end component;

--Stari
type stari is (st1, st2, st3, st4, st5, st6, st7, st8, st9, st10, st11, st12, st13, st14, st15, st16, st17, st18, st19, st20, st21);
signal cur, urm: stari;
--Suma bancomat
signal suma_bancomat: std_logic_vector (15 downto 0):="0000001111101000";
-- semanle
signal ok_pin, read1, write1, read2, write2: std_logic:='0';
signal nr, nr_afisare, PIN, PIN_RAM1, PIN_nou, D_RAM1, D_RAM2: std_logic_vector (15 downto 0);
signal c4, c3, c2, c1, af4, af3, af2, af1: std_logic_vector (3 downto 0);
signal suma_RAM2, suma, suma_bin: std_logic_vector (15 downto 0);
signal ok_extragere, op: std_logic;
signal rez1,rez2: std_logic_vector (15 downto 0);
begin
	organigram: process(cur)
	begin
		case cur is
		when st1 => urm <= st2;
					
		when st2 => urm <= st3;
					read1 <= '1';
					write1<= '0';
					
		when st3 => urm <= st4;
					 PIN_RAM1 <= D_RAM1;
					
		when st4 => if (ok_pin='1') then
						urm <= st5;	
					else urm <= st2;
					end if;
					
		when st5 => urm <= st6;
		
		when st6 =>	if (Sel = "00") then
						urm <= st7;
						read2 <= '1';
						write2 <='0';
					elsif (Sel = "01") then
						urm <= st10;
					elsif (Sel = "10") then
						urm <= st13;
						write2 <='0';
						read2 <= '1';
					else urm <=	st17;
						write2 <='0';
						read2 <= '1';
					end if;	
					
		when st7 => urm <= st8;
				suma_RAM2 <= D_RAM2;
		
		when st8 => urm <= st9;
		nr(3 downto 0) <= c1;
		nr(7 downto 4) <= c2;
		nr(11 downto 8) <= c3;
		nr(15 downto 12) <= c4;
		
		when st9 => urm <= st21;	 
			af4<= nr_afisare(15 downto 12) ;
			af3<= nr_afisare(11 downto 8);
			af2<= nr_afisare(7 downto 4); 
			af1<= nr_afisare(3 downto 0); 
			
		when st10 => urm <= st11;
		
		when st11 => if(ValidPIN= '1') then 
						urm <= st12;
					else urm <= st5;
					end if;
					
		when st12 => write1 <= '1';
					read1 <= '0';
					urm <= st9;
		
		when st13 => suma_RAM2 <= D_RAM2;
						urm <= st14;
		
		when st14 => urm <= st15;
					read2<='1';
					write2<='0';
								
		when st15 => if(ok_extragere='1') then
						urm <= st16;
						op <= '1';
					else urm <= st13;
					end if;
					
		when st16 => urm <= st19;
					suma_bancomat <= rez1;
					write2 <= '1';
					read2 <= '0';
					suma_RAM2 <= rez2;
					
		when st17 => suma_RAM2 <= D_RAM2;
					urm <= st18;
		
		when st18 => urm <= st16;
					op <='0'; 
		
		when st19 => urm <= st20;
		
		when st20 => urm <= st9;
					if(ChitantaIN='1') then 
						ChitantaOUT <= '1', '0' after 20 ns; 
					else ChitantaOUT <= '0';
					end if;
		when st21 => urm <= st1;
			CardOUT <= '1', '0' after 20 ns;
		when others => urm <= st1;
		end case;
		
	end process	organigram;
	
	process (CONTINUA)
		begin
			if (CONTINUA'event and CONTINUA='1') then
				cur <= urm;
			end if;
	end process;
	
citire_PIN: Citire port map(PIN0, PIN1, PIN2, PIN3, PIN);
RAM01: RAM1 port map(IDCard, read1, write1, PIN_nou, D_RAM1);
compareare_PIN: COMP port map(PIN, PIN_RAM1, ok_pin);
RAM02: RAM2 port map(IDCard, read2, write2, rez2, D_RAM2);	
Convertor_in_BCD: convertor2 port map(suma_RAM2, c4, c3, c2, c1);
Alegere_Afisor: MUX port map (nr, PIN_nou, suma, suma, sel, nr_afisare);
Afisor4: bcd_7segmente port map(af4, Sapte_Segmente4);
Afisor3: bcd_7segmente port map(af3, Sapte_Segmente3);
Afisor2: bcd_7segmente port map(af2, Sapte_Segmente2);
Afisor1: bcd_7segmente port map(af1, Sapte_Segmente1);
citire_PIN_nou: Citire port map(PINN0, PINN1, PINN2, PINN3, PIN_nou);
citire_suma: Citire port map( Sum0, Sum1, Sum2, Sum3, suma);
convertorSuma_binar: convertor port map(suma(15 downto 12),suma(11 downto 8), suma(7 downto 4), suma(3 downto 0), suma_bin);
comparare_suma1: COMP2 port map(suma_bin, suma_bancomat, suma_RAM2, ok_extragere);
actualizare_suma_bancomat: Sumator_Scazator port map(op, suma_bancomat, suma_bin, rez1);
actualizare_suma_cont: Sumator_Scazator port map(op, suma_RAM2, suma_bin, rez2);
end Bhv;