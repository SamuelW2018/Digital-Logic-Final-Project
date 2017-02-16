--Simon Says
--by Samuel Wynsma and Jarek Thomas
--this is as of right now a failed attempt at the simon says game
--this file is our top level file
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blah is
  port ( red_out : out std_logic_vector(2 downto 0);
			green_out : out std_logic_vector(2 downto 0);
			blue_out : out std_logic_vector(2 downto 0);
			hs_out : out std_logic;
			vs_out : out std_logic;
			clk : in std_logic;
			user_in : in std_logic;
			pstate : in std_logic_vector(2 downto 0)
  );
end blah;

architecture Behavioral of blah is

component FSM is
  port (
			user_in : in std_logic;
			--clk : in std_logic;
			state : out std_logic_vector(2 downto 0)
		  );
end component FSM;

component haha is
    port ( clk : in std_logic;
			  state : in std_logic_vector(2 downto 0);
			  red_out : out std_logic_vector(2 downto 0);
			  green_out : out std_logic_vector(2 downto 0);
			  blue_out : out std_logic_vector(2 downto 0);
			  hs_out : out std_logic;
			  vs_out : out std_logic
			  );
end component haha;

-- signal clk : std_logic;
-- signal button : std_logic;
signal state : std_logic_vector(2 downto 0);
-- signal segments : std_logic_vector(6 downto 0);

begin

   led_fsm : FSM port map(user_in, state);
	ha : haha port map( clk, state, red_out, green_out, blue_out, hs_out, vs_out);

end Behavioral;

