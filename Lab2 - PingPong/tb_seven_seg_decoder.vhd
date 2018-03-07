library ieee;
use ieee.std_logic_1164.all;


entity tb_seven_seg_decoder is
end tb_seven_seg_decoder;

architecture behaviour of tb_seven_seg_decoder is

	component seven_seg_decoder is
		port (
			number		: in std_logic_vector (3 downto 0);
			segments	: out std_logic_vector (6 downto 0)
			);
	end component;

	signal number_in	:  std_logic_vector (3 downto 0);
	
	signal segment_out	:  std_logic_vector (6 downto 0);

begin

	dut: seven_seg_decoder
	port map (
			number => number_in,
			segments => segment_out
		);

	verification: process
	begin


		number_in <= x"0";
		wait for 10ns;
		assert segment_out ="0111111" report "Error, Case 0" severity Error;

		number_in <= x"1";
		wait for 10ns;
		assert segment_out ="1111001" report "Error, Case 1" severity Error;


		number_in <= x"2";
		wait for 10ns;
		assert segment_out ="0100100" report "Error, Case 2" severity Error;

		number_in <= x"3";
		wait for 10ns;
		assert segment_out ="0110000" report "Error, Case 3" severity Error;

		number_in <= x"4";
		wait for 10ns;
		assert segment_out ="0011001" report "Error, Case 4" severity Error;

		number_in <= x"5";
		wait for 10ns;
		assert segment_out ="0010010" report "Error, Case 5" severity Error;

		number_in <= x"6";
		wait for 10ns;
		assert segment_out ="0000010" report "Error, Case 6" severity Error;

		number_in <= x"7";
		wait for 10ns;
		assert segment_out ="1111000" report "Error, Case 7" severity Error;

		number_in <= x"8";
		wait for 10ns;
		assert segment_out ="0000000" report "Error, Case 8" severity Error;

		number_in <= x"9";
		wait for 10ns;
		assert segment_out ="0010000" report "Error, Case 9" severity Error;

		report "7 Segment test Success!";
		wait;
	end process;
end behaviour;


