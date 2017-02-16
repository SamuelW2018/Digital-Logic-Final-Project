----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:43 12/07/2016 
-- Design Name: 
-- Module Name:    box - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity box is
	Port(	red_out : out std_logic_vector(2 downto 0);
			green_out : out std_logic_vector(2 downto 0);
			blue_out : out std_logic_vector(2 downto 0);
			x : in STD_LOGIC;
			y : in STD_LOGIC);
end box;

architecture Behavioral of box is
	signal color: std_logic_vector(2 downto 0);
begin
	p1 : process (color)
	begin
		if ( (( x > 100) and (x < 200)) and ((y > 100) and (y < 200)) ) then
      	red_out <= "111";
      	green_out <= color; 
      	blue_out <= color;
    	elsif ( ((x>220) and (x < 320)) and ((y > 100) and (y < 200)) ) then
			red_out <= color;
      	green_out <= "111"; 
      	blue_out <= color;
    	elsif ( ((x>100) and (x < 200)) and ((y > 220) and (y < 320)) ) then
			red_out <= color;
      	green_out <= color; 
      	blue_out <= "111";
    	elsif ( ((x>220) and (x < 320)) and ((y > 220) and (y < 320)) ) then
			red_out <= "111";
      	green_out <= "111";
      	blue_out <= color;
		else
			-- if not traced, set it to "black" color
      	red_out <= "000";
      	green_out <= "000";
      	blue_out <= "000";
    	end if;
	end process;

end Behavioral;

