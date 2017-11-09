
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity and_6 is
port (
	in0:in std_logic;
	in1:in std_logic;
	in2:in std_logic;
	in3:in std_logic;
	in4:in std_logic;
	in5:in std_logic;
	output:out std_logic
);
end entity and_6;

architecture beh of and_6 is 
signal temp0,temp1,temp2,temp3: std_logic;
begin
and0: and_gate port map( in0, in1, temp0);
and1: and_gate port map( in2, in3, temp1);
and2: and_gate port map( in4, in5, temp2);
and3: and_gate port map(temp0, temp1, temp3);
and4: and_gate port map(temp2, temp3, output);
end beh;