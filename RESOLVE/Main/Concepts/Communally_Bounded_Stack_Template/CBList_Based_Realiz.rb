Realization CBList_Based_Realiz for Communally_Bounded_Stack_Template;
	uses String_Theory;
	
	Facility CB_List_Fac is Communally_Bounded_List_Template(Entry, Max_Capacity)
		realized by UVRT_List_Realiz;
		
	Shared Variables
		correspondence
			depending_on CB_List_Fac::Total_Size;
			Conc.Total_Size = CB_List_Fac::Total_Size;
	end Shared Variables;
	
	Type Stack = CB_List_Fac::List;
		convention 
			S.Prec = Empty_String;
		correspondence 
			Conc.S = S.Rem;
		finalization
			affects CB_List_Fac::Total_Size;
			ensures CB_List_Fac::Total_Size = #CB_List_Fac::Total_Size - |#S|;
		end;
	end;
    
	Procedure Push(alters E: Entry; updates S: Stack);
		affects CB_List_Fac::Total_Size;
		ensures CB_List_Fac::Total_Size = #CB_List_Fac::Total_Size + 1;
    	
		Insert(E, S);
	end;

	Procedure Pop(replaces R: Entry; updates S: Stack);
		affects CB_List_Fac::Total_Size;
		ensures CB_List_Fac::Total_Size = #CB_List_Fac::Total_Size - 1;
		    	
		Remove(R, S);
	end;

	Procedure Is_Empty(restores S : Stack) : Boolean;
		Is_Empty := Is_Rem_Empty(S);
	end;

	Procedure Occupied_Size(): Integer;
		Occupied_Size := CB_List_Fac::Occupied_Size();
	end Occupied_Size;

	Procedure Clear(clears S: Stack);
		affects CB_List_Fac::Total_Size;
		ensures CB_List_Fac::Total_Size = #CB_List_Fac::Total_Size - |#S|;

		CB_List_Fac::Clear(S);
	end;
	
end CBList_Based_Realiz;