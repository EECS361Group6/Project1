
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity not_6 is
port (
	input:in std_logic_vector(5 downto 0);
	output:out std_logic_vector(5 downto 0)
);
end entity not_6;

architecture beh of not_6 is
signal temp: std_logic_vector(5 downto 0);
begin
not0:not_3 port map(input(5 downto 3), temp(5 downto 3));
not1:not_3 port map(input(2 downto 0), temp(2 downto 0));
not2:output <= temp;
end beh;