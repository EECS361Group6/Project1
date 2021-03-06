-- This package is used for EECS 361 from Northwestern University.
-- by Kaicheng Zhang (kaichengz@gmail.com)

library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

package eecs361 is

	component data_path is
  	port (
    	clk	  : in std_logic;
		reset : in std_logic
	);
	end component data_path;

  --decode
  component decode
	port(
		ins: in std_logic_vector(31 downto 0);
		regS: out std_logic_vector(4 downto 0);
		regT: out std_logic_vector(4 downto 0);
		regD: out std_logic_vector(4 downto 0);
		imm: out std_logic_vector(15 downto 0);
		opcode: out std_logic_vector(5 downto 0);
		func: out std_logic_vector(5 downto 0);
		shamt: out std_logic_vector(31 downto 0)	
	);
  end component decode;

  -- instruction
  component Instruction
	port(
		zero: in std_logic;
		clk : in std_logic;
		jump: in std_logic;
		branch: in std_logic;
		reset : in std_logic;
		instruction: out std_logic_vector(31 downto 0);
		pc0:out std_logic_vector(31 downto 0)		
	);
  end component Instruction;
  -- Complete_adder
  component complete_adder 
    port(
      a,b: in std_logic_vector(31 downto 0);
      ci: in std_logic;
      co,ov,zero: out std_logic;
      s: out std_logic_vector(31 downto 0)
    );
  end component complete_adder;

  -- Quarbit_adder
  component quarbit_adder
    port(
      a,b: in std_logic_vector(3 downto 0);
      ci:in std_logic;
      s:out std_logic_vector(3 downto 0);
      co,ov,zero:out std_logic
    );
  end component quarbit_adder;
  
  -- Full_Adder
  component full_adder
    port  (
      a: in std_logic;
      b: in std_logic;
      ci: in std_logic;
      s:out std_logic;
      co:out std_logic
    );
  end component full_adder;

  -- Decoders
  component dec_n
    generic (
      -- Widths of the inputs.
      n	  : integer
    );
    port (
      src   : in std_logic_vector(n-1 downto 0);
      z	    : out std_logic_vector((2**n)-1 downto 0)
    );
  end component dec_n;

  -- Multiplexors
  component mux
    port (
      sel   : in  std_logic;
      src0  : in  std_logic;
      src1  : in  std_logic;
      z     : out std_logic
    );
  end component mux;

  component mux_n
    generic (
      -- Widths of the inputs.
      n	  : integer
    );
    port (
      sel   : in  std_logic;
      src0  : in  std_logic_vector(n-1 downto 0);
      src1  : in  std_logic_vector(n-1 downto 0);
      z     : out std_logic_vector(n-1 downto 0)
    );
  end component mux_n;

  component mux_32
    port (
      sel   : in  std_logic;
      src0  : in  std_logic_vector(31 downto 0);
      src1  : in  std_logic_vector(31 downto 0);
      z	    : out std_logic_vector(31 downto 0)
    );
  end component mux_32;

  -- Flip-flops

  -- D Flip-flops from Figure C.8.4 with a falling edge trigger.
  component dff
    port (
      clk   : in  std_logic;
      d	    : in  std_logic;
      q	    : out std_logic
    );
  end component dff;

  -- D Flip-flops from Figure C.8.4 with a rising edge trigger.
  component dffr
    port (
      clk   : in  std_logic;
      d	    : in  std_logic;
      q	    : out std_logic
    );
  end component dffr;

  -- D Flip-flops from Example 13-40 in http://www.altera.com/literature/hb/qts/qts_qii51007.pdf
  component dffr_a
    port (
      clk	 : in  std_logic;
      arst   : in  std_logic;
      aload  : in  std_logic;
      adata  : in  std_logic;
      d	     : in  std_logic;
      enable : in  std_logic;
      q	     : out std_logic
    );

  end component dffr_a;

  -- A 32bit SRAM from Figure C.9.1. It can only be used for simulation.
  component sram
	generic (
	  mem_file	: string
	);
	port (
	  -- chip select
	  cs	: in  std_logic;
	  -- output enable
	  oe	: in  std_logic;
	  -- write enable
	  we	: in  std_logic;
	  -- address line
	  addr	: in  std_logic_vector(31 downto 0);
	  -- data input
	  din	: in  std_logic_vector(31 downto 0);
	  -- data output
	  dout	: out std_logic_vector(31 downto 0)
	);
  end component sram;

  -- Synchronous SRAM with asynchronous reset.
  component syncram
    generic (
	  mem_file	: string
	);
	port (
      -- clock
      clk   : in  std_logic;
	  -- chip select
	  cs	: in  std_logic;
      -- output enable
	  oe	: in  std_logic;
	  -- write enable
	  we	: in  std_logic;
	  -- address line
	  addr	: in  std_logic_vector(31 downto 0);
	  -- data input
	  din	: in  std_logic_vector(31 downto 0);
	  -- data output
	  dout	: out std_logic_vector(31 downto 0)
	);
  end component syncram;

