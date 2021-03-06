---- generates the appropriate 7-segment display associated with the input code
--
-- entity name: g23_7_segment_decoder
--
-- Copyright (C) 2014 cadesalaberry, grahamludwinski
--
-- Version 1.0
--
-- Author:
--		Charles-Antoine de Salaberry; ca.desalaberry@mail.mcgill.ca,
--		Graham Ludwinski; graham.ludwinski@mail.mcgill.ca
--
-- Date: 13/02/2014

library ieee;					-- allows use of the std_logic_vector type
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;		-- allows use of the unsigned type


entity g23_7_segment_decoder is
	port (
		code			: in	std_logic_vector(3 downto 0);
		RippleBlank_In	: in	std_logic;
		RippleBlank_Out	: out	std_logic;
		segments		: out	std_logic_vector(6 downto 0)
	);
end g23_7_segment_decoder;

architecture alpha of g23_7_segment_decoder is

	signal temp : std_logic_vector(7 downto 0);
	
begin

	RippleBlank_Out	<= temp(7);
	segments		<= temp(6 downto 0);

	with RippleBlank_In & code select
		temp <=
			"0000001" when "00000",  -- '0'
			"1001111" when "00001",  -- '1'
			"0010010" when "00010",  -- '2'
			"0000110" when "00011",  -- '3'
			"1001100" when "00100",  -- '4'
			"0100100" when "00101",  -- '5'
			"0100000" when "00110",  -- '6'
			"0001111" when "00111",  -- '7'
			"0000000" when "01000",  -- '8'
			"0000100" when "01001",  -- '9'
			"0001000" when "01010",  -- 'A'
			"1100000" when "01011",  -- 'b' (lowercase B)
			"0110001" when "01100",  -- 'C'
			"1000010" when "01101",  -- 'd' (lowercase D)
			"0110000" when "01110",  -- 'E'
			"0111000" when "01111",  -- 'F'
			"1111111" when "10000",
			
			"1001111" when "10001",  -- '1'
			"0010010" when "10010",  -- '2'
			"0000110" when "10011",  -- '3'
			"1001100" when "10100",  -- '4'
			"0100100" when "10101",  -- '5'
			"0100000" when "10110",  -- '6'
			"0001111" when "10111",  -- '7'
			"0000000" when "11000",  -- '8'
			"0000100" when "11001",  -- '9'
			"0001000" when "11010",  -- 'A'
			"0000000" when "11011",  -- 'B'
			"0110001" when "11100",  -- 'C'
			"0000001" when "11101",  -- 'D'
			"0110000" when "11110",  -- 'E'
			"0111000" when "11111",  -- 'F'
			"1011010" when others;

end alpha;