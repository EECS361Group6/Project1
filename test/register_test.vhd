library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;


entity register_file_test is 
end register_file_test;

architecture beh of register_file_test is
signal outAt, outBt, inputt: std_logic_vector(31 downto 0);
signal writeRegSelt, regASelt, regBSelt: std_logic_vector(4 downto 0);
signal writeEnablet, clockt: std_logic;
begin
	test_comp: register_file
	port map (
	  outA => outAt,
	  outB => outBt,
	  input =>inputt,
	  writeRegSel =>writeRegSelt,
	  regASel => regASelt,
	  regBSel => regBSelt,
	  clock => clockt,
	  writeEnable => writeEnablet
	);

generateclock: process
begin
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;
	clockt <= '0';
	wait for 5 ns;
	clockt <= '1';
	wait for 5 ns;

wait;
end process;

  testbench : process
  begin
	writeEnablet <='1';
	writeRegSelt <= "00001";
	inputt <= "00001111000011110000111100001111";
	wait for 20 ns;

	writeEnablet <='1';
	writeRegSelt <= "10000";
	inputt <= "11110000111100001111000011110000";
	wait for 20 ns;
	
	writeEnablet <= '0';
	regASelt <= "00001";
	regBSelt <= "10000";
	wait for 10 ns;
	
	wait;
  end process;
	
end beh;
