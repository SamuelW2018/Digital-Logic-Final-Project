--Simon Says
--by Samuel Wynsma and Jarek Thomas
--this is as of right now a failed attempt at the simon says game
--this file is our fsm file
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
  port (
			user_in : in std_logic;
			--clk : in std_logic;
			state : out std_logic_vector(2 downto 0)
		  );
end FSM;

architecture Behavioral of FSM is
  type statetype is ( S0, S1, S2, S3, S4, S5, S6, S7);
  signal cstate :  statetype;
  signal pstate :  statetype;
  signal cpu_in : std_logic := '1';
  --signal clk25 : std_logic;
begin
  
-- process (clk)
--begin
--  if clk'event and clk='1' then
--    clk25 <= not clk25;
--  end if;
--end process;
--
--p1: process (clk25)
--		variable cnt : integer;
--begin
--	if clk25'event and clk25='1' then
--		cnt := cnt + 1;
--		if cnt = 25000000 then
--			pstate <= cstate;
--			cnt := 0;
--		end if;
--	end if;
--end process; 
 
 cstate <= s1 when pState = s0 and cpu_in = '1' else
				s2 when pState = s1 and cpu_in = '1' else
				s3 when pState = s2 and cpu_in = '1' else 
				s4 when pState = s3 else
				s5 when pState = s4 and user_in = '1' else
				s6 when pState = s5 and user_in = '1' else
				s7 when pState = s6 and user_in = '1' else
				s0 when pState = s7 else
				s0 when pState = s4 and user_in = '0' else
				s0 when pState = s5 and user_in = '0' else
				s0 when pState = s6 and user_in = '0';
				
	--output logic
	state <= "000" when cstate = s0 else
				"001" when cstate = s1 else
				"010" when cstate = s2 else
				"011" when cstate = s3 else
				"100" when cstate = s4 else
				"101" when cstate = s5 else
				"110" when cstate = s6 else
				"111" when cstate = s7;	
end Behavioral;

