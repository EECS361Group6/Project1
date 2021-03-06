library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity alu is 
	port	(
		op:in std_logic_vector(4 downto 0);
		a,b:in std_logic_vector(31 downto 0);
		co,zero,ov:out std_logic;
		s: out std_logic_vector(31 downto 0)
	);
end entity alu;


architecture beh of alu is
	signal temp_co,temp_zero,final:std_logic_vector(31 downto 0);
	signal temp_op:std_logic_vector(1 downto 0);
	signal temp_sub:std_logic_vector(31 downto 0);
	signal candidate00,candidate01,candidate010,candidate011,candidate10,candidate11,candidate0, candidate1: std_logic_vector(31 downto 0);
	signal co0,co1,candi11,candi111,candi110:std_logic;
	signal nouse:std_logic_vector(15 downto 0);
	signal temp_bgtz, zero_candi0, zero_candi1:std_logic;
	signal pre_bgtz: std_logic_vector(31 downto 0);
begin
temp_op <= op(3 downto 2);

---bitslice
opkind1_0: single_alu port map(a => a(0), b => b(0), op => op(1 downto 0), ci => '0',co => temp_co(0), s => candidate00(0));
opkind1_1: single_alu port map(a => a(1), b => b(1), op => op(1 downto 0), ci => temp_co(0),co => temp_co(1), s => candidate00(1));
opkind1_2: single_alu port map(a => a(2), b => b(2), op => op(1 downto 0), ci => temp_co(1),co => temp_co(2), s => candidate00(2));
opkind1_3: single_alu port map(a => a(3), b => b(3), op => op(1 downto 0), ci => temp_co(2),co => temp_co(3), s => candidate00(3));
opkind1_4: single_alu port map(a => a(4), b => b(4), op => op(1 downto 0), ci => temp_co(3),co => temp_co(4), s => candidate00(4));
opkind1_5: single_alu port map(a => a(5), b => b(5), op => op(1 downto 0), ci => temp_co(4),co => temp_co(5), s => candidate00(5));
opkind1_6: single_alu port map(a => a(6), b => b(6), op => op(1 downto 0), ci => temp_co(5),co => temp_co(6), s => candidate00(6));
opkind1_7: single_alu port map(a => a(7), b => b(7), op => op(1 downto 0), ci => temp_co(6),co => temp_co(7), s => candidate00(7));
opkind1_8: single_alu port map(a => a(8), b => b(8), op => op(1 downto 0), ci => temp_co(7),co => temp_co(8), s => candidate00(8));
opkind1_9: single_alu port map(a => a(9), b => b(9), op => op(1 downto 0), ci => temp_co(8),co => temp_co(9), s => candidate00(9));
opkind1_10: single_alu port map(a => a(10), b => b(10), op => op(1 downto 0), ci => temp_co(9),co => temp_co(10), s => candidate00(10));
opkind1_11: single_alu port map(a => a(11), b => b(11), op => op(1 downto 0), ci => temp_co(10),co => temp_co(11), s => candidate00(11));
opkind1_12: single_alu port map(a => a(12), b => b(12), op => op(1 downto 0), ci => temp_co(11),co => temp_co(12), s => candidate00(12));
opkind1_13: single_alu port map(a => a(13), b => b(13), op => op(1 downto 0), ci => temp_co(12),co => temp_co(13), s => candidate00(13));
opkind1_14: single_alu port map(a => a(14), b => b(14), op => op(1 downto 0), ci => temp_co(13),co => temp_co(14), s => candidate00(14));
opkind1_15: single_alu port map(a => a(15), b => b(15), op => op(1 downto 0), ci => temp_co(14),co => temp_co(15), s => candidate00(15));
opkind1_16: single_alu port map(a => a(16), b => b(16), op => op(1 downto 0), ci => temp_co(15),co => temp_co(16), s => candidate00(16));
opkind1_17: single_alu port map(a => a(17), b => b(17), op => op(1 downto 0), ci => temp_co(16),co => temp_co(17), s => candidate00(17));
opkind1_18: single_alu port map(a => a(18), b => b(18), op => op(1 downto 0), ci => temp_co(17),co => temp_co(18), s => candidate00(18));
opkind1_19: single_alu port map(a => a(19), b => b(19), op => op(1 downto 0), ci => temp_co(18),co => temp_co(19), s => candidate00(19));
opkind1_20: single_alu port map(a => a(20), b => b(20), op => op(1 downto 0), ci => temp_co(19),co => temp_co(20), s => candidate00(20));
opkind1_21: single_alu port map(a => a(21), b => b(21), op => op(1 downto 0), ci => temp_co(20),co => temp_co(21), s => candidate00(21));
opkind1_22: single_alu port map(a => a(22), b => b(22), op => op(1 downto 0), ci => temp_co(21),co => temp_co(22), s => candidate00(22));
opkind1_23: single_alu port map(a => a(23), b => b(23), op => op(1 downto 0), ci => temp_co(22),co => temp_co(23), s => candidate00(23));
opkind1_24: single_alu port map(a => a(24), b => b(24), op => op(1 downto 0), ci => temp_co(23),co => temp_co(24), s => candidate00(24));
opkind1_25: single_alu port map(a => a(25), b => b(25), op => op(1 downto 0), ci => temp_co(24),co => temp_co(25), s => candidate00(25));
opkind1_26: single_alu port map(a => a(26), b => b(26), op => op(1 downto 0), ci => temp_co(25),co => temp_co(26), s => candidate00(26));
opkind1_27: single_alu port map(a => a(27), b => b(27), op => op(1 downto 0), ci => temp_co(26),co => temp_co(27), s => candidate00(27));
opkind1_28: single_alu port map(a => a(28), b => b(28), op => op(1 downto 0), ci => temp_co(27),co => temp_co(28), s => candidate00(28));
opkind1_29: single_alu port map(a => a(29), b => b(29), op => op(1 downto 0), ci => temp_co(28),co => temp_co(29), s => candidate00(29));
opkind1_30: single_alu port map(a => a(30), b => b(30), op => op(1 downto 0), ci => temp_co(29),co => temp_co(30), s => candidate00(30));
opkind1_31: single_alu port map(a => a(31), b => b(31), op => op(1 downto 0), ci => temp_co(30),co => temp_co(31), s => candidate00(31));
co0 <= temp_co(31);

