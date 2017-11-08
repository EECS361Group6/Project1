library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity quarbit_adder is
	port(
		a,b: in std_logic_vector(3 downto 0);
		ci:in std_logic;
		s:out std_logic_vector(3 downto 0);
		co,ov,zero:out std_logic
);
end entity quarbit_adder;

architecture beh of quarbit_adder is
signal temp,ss:std_logic_vector (3 downto 0);
signal temp1,temp2:std_logic;
begin
fa0: full_adder port map(a => a(0),b => b(0),ci => ci,s => ss(0),co => temp(0));
fa1: full_adder port map(a => a(1),b => b(1),ci => temp(0),s => ss(1),co => temp(1));
fa2: full_adder port map(a => a(2),b => b(2),ci => temp(1),s => ss(2),co => temp(2));
fa3: full_adder port map(a => a(3),b => b(3),ci => temp(2),s => ss(3),co => temp(3));
zero1: or_gate port map(x => ss(0),y => ss(1),z => temp1);
zero2: or_gate port map(x => ss(2),y => ss(3),z => temp2);
zero3: nor_gate port map(x => temp1,y => temp2,z => zero);
overflow: xor_gate port map(x => temp(2),y => temp(3),z => ov);
co <= temp(3);
s <= ss;

end beh;