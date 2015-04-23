Realization Obvious_Flipping_Realiz for Flipping_Capability of 
		Globally_Bounded_Stack_Template;

	Procedure Flip(updates S: Stack);
		Var Temp: Stack;
		Var Next_Entry: Entry;
		Var Empty: Boolean;

		Empty := Is_Empty(S);
		While ( Not(Empty) )
			maintaining #S = Reverse(Temp) o S and
						Empty = (S = Empty_String);
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Push(Next_Entry, Temp);
			Empty := Is_Empty(S);
		end;
		Temp :=: S;
	end Flip;
end Obvious_Flipping_Realiz;
