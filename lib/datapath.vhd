-- This file is generated by automatic tools.
library ieee;
use ieee.std_logic_1164.all;

entity data_path is
  port (
    clk	  : in std_logic;
	ALU_A : out std_logic_vector(31 downto 0);
	ALU_B : out std_logic_vector(31 downto 0);
	PC	  : out std_logic_vector(31 downto 0);
	ALU_Result: out std_logic_vector(31 downto 0);
	Instruction: out std_logic_vector(31 downto 0)
  );
end data_path;