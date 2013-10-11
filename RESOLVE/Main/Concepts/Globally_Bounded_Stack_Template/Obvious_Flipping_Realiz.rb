Realization Obvious_Flipping_Realiz for Flipping_Capability of 
		Globally_Bounded_Stack_Template;

	Procedure Flip(updates S: Stack);
		Var S_Reversed: Stack;
		Var Next_Entry: Entry;

		While ( Not(Is_Empty(S)) )
			maintaining #S = Reverse(S_Reversed) o S;
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Push(Next_Entry, S_Reversed);
		end;
		S_Reversed :=: S;
	end Flip;
end Obvious_Flipping_Realiz;
