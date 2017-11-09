
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity control is
port(
opcode: in std_logic_vector(5 downto 0);
func:in std_logic_vector(5 downto 0);
regWr,regDst,jump,branch,ALUctr,extSig,ALUsrc,memWr,memToReg: out std_logic
);
end entity control;

architecture beh of control is
signal ;
begin
--regDst



end beh;