Realization Remove_Last_Realiz for Remove_Last_Capability of Globally_Bounded_Queue_Template;
	
	Procedure Remove_Last(updates Q: Queue; replaces E: Entry);
		Var T: Queue;
		Var Empty: Boolean;

		Dequeue (E, Q);
		Empty := Is_Empty(Q);
		While ( Not(Empty) )
			changing Q,T,E,Empty;
			maintaining #Q = T o <E> o Q and
						Empty = (Q = Empty_String);
			decreasing |Q|;
		do
			Enqueue(E,T);
			Dequeue(E,Q);
			Empty := Is_Empty(Q);
		end;
		Q :=: T;
	end Remove_Last;
end Remove_Last_Realiz;