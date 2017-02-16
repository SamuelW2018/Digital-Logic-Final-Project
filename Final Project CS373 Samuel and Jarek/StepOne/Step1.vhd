--Sam Wynsma and Jarek Thomas
--Final project
--this is our successful finite state machine
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity simon is 
	Port( pState : in STD_LOGIC_VECTOR(2 downto 0);
			user_in : in STD_LOGIC;
			win : out STD_LOGIC;
			state : out STD_LOGIC_VECTOR(2 downto 0);
			clk50_in : in STD_LOGIC);
end simon;

architecture behavioral of simon is
	type statetype is (s0,s1,s2,s3,s4,s5,s6,s7);
	signal cstate : statetype;
	--signal clk25 : STD_LOGIC := '0';
	signal cpu_in : STD_LOGIC := '0';
begin

	process (clk50_in)
	begin
		if clk50_in'event and clk50_in = '1' then
			--clk25 <= not clk25;
			cpu_in <= not cpu_in;
		end if;
	end process;
	
--	p1: process (clk25, cpu_in)
--	begin
--		if clk25'event and clk25 = '1' then
--				cpu_in <= not cpu_in;
--		end if;
--	end process;
	
	cstate <= s1 when pState = "000" and cpu_in = '1' else
				s2 when pState = "001" and cpu_in = '1' else
				s3 when pState = "010" and cpu_in = '1' else 
				s4 when pState = "011" else
				s5 when pState = "100" and user_in = '1' else
				s6 when pState = "101" and user_in = '1' else
				s7 when pState = "110" and user_in = '1' else
				s0 when pState = "111" else
				s0 when pState = "100" and user_in = '0' else
				s0 when pState = "101" and user_in = '0' else
				s0 when pState = "110" and user_in = '0';
			 
	--output logic
	state <= "000" when cstate = s0 else
				"001" when cstate = s1 else
				"010" when cstate = s2 else
				"011" when cstate = s3 else
				"100" when cstate = s4 else
				"101" when cstate = s5 else
				"110" when cstate = s6 else
				"111" when cstate = s7;

	
	win <= '1' when cstate = s7 else
			 '0';
end behavioral;

