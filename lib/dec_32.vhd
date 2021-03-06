
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity dec_32 is
  port (
    src	: in std_logic_vector(4 downto 0);
    z	: out std_logic_vector(31 downto 0)
  );
end dec_32;

architecture struct of dec_32 is

begin
  dec : dec_n
    generic map (n => 5)
    port map (src,z);

end struct;