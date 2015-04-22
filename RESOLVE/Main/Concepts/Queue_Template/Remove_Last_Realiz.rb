Realization Remove_Last_Realiz for Remove_Last_Capability of Queue_Template;
	Procedure Remove_Last(updates Q: Queue; replaces E: Entry);
		Var T: Queue;
		Var Len: Integer;

		Dequeue (E, Q);
		Len := Length(Q);
		While (Len /= 0)
			changing Q,T,E,Len;
			maintaining #Q = T o <E> o Q and Len = |Q|;
			decreasing |Q|;
		do
			Enqueue(E,T);
			Dequeue(E,Q);
			Len := Length(Q);
		end;
		Q :=: T;
	end Remove_Last;
end Remove_Last_Realiz;