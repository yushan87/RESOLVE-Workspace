Realization Folding_Average_Realization(
			Operation MapEntry(restores e : Entry) : Integer;
				ensures MapEntry = AsInteger(e);) 
		for Averaging_Capability of Queue_Template;

	Procedure Average(restores Q : Queue) : Integer;
		Var Included : Queue;
		Var CurEntry : Entry;
		Var CurEntryAsInteger : Integer;
		Var RunningTotal : Integer;

		RunningTotal := 0;

		While (Length(Q) > 0)
			changing Q, Included, CurEntry, CurEntryAsInteger;
			maintaining #Q = Included o Q and
				RunningTotal = Fold_String_Right(
					Sum, 0, Map(Included, AsInteger));
			decreasing |Q|;
		do
			Dequeue(CurEntry, Q);
			CurEntryAsInteger := MapEntry(CurEntry);
			RunningTotal := RunningTotal + CurEntryAsInteger;
			Enqueue(CurEntry, Included);
		end;

		Q :=: Included;

		Average := RunningTotal / Length(Q);

	end Average;

end Folding_Average_Realization;
