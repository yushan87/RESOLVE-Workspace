Realization Obvious_CC_Realiz
(
	Operation Copy_Entry(replaces Copy: Entry; restores Orig: Entry);
		ensures Copy = Orig;
)
for Copying_Capability of Stack_Template;

	Procedure Copy_Stack(replaces S_Copy: Stack; restores S_Orig: Stack);
		Var Next_Entry, Entry_Copy: Entry;
		Var S_Reversed: Stack;
		Var D: Integer;

		D := Depth(S_Orig);
		While (Is_Not_Zero(D))
			changing Next_Entry, S_Orig, S_Reversed;
			maintaining #S_Orig = Reverse(S_Reversed) o S_Orig and
						D = |S_Orig|;
			decreasing |S_Orig|;
		do
			Pop(Next_Entry, S_Orig);
			Push(Next_Entry, S_Reversed);
			D := Depth(S_Orig);
		end;
		
		Clear(S_Copy);
		
		D := Depth(S_Reversed);
		While (Is_Not_Zero(D))
			changing Entry_Copy, Next_Entry, S_Copy, S_Orig, S_Reversed;
			maintaining S_Copy = S_Orig and
						#S_Orig = Reverse(S_Reversed) o S_Orig and
						D = |S_Reversed|;
			decreasing |S_Reversed|;
		do
			Pop(Next_Entry, S_Reversed);
			Copy_Entry(Entry_Copy, Next_Entry);
			Push(Next_Entry, S_Orig);
			Push(Entry_Copy, S_Copy);
			D := Depth(S_Reversed);
		end;
    end Copy_Stack;

end Obvious_CC_Realiz;