---overflow decision--------------------
overflow: xor_gate port map( x => temp_co(30), y => temp_co(31), z => ov);


---shifter
leftpart: left_shifter port map(a => a, s => b(4 downto 0), result => candidate010);
rightpart:right_shifter port map(a => a, s => b(4 downto 0), result => candidate011);
chooseshifter: mux_32 port map(src0 => candidate010,src1 => candidate011,sel => op(0),z => candidate01);

---choose above------------------------------------------------------
bitslice_or_shift: mux_32 port map(src0 => candidate00, src1 => candidate01, sel => op(3), z => candidate0);

---subtract
zhuanma1: zhuanma port map(x => b, z => temp_sub);
subtract: complete_adder port map( a => a, b => temp_sub, ci => '0', co => co1, ov => nouse(0),zero =>nouse(1), s => candidate10);

---smaller than
sltop: slt port map (a => a, b => b, result => candi110);
sltuop:sltu port map (a => a, b => b, result => candi111);
chooseu: mux port map (src0 => candi110,src1 => candi111, sel => op(1), z => candi11);
candidate11(0) <= candi11;
candidate11(31 downto 1) <= "0000000000000000000000000000000";


---choose above------------------------------------------------------
choosecandi1 : mux_32 port map(src0 => candidate10, src1 => candidate11, sel => op(0), z => candidate1);

---final secision-------------------------------------------------------
chooses: mux_32 port map(src0 => candidate0, src1 => candidate1, sel => op(2) , z => final);
s <= final;

---zero decision-----------------
zero0: or_gate port map (x => final(0), y => final(1), z => temp_zero(0));
zero1: or_gate port map (x => final(2), y => final(3), z => temp_zero(1));
zero2: or_gate port map (x => final(4), y => final(5), z => temp_zero(2));
zero3: or_gate port map (x => final(6), y => final(7), z => temp_zero(3));
zero4: or_gate port map (x => final(8), y => final(9), z => temp_zero(4));
zero5: or_gate port map (x => final(10), y => final(11), z => temp_zero(5));
zero6: or_gate port map (x => final(12), y => final(13), z => temp_zero(6));
zero7: or_gate port map (x => final(14), y => final(15), z => temp_zero(7));
zero8: or_gate port map (x => final(16), y => final(17), z => temp_zero(8));
zero9: or_gate port map (x => final(18), y => final(19), z => temp_zero(9));
zero10: or_gate port map (x => final(20), y => final(21), z => temp_zero(10));
zero11: or_gate port map (x => final(22), y => final(23), z => temp_zero(11));
zero12: or_gate port map (x => final(24), y => final(25), z => temp_zero(12));
zero13: or_gate port map (x => final(26), y => final(27), z => temp_zero(13));
zero14: or_gate port map (x => final(28), y => final(29), z => temp_zero(14));
zero15: or_gate port map (x => final(30), y => final(31), z => temp_zero(15));
zer0: or_gate port map (x => temp_zero(0), y => temp_zero(1), z => temp_zero(16));
zer1: or_gate port map (x => temp_zero(2), y => temp_zero(3), z => temp_zero(17));
zer2: or_gate port map (x => temp_zero(4), y => temp_zero(5), z => temp_zero(18));
zer3: or_gate port map (x => temp_zero(6), y => temp_zero(7), z => temp_zero(19));
zer4: or_gate port map (x => temp_zero(8), y => temp_zero(9), z => temp_zero(20));
zer5: or_gate port map (x => temp_zero(10), y => temp_zero(11), z => temp_zero(21));
zer6: or_gate port map (x => temp_zero(12), y => temp_zero(13), z => temp_zero(22));
zer7: or_gate port map (x => temp_zero(14), y => temp_zero(15), z => temp_zero(23));
ze0: or_gate port map(x => temp_zero(16), y => temp_zero(17), z => temp_zero(24));
ze1: or_gate port map(x => temp_zero(18), y => temp_zero(19), z => temp_zero(25));
ze2: or_gate port map(x => temp_zero(20), y => temp_zero(21), z => temp_zero(26));
ze3: or_gate port map(x => temp_zero(22), y => temp_zero(23), z => temp_zero(27));
z0: or_gate port map(x => temp_zero(24), y => temp_zero(25), z => temp_zero(28));
z1: or_gate port map(x => temp_zero(26), y => temp_zero(27), z => temp_zero(29));
zz0: or_gate port map(x => temp_zero(28), y => temp_zero(29), z => temp_zero(30));
zz1: not_gate port map(x => temp_zero(30), z => zero_candi0);
---co decision
codecision: mux port map(src0 => co0, src1 => co1, sel => op(2), z => co);

--bgtz
pre_bgtz0: complete_adder port map(a=> a, b => x"ffffffff",ci => '0', s => pre_bgtz);
bgtz0: not_gate port map(pre_bgtz(31), temp_bgtz);
bgtz1: and_gate port map(temp_bgtz, op(4), zero_candi1);
bgtz2: mux port map(src0 => zero_candi0, src1 => zero_candi1, sel => op(4), z => zero);


end architecture beh;