Realization Get_Bottom_Realization for Get_Bottom_Capability of 
		Globally_Bounded_Stack_Template;
	
	Procedure Get_Bottom(updates S : Stack; updates E : Entry);
		Var S_Temp : Stack;
		Var E_Temp : Entry;
		While ( Not(Is_Empty(S)) )
			changing S, S_Temp, E_Temp;
			maintaining #S = Reverse(S_Temp) o S; 
			decreasing |S|;
		do
			Pop(E_Temp, S);
			Push(E_Temp, S_Temp);
		end;
		Pop(E, S_Temp);
		While ( Not(Is_Empty(S_Temp)) )
			changing S, S_Temp, E_Temp;
			maintaining #S = Reverse(S_Temp) o S o <E>;
			decreasing |S_Temp|;
		do
			Pop(E_Temp, S_Temp);
			Push(E_Temp, S);
		end;
	end Get_Bottom;

end Get_Bottom_Realization;
