library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity zhuanma is 
	port	(
		x:in std_logic_vector(31 downto 0);
		z:out std_logic_vector(31 downto 0)
	);
end entity zhuanma;


architecture beh of zhuanma is
	signal temp:std_logic_vector(37 downto 0);
	signal temp1:std_logic_vector(31 downto 0);
begin
qufan0: not_gate port map(x => x(0), z => temp(0));
qufan1: not_gate port map(x => x(1), z => temp(1));
qufan2: not_gate port map(x => x(2), z => temp(2));
qufan3: not_gate port map(x => x(3), z => temp(3));
qufan4: not_gate port map(x => x(4), z => temp(4));
qufan5: not_gate port map(x => x(5), z => temp(5));
qufan6: not_gate port map(x => x(6), z => temp(6));
qufan7: not_gate port map(x => x(7), z => temp(7));
qufan8: not_gate port map(x => x(8), z => temp(8));
qufan9: not_gate port map(x => x(9), z => temp(9));
qufan10: not_gate port map(x => x(10), z => temp(10));
qufan11: not_gate port map(x => x(11), z => temp(11));
qufan12: not_gate port map(x => x(12), z => temp(12));
qufan13: not_gate port map(x => x(13), z => temp(13));
qufan14: not_gate port map(x => x(14), z => temp(14));
qufan15: not_gate port map(x => x(15), z => temp(15));
qufan16: not_gate port map(x => x(16), z => temp(16));
qufan17: not_gate port map(x => x(17), z => temp(17));
qufan18: not_gate port map(x => x(18), z => temp(18));
qufan19: not_gate port map(x => x(19), z => temp(19));
qufan20: not_gate port map(x => x(20), z => temp(20));
qufan21: not_gate port map(x => x(21), z => temp(21));
qufan22: not_gate port map(x => x(22), z => temp(22));
qufan23: not_gate port map(x => x(23), z => temp(23));
qufan24: not_gate port map(x => x(24), z => temp(24));
qufan25: not_gate port map(x => x(25), z => temp(25));
qufan26: not_gate port map(x => x(26), z => temp(26));
qufan27: not_gate port map(x => x(27), z => temp(27));
qufan28: not_gate port map(x => x(28), z => temp(28));
qufan29: not_gate port map(x => x(29), z => temp(29));
qufan30: not_gate port map(x => x(30), z => temp(30));
qufan31: not_gate port map(x => x(31), z => temp(31));

jiayi: complete_adder port map(a => temp(31 downto 0), b => "00000000000000000000000000000001", ci => '0', co => temp(32), ov => temp(33), zero => temp(34), s => temp1 );
result: z <= temp1;
end architecture beh;
