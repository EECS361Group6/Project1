
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity or_6 is
port (
	in0:in std_logic;
	in1:in std_logic;
	in2:in std_logic;
	in3:in std_logic;
	in4:in std_logic;
	in5:in std_logic;
	output:out std_logic
);
end entity or_6;

architecture beh of or_6 is 
signal temp0,temp1,temp2,temp3: std_logic;
begin
or0: or_gate port map( in0, in1, temp0);
or1: or_gate port map( in2, in3, temp1);
or2: or_gate port map( in4, in5, temp2);
or3: or_gate port map(temp0, temp1, temp3);
or4: or_gate port map(temp2, temp3, output);
end beh;
