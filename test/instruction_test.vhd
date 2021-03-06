-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity instruction_test is
end instruction_test;

architecture behavioral of instruction_test is
signal zero, clk, jump, branch, reset : std_logic;
signal ins: std_logic_vector(31 downto 0);
begin
	test_comp : Instruction
    port map (
     	zero => zero,
		clk  => clk,
		jump => jump,
		branch => branch,
		reset => reset,
		instruction => ins
    );
    testbench : process
    begin
		wait for 5 ns;
    	clk <= '1';
    	jump <= '0';
    	zero <= '0';
    	branch <= '0';
    	reset <='1';
    	wait for 5 ns;
    	clk <='0';
    	wait for 5 ns;
    	clk <='1';
    	wait for 5 ns;
    	clk <='0';
    	reset <='0';
		wait for 5 ns;
    	clk <='1';
    	wait for 5 ns;
    	clk <='0';
    	wait for 5 ns;
    	clk <='1';
    	wait for 5 ns;
    	clk <='0';
    	wait for 5 ns;
    	wait;
    end process;
end behavioral;