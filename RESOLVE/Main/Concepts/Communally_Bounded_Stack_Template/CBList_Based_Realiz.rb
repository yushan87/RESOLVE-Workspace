Realization CBList_Based_Realiz for Communally_Bounded_Stack_Template;
	uses String_Theory;
	
	Facility GB_List_Fac is Communally_Bounded_List_Template(Entry, Max_Capacity)
		realized by List_Skeleton_Realiz;
		
	Shared Variables
		correspondence
			Conc.Total_Size = ||GB_List_Fac::Total_Size||;
	end Shared Variables;
	
	Type Stack = CB_List_Fac.List;
        convention 
        	S.Prec = Empty_String;
        correspondence 
        	Conc.S = S.Rem;
    end;
    
    Procedure Push(alters E: Entry; updates S: Stack);
        Insert(E, S);
    end;

    Procedure Pop(replaces R: Entry; updates S: Stack);
        Remove(R, S);
	end;

    Procedure Is_Empty(restores S : Stack) : Boolean;
        Is_Empty := Is_Rem_Empty(S);
    end;

	Procedure Rem_Capacity(): Integer;
		Rem_Capacity := Max_Capacity - Occupied_Size();
	end Rem_Capacity;

	Procedure Clear(clears S: Stack);
        Clear(S);
    end;
	
end CBList_Based_Realiz;