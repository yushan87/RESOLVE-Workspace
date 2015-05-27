Realization Inject_Front_Realiz for Inject_Front_Capability of Queue_Template;

	Procedure Inject_at_Front(alters E: Entry; updates Q: Queue);
		Var T: Queue;
		Var Len: Integer;
		
		Enqueue (E, T);
		Len := Length(Q);
		While ( 1 <= Len )
			changing Q,T,E,Len;
			maintaining T o Q = <#E> o #Q and Len = |Q|;
			decreasing |Q|;
		do
			Dequeue(E,Q);
			Enqueue(E,T);
			Len := Length(Q);
		end;
		Q :=: T;
	end Inject_at_Front;
end Inject_Front_Realiz;