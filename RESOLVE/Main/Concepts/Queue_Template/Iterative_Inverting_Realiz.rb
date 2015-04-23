Realization Iterative_Inverting_Realiz for Inverting_Capability of Queue_Template;

	Facility SF is Stack_Template(Entry, Max_Length)
		realized by Array_Realiz;

	Procedure Invert (updates Q: Queue);
		Var S: SF.Stack;
		Var Next_Entry: Entry;
		Var Len, Dep: Integer;

		Len := Length(Q);
		While ( Less_Or_Equal(1, Len) )
			maintaining Reverse(Q) o S = Reverse(#Q) and Len = |Q|;
			decreasing |Q|;
		do
			Dequeue(Next_Entry, Q);
			Push(Next_Entry, S);
			Len := Length(Q);
		end;

		Dep := Depth(S);
		While ( Less_Or_Equal(1, S) )
			maintaining Q o S = Reverse(#Q) and Dep = |S|;
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Enqueue(Next_Entry, Q);
			Dep := Depth(S);
		end;
	end Invert;
end Iterative_Inverting_Realiz;