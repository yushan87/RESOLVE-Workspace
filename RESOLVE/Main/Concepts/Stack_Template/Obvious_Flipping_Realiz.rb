Realization Obvious_Flipping_Realiz for Flipping_Capability of Stack_Template;

	Procedure Flip(updates S: Stack);
		Var Temp: Stack;
		Var Next_Entry: Entry;
		Var D: Integer;

		D := Depth(S);
		While (Is_Not_Zero(D))
			maintaining #S = Reverse(Temp) o S and D = |S|;
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Push(Next_Entry, Temp);
			D := Depth(S);
		end;
		Temp :=: S;
	end Flip;
	
end Obvious_Flipping_Realiz;
