library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


%=====BETTER WAY=======
entity adder_8bit is
port(
  A,B: in unsigned(7 downto 0);
  C: out unsigned(8 downto 0);
);
end adder_8bit;

architecture adder_8bit_arch of adder_8bit is
begin
   %simply concatentate a 0 into the MSB of both A and B in order to negate overflow then add them 
  C <= ('0' & A) + ('0' & B);
end adder_8bit_arch;

%=======BAD WAY=========
entity adder_8bit is
port(
  A,B: in std_logic_vector(7 downto 0);
  C: out std_logic_vector(8 downto 0);
);
end adder_8bit;

architecture adder_8bit_arch of adder_8bit is
begin
   %concatenate a '0' onto the MSB of each of A and B, in order to resize them for the C calcuation
   % then convert to unsigned as this is needed to be able to add them
   % finally convert them back to vectors as the resultant variable C is of this type
  C <= std_logic_vector( unsigned(('0' & A)) + unsigned(('0' & B)) );
end adder_8bit_arch;

