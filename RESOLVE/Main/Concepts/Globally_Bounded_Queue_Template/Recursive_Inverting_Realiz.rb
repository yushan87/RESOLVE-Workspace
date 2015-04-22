Realization Recursive_Inverting_Realiz for Inverting_Capability of Globally_Bounded_Queue_Template;

	Recursive Procedure Invert(updates Q: Queue);
		decreasing |Q|;

		Var E: Entry;
		Var Empty: Boolean;
		
		Empty := Is_Empty(Q);
		If ( Not(Empty) ) then
			Dequeue(E, Q);
			Invert(Q);
			Enqueue(E, Q);
		end;
	end Invert;
end Recursive_Inverting_Realiz;