Realization Sequence_Array_Realiz for Sequence_Template;
	uses Binary_Iterator_Theory;

	Type Sequence = Record 
			Contents: Array 0..Max_Length-1 of Entry;
			Length: Integer;      
		end;
		convention 
			0 <= S.Length <= Max_Length; 
		correspondence 
			Conc.S = Concatenate(S.Contents, S.Length);
    end;

	Procedure Insert_after(evaluates Pos: Integer; alters E: Entry; updates S: Sequence);
		Var i: Integer;

		i := S.Length;
		S.Contents[i] :=: E;
		S.Length := S.Length + 1;

		While i > Pos 
            changing i, S;
			maintaining true;
			decreasing i;
		do
			S.Contents[i] :=: S.Contents[i - 1];
			i := i - 1;
		end;
	end Insert_after;
 
	Procedure Remove_after(evaluates Pos: Integer; replaces R: Entry; updates S: Sequence);
		Var i: Integer;
		
		R :=: S.Contents[Pos];
		i := Pos;
        
		While i < S.Length
			changing i, S;
			maintaining true;
			decreasing S.Length - i;
		do
			S.Contents[i] :=: S.Contents[i + 1];
			i := i + 1;
		end;
		S.Length := S.Length - 1;        
    end Remove_after;

	Procedure Length(restores S: Sequence): Integer;
		Length := S.Length;
	end Length;
 
	Procedure Rem_Capacity(restores S: Sequence): Integer;
		Rem_Capacity := Max_Length - S.Length;
	end Rem_Capacity;
 
	Procedure Clear(clears S: Sequence);
		S.Length := 0;
	end Clear;
 
end Sequence_Array_Realiz;