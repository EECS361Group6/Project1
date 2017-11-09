library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity sltu is 
	port	(
		a,b:in std_logic_vector(31 downto 0);
		result:out std_logic
	);
end entity sltu;


architecture beh of sltu is
	signal temp0:std_logic_vector(31 downto 0);
	signal temp1:std_logic_vector(31 downto 0);
	signal temp2:std_logic_vector(2 downto 0);
	signal candidate00,candidate01,candidate10,candidate11: std_logic;
	signal temp:std_logic_vector(1 downto 0);
begin
temp(0) <= b(31);
temp(1) <= a(31);

candidate01 <= '1';
candidate10 <= '0';

zhuanma1: zhuanma port map( x => b, z => temp0);
subtract: complete_adder port map(a => a, b => temp0, ci => '0', co => temp2(0), ov => temp2(1), zero => temp2(2), s => temp1 );

candidate11 <= temp1(31);
candidate00 <= temp1(31);
output: mux_4to1 port map (a0 => candidate00,a1 => candidate01,a2 => candidate10,a3 => candidate11,op => temp, result => result);
end architecture beh;
