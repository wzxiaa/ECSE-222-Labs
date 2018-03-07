-------------------------------------
-- This is a module to keep the score of the players
--------------------------------------

-- Import the necessary libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Declare entity
entity score_keeper is
    Port (
        clk            : in std_logic; -- Clock for the system
        rst            : in std_logic; -- Resets the score
        paddle_left    : in std_logic;
        paddle_right   : in std_logic;
        counter        : in std_logic_vector (3 downto 0);
        score_left     : out std_logic_vector (3 downto 0);
        score_right    : out std_logic_vector (3 downto 0)
          );
end score_keeper ;

architecture behaviour of score_keeper is 
begin

   process(clk, rst)
      --Internal values for the pong module
      variable score_left_reg     : unsigned (3 downto 0);
      variable score_right_reg    : unsigned (3 downto 0);

   begin
      -- Reset all variables 
      if rst = '1' then 
          score_left_reg  := "0000"; 
          score_right_reg := "0000"; 

      elsif (clk'event and clk = '1') then 
      -- This is where all the core logic belongs 

          -- Left Player missed a ball 
          if (counter = x"0" and paddle_left = '0') then 
               score_right_reg := score_right_reg + 1; 

          -- Right Player missed a ball
          elsif (counter = x"9" and paddle_right = '0' ) then
               score_left_reg := score_left_reg + 1; 
          end if; 

          -- Set outputs to register values 
          score_left  <= std_logic_vector(score_left_reg); 
          score_right <= std_logic_vector(score_right_reg); 

       end if;
   end process;   

end behaviour; 
