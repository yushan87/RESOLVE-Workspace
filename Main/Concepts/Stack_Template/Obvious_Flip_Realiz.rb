Realization Obvious_Flip_Realiz for Flipping_Capability of Stack_Template;
	Procedure Flip(updates S: Stack);
		Var S_Flipped: Stack;
		Var Next_Entry: Entry;

		While (Depth(S) /= 0)
			maintaining #S = Reverse(S_Flipped) o S;
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Push(Next_Entry, S_Flipped);
		end;
		S_Flipped :=: S;
	end Flip;
end Obvious_Flip_Realiz;