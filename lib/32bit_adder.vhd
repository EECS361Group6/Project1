
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity complete_adder is
	port(
	a,b: in std_logic_vector(31 downto 0);
	ci: in std_logic;
	co,ov,zero: out std_logic;
	s: out std_logic_vector(31 downto 0)
);
end entity complete_adder;

architecture beh of complete_adder is
signal ss: std_logic_vector(31 downto 0);
signal co_temp, ov_temp, zero_temp: std_logic_vector(7 downto 0);
signal zero_t: std_logic_vector(5 downto 0);

begin
fd0: quarbit_adder port map(a => a(3 downto 0), b => b(3 downto 0), s => ss(3 downto 0), ci => ci, co => co_temp(0), ov => ov_temp(0), zero => zero_temp(0));
fd1: quarbit_adder port map(a => a(7 downto 4), b => b(7 downto 4), s => ss(7 downto 4), ci => co_temp(0), co => co_temp(1), ov => ov_temp(1), zero => zero_temp(1));
fd2: quarbit_adder port map(a => a(11 downto 8), b => b(11 downto 8), s => ss(11 downto 8), ci => co_temp(1), co => co_temp(2), ov => ov_temp(2), zero => zero_temp(2));
fd3: quarbit_adder port map(a => a(15 downto 12), b => b(15 downto 12), s => ss(15 downto 12), ci => co_temp(2), co => co_temp(3), ov => ov_temp(3), zero => zero_temp(3));
fd4: quarbit_adder port map(a => a(19 downto 16), b => b(19 downto 16), s => ss(19 downto 16), ci => co_temp(3), co => co_temp(4), ov => ov_temp(4), zero => zero_temp(4));
fd5: quarbit_adder port map(a => a(23 downto 20), b => b(23 downto 20), s => ss(23 downto 20), ci => co_temp(4), co => co_temp(5), ov => ov_temp(5), zero => zero_temp(5));
fd6: quarbit_adder port map(a => a(27 downto 24), b => b(27 downto 24), s => ss(27 downto 24), ci => co_temp(5), co => co_temp(6), ov => ov_temp(6), zero => zero_temp(6));
fd7: quarbit_adder port map(a => a(31 downto 28), b => b(31 downto 28), s => ss(31 downto 28), ci => co_temp(6), co => co_temp(7), ov => ov_temp(7), zero => zero_temp(7));

zero1: and_gate port map(x => zero_temp(1), y => zero_temp(0), z => zero_t(0));
zero2: and_gate port map(x => zero_temp(3), y => zero_temp(2), z => zero_t(1));
zero3: and_gate port map(x => zero_temp(5), y => zero_temp(4), z => zero_t(2));
zero4: and_gate port map(x => zero_temp(7), y => zero_temp(6), z => zero_t(3));
zero5: and_gate port map(x => zero_t(1), y => zero_t(0), z => zero_t(4));
zero6: and_gate port map(x => zero_t(3), y => zero_t(2), z => zero_t(5));
zero7: and_gate port map(x => zero_temp(5), y => zero_t(4), z => zero);

ov <= ov_temp(7);
s <= ss;
co <= co_temp(7);

end beh;