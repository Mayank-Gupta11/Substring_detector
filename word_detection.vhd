library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity word_detection is
	port( inp:in std_logic_vector(4 downto 0);
	reset,clock:in std_logic;
	outp: out std_logic);
end word_detection;

architecture bhv of word_detection is
---------------Define state type here-----------------------------
type state is (rst, s1, s2, s3, s4, s5, s6, s7, s8,s9, s10, s11); -- Fill other states here
---------------Define signals of state type-----------------------
signal y_present1,y_next1: state:=rst;
signal y_present2,y_next2: state:=rst;
signal y_present3,y_next3: state:=rst;
signal outp1, outp2, outp3: std_logic;
begin
clock_proc:process(clock,reset)
begin
if(clock='1' and clock' event) then
	if(reset='1') then
		y_present1<= rst;
		y_present2<= rst;
		y_present3<= rst;
--Here Reset is synchronous
-- Fill the code here
	else
		y_present1<=y_next1;
		y_present2<=y_next2;
		y_present3<=y_next3;
	-- Fill the code here
	end if;
end if;
end process;
state_transition_proc1:process(inp,y_present1)
begin
	case y_present1 is
		when rst=>
			if(unsigned(inp)=18) then --r has been detected
				y_next1<= s1;-- Fill the code here
				
			else
				y_next1<=rst;
			end if;
			--outp<='0';
		when s1=>
			if (unsigned(inp)=21) then
				y_next1<= s2;
				
			else
				y_next1<=s1;
			end if;
			--outp<='0';
		when s2=>
			if (unsigned(inp)=14) then
				y_next1<= s3;
				
			else
				y_next1<=s2;
			end if;
			
		when s3=>
			if(unsigned(inp)=18) then --r has been detected
				y_next1<= s1;-- Fill the code here
				
			else
				y_next1<=rst;
			end if;
			--outp1<='1';
		when others=>
			
		
		end case;
		
	end process state_transition_proc1;
	
state_transition_proc2:process(inp,y_present2)
begin

	case y_present2 is
		when rst=>
			if(unsigned(inp)=3) then --r has been detected
				y_next2<= s4;-- Fill the code here
				
			else
				y_next2<=rst;
			end if;
			--outp<='0';
		when s4=>
			if (unsigned(inp)=18) then
				y_next2<= s5;
				
			else
				y_next2<=s4;
			end if;
			--outp<='0';
		when s5=>
			if (unsigned(inp)=25) then
				y_next2<= s6;
				
			else
				y_next2<=s5;
			end if;
			
		when s6=>
			if(unsigned(inp)=3) then --r has been detected
				y_next2<= s4;-- Fill the code here
				
			else
				y_next2<=rst;
			end if;
			--outp2<='1';
		when others=>
		
		end case;
	end process state_transition_proc2;
	
state_transition_proc3:process(inp,y_present3)
begin
	
	
	case y_present3 is
		when rst=>
			if(unsigned(inp)=2) then --r has been detected
				y_next3<= s7;-- Fill the code here
				
			else
				y_next3<=rst;
			end if;
			--outp<='0';
		when s7=>
			if (unsigned(inp)=18) then
				y_next3<= s8;
				
			else
				y_next3<=s7;
			end if;
			--outp<='0';
		when s8=>
			if (unsigned(inp)=15) then
				y_next3<= s9;
				
			else
				y_next3<=s8;
			end if;
			--outp<='0';
		when s9=>
			if (unsigned(inp)=15) then
				y_next3<= s10;
				
			else
				y_next3<=s9;
			end if;
			--outp<='0';
		when s10=>
			if (unsigned(inp)=13) then
				y_next3<= s11;
				
			else
				y_next3<=s10;
			end if;
			--outp<='1';
		when s11=>
			if(unsigned(inp)=2) then --r has been detected
				y_next3<= s7;-- Fill the code here
				
			else
				y_next3<=rst;
			end if;
			--outp3<='1';
		when others=>
		end case;
	end process state_transition_proc3;
	

		-------------------------
		---------Fill rest of the code here---------
output_proc1:process(y_present1, inp) ------- output process after this which will give
-------the output based on the present state and input (Mealy machine)
begin
	case y_present1 is
		when rst =>
			outp1<='0';
		when s1=>
			outp1<='0';
		when s2=>
			if (unsigned(inp)=14) then
				outp1<='1';
			else
				outp1<='0';
			end if;
		when s3=>
			outp1<='0';
		when others =>
			outp1<='0';
		
	end case;
end process output_proc1;
output_proc2:process(y_present2, inp) ------- output process after this which will give
-------the output based on the present state and input (Mealy machine)
begin
	case y_present2 is
		when rst=>
			outp2<='0';
		when s4=>
			outp2<='0';
		when s5=>
			if (unsigned(inp)=25) then
				outp2<='1';
			else
				outp2<='0';
			end if;
		when s6=>
			outp2<='0';
		when others=>
			outp2<='0';
	end case;
end process output_proc2;
output_proc3:process(y_present3, inp) ------- output process after this which will give
-------the output based on the present state and input (Mealy machine)
begin
	case y_present3 is
		when rst=>
			outp3<='0';
		when s7=>
			outp3<='0';
		when s8=>
			outp3<='0';
		when s9=>
			outp3<='0';
		when s10=>
			if (unsigned(inp)=13) then
				outp3<='1';
			else
				outp3<='0';
			end if;
		when s11=>
			outp3<='0';
		when others=>
			outp3<='0';
	end case;
end process output_proc3;
outp<= outp1 or outp2 or outp3;
end bhv;
