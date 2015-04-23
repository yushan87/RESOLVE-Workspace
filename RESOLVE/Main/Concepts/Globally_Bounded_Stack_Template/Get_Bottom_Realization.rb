Realization Get_Bottom_Realization for Get_Bottom_Capability of 
		Globally_Bounded_Stack_Template;
	
	Procedure Get_Bottom(updates E : Entry; updates S : Stack);
		Var S_Temp : Stack;
		Var E_Temp : Entry;
		Var Empty : Boolean;
		
		Empty := Is_Empty(S);
		While ( Not(Empty) )
			changing S, S_Temp, E_Temp, Empty;
			maintaining #S = Reverse(S_Temp) o S and
						Empty = (S = Empty_String);
			decreasing |S|;
		do
			Pop(E_Temp, S);
			Push(E_Temp, S_Temp);
			Empty := Is_Empty(S);
		end;
		Pop(E, S_Temp);
		Empty := Is_Empty(S_Temp);
		While ( Not(Empty) )
			changing S, S_Temp, E_Temp, Empty;
			maintaining #S = Reverse(S_Temp) o S o <E> and
						Empty = (S_Temp = Empty_String); 
			decreasing |S_Temp|;
		do
			Pop(E_Temp, S_Temp);
			Push(E_Temp, S);
			Empty := Is_Empty(S_Temp);
		end;
	end Get_Bottom;

end Get_Bottom_Realization;
