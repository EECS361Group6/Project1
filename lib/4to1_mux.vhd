library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity mux_4to1 is
	port(
		op:in std_logic_vector(1 downto 0);
		a0,a1,a2,a3:in std_logic;
		result:out std_logic
);
end entity mux_4to1;

architecture beh of mux_4to1 is
signal t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13: std_logic;

begin
step0: not_gate port map(x => op(1), z => t0);
step1: not_gate port map(x => op(0), z => t1);
step2: and_gate port map(x => t0, y => t1, z => t2);

step3: not_gate port map(x => op(1), z => t3);
step4: and_gate port map(x => t3, y => op(0), z => t4);

step5: not_gate port map(x => op(0), z => t5);
step6: and_gate port map(x => op(1), y => t5, z => t6);

step7: and_gate port map(x => op(1), y => op(0), z => t7);

step00: and_gate port map(x => t2, y => a0 ,z => t8);
step11: and_gate port map(x => t4, y => a1, z => t9);
step22: and_gate port map(x => t6, y => a2, z => t10);
step33: and_gate port map(x => t7, y => a3, z => t11);

step000: or_gate port map(x => t8, y => t9, z => t12);
step111: or_gate port map(x => t10, y => t11, z => t13);

final: or_gate port map(x => t12, y => t13, z => result);


end beh;
