
library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity control is
port(
opcode: in std_logic_vector(5 downto 0);
func:in std_logic_vector(5 downto 0);
regWr,regDst,jump,branch,extOp,ALUsrc,memWr,memToReg: out std_logic;
ALUctr:out  std_logic_vector(4 downto 0);
eq: out std_logic;
shamt_imm: out std_logic
);
end entity control;

architecture beh of control is
signal addif,addf,adduf,subf,subuf,sltf,sltuf,beqf,bnef,lwf,swf,andf,orf,bgtzf,sllf: std_logic;

--signals for not op and not func
signal not_opcode, not_func: std_logic_vector(5 downto 0);

--signal used
signal temp_add: std_logic_vector(1 downto 0);
signal temp_addu: std_logic_vector(1 downto 0);
signal temp_sub: std_logic_vector(1 downto 0);
signal temp_subu: std_logic_vector(1 downto 0);
signal temp_slt: std_logic_vector(1 downto 0);
signal temp_sltu: std_logic_vector(1 downto 0);
signal temp_and: std_logic_vector(1 downto 0);
signal temp_or: std_logic_vector(1 downto 0);
signal temp_bgtz: std_logic_vector(1 downto 0);
signal temp_sll: std_logic_vector(1 downto 0);

--signals used in summary of control signals
signal temp_regDst, temp_regWr:std_logic_vector(1 downto 0);

begin
--now we need to create flags for every instruction
invert_opcode: not_6 port map(opcode(5 downto 0), not_opcode(5 downto 0));
invert_func: not_6 port map(func(5 downto 0), not_func(5 downto 0));

--for addi
addi0: and_6 port map(not_opcode(5), not_opcode(4), opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), addif);
--for add
add0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_add(1));
add1: and_6 port map(func(5), not_func(4), not_func(3), not_func(2), not_func(1), not_func(0), temp_add(0));
add2: and_gate port map(temp_add(1), temp_add(0), addf);
--for addu
addu0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_addu(1));
addu1: and_6 port map(func(5), not_func(4), not_func(3), not_func(2), not_func(1), func(0), temp_addu(0));
addu2: and_gate port map(temp_addu(1), temp_addu(0), adduf);
--for sub
sub0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_sub(1));
sub1: and_6 port map(func(5), not_func(4), not_func(3), not_func(2), func(1), not_func(0), temp_sub(0));
sub2: and_gate port map(temp_sub(1), temp_sub(0), subf);
--for subu
subu0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_subu(1));
subu1: and_6 port map(func(5), not_func(4), not_func(3), not_func(2), func(1), func(0), temp_subu(0));
subu2: and_gate port map(temp_subu(1), temp_subu(0), subuf);
--for slt
slt0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_slt(1));
slt1: and_6 port map(func(5), not_func(4), func(3), not_func(2), func(1), not_func(0), temp_slt(0));
slt2: and_gate port map(temp_slt(1), temp_slt(0), sltf);
--for sltu
sltu0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_sltu(1));
sltu1: and_6 port map(func(5), not_func(4), func(3), not_func(2), func(1), func(0), temp_sltu(0));
sltu2: and_gate port map(temp_sltu(1), temp_sltu(0), sltuf);
--for beq
beq0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), opcode(2), not_opcode(1), not_opcode(0),beqf);
--for bne
bne0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), opcode(2), not_opcode(1), opcode(0),bnef);
--for lw
lw0: and_6 port map(opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), opcode(1), opcode(0),lwf);
--for sw
sw0: and_6 port map(opcode(5), not_opcode(4), opcode(3), not_opcode(2), opcode(1), opcode(0),swf);
--for and
and0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_and(1));
and1: and_6 port map(func(5), not_func(4), not_func(3), func(2), not_func(1), not_func(0), temp_and(0));
and2: and_gate port map(temp_and(1), temp_and(0), andf);
--for or
or0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_or(1));
or1: and_6 port map(func(5), not_func(4), not_func(3), func(2), not_func(1), func(0), temp_or(0));
or2: and_gate port map(temp_or(1), temp_or(0), orf);
--for sll
sll0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), not_opcode(2), not_opcode(1), not_opcode(0), temp_sll(1));
sll1: and_6 port map(not_func(5), not_func(4), not_func(3), not_func(2), not_func(1), not_func(0), temp_sll(0));
sll2: and_gate port map(temp_sll(1), temp_sll(0), sllf);
--for bgtz
bgtz0: and_6 port map(not_opcode(5), not_opcode(4), not_opcode(3), opcode(2), opcode(1), opcode(0), bgtzf);

--for regDst
regDst0: or_6 port map(addf, adduf, subf, subuf, sltf, sltuf, temp_regDst(1));
regDst1: or_6 port map(andf, orf, sllf,'0', '0', '0', temp_regDst(0));
regDst2: or_gate port map(temp_regDst(0), temp_regDst(1), regDst);
--for regWr
regWr0: or_6 port map(addf, adduf, subf, subuf, sltf, sltuf, temp_regWr(1));
regWr1: or_6 port map(andf, orf, sllf, addif, lwf, '0', temp_regWr(0));
regWr2: or_gate port map(temp_regWr(0), temp_regWr(1), regWr);
--for branch
branch0: or_6 port map(beqf, bnef, bgtzf,'0','0','0', branch);
--for extOp
extOp0: or_6 port map(lwf,swf,addif,'0','0','0', extOp);
--for ALUsrc
ALUsrc0: or_6 port map(lwf, swf, addif,sllf,'0','0', ALUsrc);
--for memWr & memToReg
memWr <= swf;
memToReg <= lwf;
--ALUctr
ALUctr0: or_6 port map(andf, sltf, sltuf,'0','0','0', ALUctr(0));
ALUctr1: or_gate port map(orf, sltuf, ALUctr(1));
ALUctr2: or_6 port map(subf, subuf,sltf, sltuf,beqf,bnef, ALUctr(2));
ALUctr3: ALUctr(3) <= sllf;
ALUctr4: ALUctr(4) <= bgtzf;

--for eq
eq <= bnef;
shamt_imm <= sllf;
jump <= '0';
end beh;