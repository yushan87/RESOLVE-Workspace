Realization Obvious_Reading_Realiz (Operation Read_Entry(replaces E: Entry);)
		for Reading_Capability of Stack_Template;

	Procedure Read_upto(replaces S: Stack; preserves Count: Integer);
		Var Next_Entry: Entry;
		Var D: Integer;

		Clear(S);
		D := Depth(S);
		While (D < Count)
			changing S, Next_Entry, D;
			maintaining |S| <= Count and D = |S|;
			decreasing (Count - |S|);
		do
			Read_Entry(Next_Entry);
			Push(Next_Entry, S);
			D := Depth(S);
		end;
	end Read_upto;

	Procedure Read(replaces S: Stack);
		Read_upto(S, Max_Depth);
	end Read;
end Obvious_Reading_Realiz;