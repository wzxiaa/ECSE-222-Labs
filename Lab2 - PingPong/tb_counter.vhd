-------------------------------
-- Author: Sameen Mahtab, Sudip Das
-- Email: sameen.mahtab@mail.mcgill.ca , sudip.das@mail.mcgill.ca
--
-- This is Test Bench for the special counter
-------------------------------

-- Import the necessary Libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee .numeric_std.all;

--Declare entity
entity tb_counter is
end tb_counter;

architecture behaviour of tb_counter is 

     --Declare counter component     
     component counter is 
         port (
         clk             : in std_logic; -- Clock for the system
         rst             : in std_logic; -- Resets the count
         count           : out std_logic_vector (3 downto 0) -- Value of counter
              );
     end component;

     -- Inputs
     signal clk_in        : std_logic;
     signal rst_in        : std_logic;

     -- Outputs
     signal count_out     : std_logic_vector (3 downto 0);

     -- Helpers
     constant clk_period : time := 10 ns;
     
begin

     --Instanciated the counter
     dut: counter
     port map (
                 clk => clk_in,
                 rst => rst_in,
                 count => count_out
               );

      -- This Process creates a clock signal
      clk_process: process
      begin
          clk_in <= '0';
          wait for clk_period/2;
          clk_in <= '1';
          wait for clk_period/2;
      end process;

      -- This initializes the system by holding the reset high for 2 clock periods
      init: process
      begin 
          wait for clk_period;
          rst_in <= '1';
          wait for clk_period;
          rst_in <= '0';
          wait;
      end process;
      
      -- This is the actual unit test
      test: process
      begin
     	  wait for clk_period * 3;
      
     	  assert count_out = "0000" report "Error" severity Error;
     	  wait for clk_period;

      	  assert count_out = "0001" report "Error" severity Error;
          wait for clk_period;

     	  assert count_out = "0010" report "Error" severity Error;
     	  wait for clk_period;

     	  assert count_out = "0011" report "Error" severity Error;
     	  wait for clk_period;

     	  assert count_out = "0100" report "Error" severity Error;
     	  wait for clk_period;

     	  assert count_out = "0101" report "Error" severity Error;
     	  wait for clk_period;

     	  assert count_out = "0110" report "Error" severity Error;
    	  wait for clk_period;

     	  assert count_out = "0111" report "Error" severity Error;
     	  wait for clk_period;

    	  assert count_out = "1000" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "1001" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "1000" report "Error" severity Error;
          wait for clk_period;
 
    	  assert count_out = "0111" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "0110" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "0101" report "Error" severity Error;
          wait for clk_period;
   
          assert count_out = "0100" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "0011" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "0010" report "Error" severity Error;
          wait for clk_period;

      	  assert count_out = "0001" report "Error" severity Error;
          wait for clk_period;

          assert count_out = "0000" report "Error" severity Error;
          wait for clk_period;

          -- This will stop the simulation

          assert false report "Counter test Success!" severity failure;
     end process;

end behaviour; 

    
