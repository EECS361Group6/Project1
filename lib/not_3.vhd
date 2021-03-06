
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity not_3 is
port (
	input:in std_logic_vector(2 downto 0);
	output:out std_logic_vector(2 downto 0)
);
end entity not_3;

architecture beh of not_3 is 
signal temp: std_logic_vector(2 downto 0);
begin
not0: not_gate port map( input(0), temp(0));
not1: not_gate port map( input(1), temp(1));
not2: not_gate port map( input(2), temp(2));
output <= temp;

end beh;