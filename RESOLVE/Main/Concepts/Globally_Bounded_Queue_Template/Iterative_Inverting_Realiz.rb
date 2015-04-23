Realization Iterative_Inverting_Realiz for Inverting_Capability of Globally_Bounded_Queue_Template;

	Facility SF is Globally_Bounded_Stack_Template(Entry)
		realized by Skeleton_Realiz;

	Procedure Invert (updates Q: Queue);
		Var S: SF.Stack;
		Var Next_Entry: Entry;
		Var Empty: Boolean;

		Empty := Is_Empty(Q);
		While ( Not(Empty) )
			maintaining Reverse(Q) o S = Reverse(#Q) and
						Empty = (Q = Empty_String);
			decreasing |Q|;
		do
			Dequeue(Next_Entry, Q);
			Push(Next_Entry, S);
			Empty := Is_Empty(Q);
		end;

		Empty := Is_Empty(S);
		While ( Not(Empty) )
			maintaining Q o S = Reverse(#Q) and
						Empty = (S = Empty_String);
			decreasing |S|;
		do
			Pop(Next_Entry, S);
			Enqueue(Next_Entry, Q);
			Empty := Is_Empty(S);
		end;
	end Invert;
end Iterative_Inverting_Realiz;