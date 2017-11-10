-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity control_test is
end control_test;

architecture behavioral of control_test is
signal opcode, func : std_logic_vector(5 downto 0);
signal ALUctr: std_logic_vector(4 downto 0);
signal regWr,regDst,jump,branch,extOp,ALUsrc,memWr,memToReg, eq: std_logic;
begin
	con1: control
	port map(
		opcode => opcode,
		func => func,
		regWr => regWr,
		regDst => regDst,
		jump => jump,
		branch => branch,
		extOp => extOp,
		ALUsrc => ALUsrc,
		memWr => memWr,
		memToReg => memToReg,
		ALUctr => ALUctr,
		eq => eq
	);
	testbench: process
	begin
		wait for 5 ns;
		--add
		opcode <= "000000";
		func <= "100000";
		wait for 5 ns;
		--addu
		func <= "100001";
		wait for 5 ns;
		--sub
		func <= "100010";
		wait for 5 ns;
		--subu
		func <= "100011";
		wait for 5 ns;
		--slt
		func <= "101010";
		wait for 5 ns;
		--sltu
		func <= "101011";
		wait for 5 ns;
		--and
		func <= "100100";
		wait for 5 ns;
		--or
		func <= "100101";
		wait for 5 ns;
		--sll
		func <= "000000";
		wait for 5 ns;
		--addi
		opcode <= "000001";
		wait for 5 ns;
		--beq
		opcode <= "000100";
		wait for 5 ns;
		--bne
		opcode <= "000101";
		wait for 5 ns;
		--lw
		opcode <= "100011";
		wait for 5 ns;
		--sw
		opcode <= "101011";
		wait for 5 ns;
		--bgtz
		opcode <= "000111";
		wait for 5 ns;
		wait;
	end process;
end behavioral;