--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:23:41 12/05/2016
-- Design Name:   
-- Module Name:   Z:/CS373-1/StepOne/step1test.vhd
-- Project Name:  StepOne
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: simon
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY step1test IS
END step1test;
 
ARCHITECTURE behavior OF step1test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT simon
    PORT(
         pState : IN  std_logic_vector(2 downto 0);
         user_in : IN  std_logic;
         win : OUT  std_logic;
         state : OUT  std_logic_vector(2 downto 0);
         clk50_in : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal pState : std_logic_vector(2 downto 0) := (others => '0');
   signal user_in : std_logic := '0';
   signal clk50_in : std_logic := '0';
	
	-- signal clk25 : std_logic := '0';

 	--Outputs
   signal win : std_logic;
   signal state : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk50_in_period : time := 28 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: simon PORT MAP (
          pState => pState,
          user_in => user_in,
          win => win,
          state => state,
          clk50_in => clk50_in
        );

   -- Clock process definitions
   clk50_in_process :process
   begin
		clk50_in <= '0';
		wait for clk50_in_period/2;
		clk50_in <= '1';
		wait for clk50_in_period/2;
   end process;
	
	

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.

      wait for clk50_in_period*2;
		wait for 14 ns;
      -- insert stimulus here
		user_in <= '1';
		for i in 0 to 7 loop
			pState <= CONV_STD_LOGIC_VECTOR(i, 3);
			wait for 2 ns;
			if pState(2) = '0' and pState(1) = '0' and pState(0) = '0' then assert win = '0' and state = "001" report "Failed for 000 with cpu and user";
			elsif pState(2) = '0' and pState(1) = '0' and pState(0) = '1' then assert win = '0' and state = "010" report "Failed for 001 with cpu and user";
			elsif pState(2) = '0' and pState(1) = '1' and pState(0) = '0' then assert win = '0' and state = "011" report "Failed for 010 with cpu and user";
			elsif pState(2) = '0' and pState(1) = '1' and pState(0) = '1' then assert win = '0' and state = "100" report "Failed for 011 with cpu and user";
			elsif pState(2) = '1' and pState(1) = '0' and pState(0) = '0' then assert win = '0' and state = "101" report "Failed for 100 with cpu and user";
			elsif pState(2) = '1' and pState(1) = '0' and pState(0) = '1' then assert win = '0' and state = "110" report "Failed for 101 with cpu and user";
			elsif pState(2) = '1' and pState(1) = '1' and pState(0) = '0' then assert win = '0' and state = "111" report "Failed for 110 with cpu and user";
			else assert win = '1' and state = "000" report "Failed for 111 with cpu and user";
			end if;
		end loop;
		
		wait for 14 ns;
		user_in <= '1';
		for i in 0 to 7 loop
			pState <= CONV_STD_LOGIC_VECTOR(i, 3);
			wait for 2 ns;
			if pState(2) = '0' and pState(1) = '0' and pState(0) = '0' then assert win = '0' and state = "000" report "Failed for 000 with user";
			elsif pState(2) = '0' and pState(1) = '0' and pState(0) = '1' then assert win = '0' and state = "001" report "Failed for 001 with user";
			elsif pState(2) = '0' and pState(1) = '1' and pState(0) = '0' then assert win = '0' and state = "010" report "Failed for 010 with user";
			elsif pState(2) = '0' and pState(1) = '1' and pState(0) = '1' then assert win = '0' and state = "011" report "Failed for 011 with user";
			elsif pState(2) = '1' and pState(1) = '0' and pState(0) = '0' then assert win = '0' and state = "101" report "Failed for 100 with user";
			elsif pState(2) = '1' and pState(1) = '0' and pState(0) = '1' then assert win = '0' and state = "110" report "Failed for 101 with user";
			elsif pState(2) = '1' and pState(1) = '1' and pState(0) = '0' then assert win = '0' and state = "111" report "Failed for 110 with user";
			else assert win = '1' and state = "000" report "Failed for 111 with cpu and user";
			end if;
		end loop;
		
		wait for 14 ns;
		user_in <= '0';
		for i in 0 to 7 loop
			pState <= CONV_STD_LOGIC_VECTOR(i, 3);
			wait for 2 ns;
			if pState(2) = '0' and pState(1) = '0' and pState(0) = '0' then assert win = '0' and state = "001" report "Failed for 000 with cpu";
			elsif pState(2) = '0' and pState(1) = '0' and pState(0) = '1' then assert win = '0' and state = "010" report "Failed for 001 with cpu";
			elsif pState(2) = '0' and pState(1) = '1' and pState(0) = '0' then assert win = '0' and state = "011" report "Failed for 010 with cpu";
			elsif pState(2) = '0' and pState(1) = '1' and pState(0) = '1' then assert win = '0' and state = "100" report "Failed for 011 with cpu";
			elsif pState(2) = '1' and pState(1) = '0' and pState(0) = '0' then assert win = '0' and state = "000" report "Failed for 100 with cpu";
			elsif pState(2) = '1' and pState(1) = '0' and pState(0) = '1' then assert win = '0' and state = "000" report "Failed for 101 with cpu";
			elsif pState(2) = '1' and pState(1) = '1' and pState(0) = '0' then assert win = '0' and state = "000" report "Failed for 110 with cpu";
			else assert win = '1' and state = "000" report "Failed for 111 with cpu and user";
			end if;
		end loop;		

      wait;
   end process;

END;
