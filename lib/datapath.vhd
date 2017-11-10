-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity data_path is
  port (
    clk	  : in std_logic;
	reset : in std_logic
  );
end data_path;

architecture structural of data_path is
signal zero, jump, branch, regDst, regWr, memWr, memToReg, ALUSrc, co, ov, extOp, extSig, eqzero, eq, not_memWr : std_logic;
signal ins, shamt, busA, busB, busC, memOut, extImm, busW, ALUResult : std_logic_vector(31 downto 0);
signal imm: std_logic_vector(15 downto 0);
signal regS, regT, regD, regW, ALUctr: std_logic_vector(4 downto 0);
signal opcode, func: std_logic_vector(5 downto 0);
begin
	ins1: Instruction port map(zero=>eqzero, clk=>clk, jump=>jump, branch=>branch, reset=>reset, instruction=>ins);
	dec: decode port map(ins=>ins, regS=>regS, regT=>regT, regD=>regD, imm=>imm, opcode=>opcode, func=>func, shamt=>shamt);
	reg: register_file port map(outA=>busA, outB=>busB, input=>busW, writeEnable=>regWr, regASel=>regS, regBSel=>regT, writeRegSel=>regW, clock=>clk);
	mu1: mux_n generic map(n=>5) port map(sel=>regDst, src0=>regT, src1=>regD, z=>regW);
	mu2: mux_32 port map(sel=>ALUSrc, src0=>busB, src1=>extImm, z=>busC);
	mu3: mux_32 port map(sel=>memToReg, src0=>ALUResult, src1=>memOut, z=>busW);
	and1: and_gate port map(x=>extOp, y=>imm(15), z=>extSig);
	extImm <= extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & extSig & imm(15 downto 0);
	Alu1: alu port map(a=>busA, b=>busC, op=>ALUctr, zero=>zero, co=>co, ov=>ov, s=>ALUResult);
	--DataMem:
	not1: not_gate port map(memWr, not_memWr);
	mem0: syncram generic map ("bills_branch.dat") port map (clk, '1', not_memWr, memWr, ALUResult, busB, memOut);
	crt: control port map(opcode=>opcode, func=>func, regWr=>regWr, regDst=>regDst, jump=>jump, branch=>branch, ALUctr=> ALUctr, extOp=>extOp, ALUsrc=>ALUsrc, memWr=>memWr, memToReg=>memToReg, eq => eq);
	eq_zero: xor_gate port map(eq, zero, eqzero);
end structural;