-- This is a decoder which decodes a binary number into
-- The bits represents the different led segments for the seven segments display

-- Import the necessary libraries

library ieee;
use ieee.std_logic_1164.all;

-- Declare entity
entity seven_seg_decoder is
	Port (
		number			: in std_logic_vector (3 downto 0);	-- Value of counter
		segments		: out std_logic_vector	(6 downto 0)	-- Pattern to be displayed on the 7-segment display
		);
end seven_seg_decoder;


architecture behaviour of seven_seg_decoder is 
begin
	-- The arguments for process are a sensetivity list
	-- The process will wake up when one of these values
	-- change. In this case is only the input number
	process (number)
	begin
		case number is
			when "0000" => segments <= "1000000";
			when "0001" => segments <= "1111001";
			when "0010" => segments <= "0100100";
			when "0011" => segments <= "0110000";
			when "0100" => segments <= "0011001";
			when "0101" => segments <= "0010010";
			when "0110" => segments <= "0000010";
			when "0111" => segments <= "1111000";
			when "1000" => segments <= "0000000";
			when "1001" => segments <= "0010000";
			when others => segments <= "1010101";
		end case;
	end process;

end behaviour;
