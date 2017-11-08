

library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity full_adder is 
	port	(
		a: in std_logic;
		b: in std_logic;
		ci: in std_logic;
		s:out std_logic;
		co:out std_logic
	);
end entity full_adder;


architecture behavioral of full_adder is
	signal temp1,temp2,temp3 : std_logic;
	begin
		x1:xor_gate port map(x => a, y =>b , z=>temp1);
		x2:xor_gate port map(x=>temp1, y=>ci,z=>s);
		a1:and_gate port map(x=>temp1, y=>ci, z=>temp2);
		a2:and_gate port map(x=>a, y=>b, z=>temp3);
		o1:or_gate port map(x => temp2, y=>temp3,z => co);

end architecture behavioral;