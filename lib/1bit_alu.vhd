

library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity single_alu is 
	port(
		a,b,ci:in std_logic;
		op:in std_logic_vector(1 downto 0);
		co,s:out std_logic
);
end entity single_alu;

architecture beh of single_alu is
signal or_result, and_result, add_result, xor_result: std_logic;
begin
	add1:full_adder port map(a => a, b => b, ci => ci, co => co, s => add_result);
	and1: and_gate port map(x => a, y => b ,z => and_result);
	or1: or_gate port map(x => a, y => b ,z => or_result);
	xor1: xor_gate port map(x => a, y => b ,z => xor_result);
	mux_part: mux_4to1 port map(a0 => add_result, a1 => and_result, a2 => or_result, a3 => xor_result, op => op, result => s);

	
end beh;