component dec_32
  port (
    src	: in std_logic_vector(4 downto 0);
    z	: out std_logic_vector(31 downto 0)
  );
end component dec_32;

component mux32_32
  port (
	in0	 : in  std_logic_vector(31 downto 0);
	in1	 : in  std_logic_vector(31 downto 0);
	in2	 : in  std_logic_vector(31 downto 0);
	in3	 : in  std_logic_vector(31 downto 0);
	in4	 : in  std_logic_vector(31 downto 0);
	in5	 : in  std_logic_vector(31 downto 0);
	in6	 : in  std_logic_vector(31 downto 0);
	in7	 : in  std_logic_vector(31 downto 0);
	in8	 : in  std_logic_vector(31 downto 0);
	in9	 : in  std_logic_vector(31 downto 0);
	in10	: in  std_logic_vector(31 downto 0);
	in11	: in  std_logic_vector(31 downto 0);
	in12	: in  std_logic_vector(31 downto 0);
	in13	: in  std_logic_vector(31 downto 0);
	in14	: in  std_logic_vector(31 downto 0);
	in15	: in  std_logic_vector(31 downto 0);
	in16	: in  std_logic_vector(31 downto 0);
	in17	: in  std_logic_vector(31 downto 0);
	in18	: in  std_logic_vector(31 downto 0);
	in19	: in  std_logic_vector(31 downto 0);
	in20	: in  std_logic_vector(31 downto 0);
	in21	: in  std_logic_vector(31 downto 0);
	in22	: in  std_logic_vector(31 downto 0);
	in23	: in  std_logic_vector(31 downto 0);
	in24	: in  std_logic_vector(31 downto 0);
	in25	: in  std_logic_vector(31 downto 0);
	in26	: in  std_logic_vector(31 downto 0);
	in27	: in  std_logic_vector(31 downto 0);
	in28	: in  std_logic_vector(31 downto 0);
	in29	: in  std_logic_vector(31 downto 0);
	in30	: in  std_logic_vector(31 downto 0);
	in31	: in  std_logic_vector(31 downto 0);
	
	sel	: in  std_logic_vector(4 downto 0);
	output	: out std_logic_vector(31 downto 0)
  );
end component mux32_32;  

component mux_4input
  port (
	sel	  : in	std_logic_vector(1 downto 0);
	src0  : in	std_logic_vector(31 downto 0);
	src1  :	in	std_logic_vector(31 downto 0);
	src2  :	in	std_logic_vector(31 downto 0);
	src3  :	in	std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component mux_4input;


component register_file
port
(
  outA          : out std_logic_vector(31 downto 0);
  outB          : out std_logic_vector(31 downto 0);
  input         : in  std_logic_vector(31 downto 0);
  reg5,reg6,reg7:out std_logic_vector(31 downto 0);
  writeEnable   : in std_logic;
  regASel       : in std_logic_vector(4 downto 0);
  regBSel       : in std_logic_vector(4 downto 0);
  writeRegSel   : in std_logic_vector(4 downto 0);
  clock         : in std_logic
  );
end component register_file;

component control 
port(
opcode: in std_logic_vector(5 downto 0);
func:in std_logic_vector(5 downto 0);
regWr,regDst,jump,branch,extOp,ALUsrc,memWr,memToReg: out std_logic;
ALUctr:out  std_logic_vector(4 downto 0);
eq: out std_logic;
shamt_imm: out std_logic
);
end component control;

--ALU items
component mux_4to1
	port(
		op:in std_logic_vector(1 downto 0);
		a0,a1,a2,a3:in std_logic;
		result:out std_logic
);
end component mux_4to1;

component alu 
	port	(
		op:in std_logic_vector(4 downto 0);
		a,b:in std_logic_vector(31 downto 0);
		co,zero,ov:out std_logic;
		s: out std_logic_vector(31 downto 0)
	);
end component alu;

component single_alu 
	port(
		a,b,ci:in std_logic;
		op:in std_logic_vector(1 downto 0);
		co,s:out std_logic
);
end component single_alu;

component sltu 
	port	(
		a,b:in std_logic_vector(31 downto 0);
		result:out std_logic
	);
end component sltu;

component slt  
	port	(
		a,b:in std_logic_vector(31 downto 0);
		result:out std_logic
	);
end component slt;

component zhuanma
	port	(
		x:in std_logic_vector(31 downto 0);
		z:out std_logic_vector(31 downto 0)
	);
end component zhuanma;

component left_shifter 
	port(
		a: in std_logic_vector(31 downto 0);
		s: in std_logic_vector(4 downto 0);
		result: out std_logic_vector(31 downto 0)
);
end component left_shifter;

component right_shifter  
	port(
		a: in std_logic_vector(31 downto 0);
		s: in std_logic_vector(4 downto 0);
		result: out std_logic_vector(31 downto 0)
);
end component right_shifter;
end;
