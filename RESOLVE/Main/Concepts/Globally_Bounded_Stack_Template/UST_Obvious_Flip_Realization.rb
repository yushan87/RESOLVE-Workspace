Realization UST_Obvious_Flip_Realization for Flip_Capability of 
		Globally_Bounded_Stack_Template;
	uses Std_Boolean_Fac;

	Procedure Flip(updates S: Stack);
		Var S_Reversed: Stack;
		Var Next_Entry: Entry;

		While (not Is_Empty(S))
			changing S, S_Reversed, Next_Entry;
			maintaining #S = Reverse(S_Reversed) o S;
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Push(Next_Entry, S_Reversed);
		end;
		S_Reversed :=: S;
	end Flip;
end UST_Obvious_Flip_Realization;
