-- This test bench verifies the logic of the led decoder

-- Import the necessary libraries

library ieee;
use ieee.std_logic_1164.all;

-- Declare entity
entity tb_led_decoder is
end tb_led_decoder;

-- Functionality of the led decoder
architecture behaviour of tb_led_decoder is
-- Component declaration of Device Under Test (DUT)
   component led_decoder is
	port (
		count	: in std_logic_vector (3 downto 0);	-- Decimal number 
		leds	: out std_logic_vector (9 downto 0)	-- Lit led
	);
	end component;

   -- Inputs
   signal count_in	: std_logic_vector (3 downto 0);

   -- Outputs
   signal leds_out	: std_logic_vector (9 downto 0);

begin
   dut: led_decoder
   port map (
	count => count_in,
	leds => leds_out
  );


	
    test: process
    begin
	count_in <= x"0";
	wait for 10ns;
	assert leds_out = "1000000000" report "Error, Case 0" severity Error;

	count_in <= x"1";
	wait for 10ns;
	assert leds_out = "0100000000" report "Error, Case 1" severity Error;

	count_in <= x"2";
	wait for 10ns;
	assert leds_out = "0010000000" report "Error, Case 2" severity Error;

	count_in <= x"3";
	wait for 10ns;
	assert leds_out = "0001000000" report "Error, Case 3" severity Error;

	count_in <= x"4";
	wait for 10ns;
	assert leds_out = "0000100000" report "Error, Case 4" severity Error;

	count_in <= x"5";
	wait for 10ns;
	assert leds_out = "0000010000" report "Error, Case 5" severity Error;

	count_in <= x"6";
	wait for 10ns;
	assert leds_out = "0000001000" report "Error, Case 6" severity Error;

	count_in <= x"7";
	wait for 10ns;
	assert leds_out = "0000000100" report "Error, Case 7" severity Error;

	count_in <= x"8";
	wait for 10ns;
	assert leds_out = "0000000010" report "Error, Case 8" severity Error;

	count_in <= x"9";
	wait for 10ns;
	assert leds_out = "0000000001" report "Error, Case 9" severity Error;

	report "LED decoder test success!";
	wait;

     end process;


end behaviour;
