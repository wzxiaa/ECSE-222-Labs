-----------------------------
-- This is a special counter that counts up and then counts down
------------------------------

-- Import the necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declare entity
entity counter is
     -- A generic statement can be overwritten in the top level entity. This allows for design flexibility
     Generic(
	     constant maximum : unsigned := x"9" -- Unsigned is a special type which can be used for arithmetic
             );
     Port (
	 clk	         : in std_logic; -- Clock for the system
	 rst             : in std_logic; -- Resets the count
	 count	         : out std_logic_vector (3 downto 0) -- Value of counter
	  ); 
end counter;

architecture behaviour of counter is

begin


      -- Concurrent Process
      process(clk,rst)
            --  Internal Variables
           variable count_reg : unsigned (3 downto 0);
	   variable count_up : std_logic;
      begin

           -- Asynchronous reset logic
           if (rst = '1') then
                count_reg := (others => '0');
		count_up := '1';

	   -- Do work on Rising edge of clock
	   elsif (clk'event and clk = '1') then
                   -- Concurrent Assignment
		   count <= std_logic_vector(count_reg); -- Must cast to std_logic_vector
               -- Set count up or count down
           if(count_reg = maximum) then
                   count_up := '0';
           elsif (count_reg = "0000") then
                   count_up := '1';
           end if;

           --Update the counter
           if(count_up = '1') then
               count_reg := count_reg + 1;
           else
               count_reg := count_reg - 1;
           end if;
        end if;
   
   end process;

end behaviour;
