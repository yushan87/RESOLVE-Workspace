Realization Iterative_List_Rev_Realiz for List_Reversal_Capability 
        of Globally_Bounded_List_Template;

    Procedure Reverse_List(updates L: List);
        Var Temp_List: List;
        Var Next_Entry: Entry;

		While ( not Is_Rem_Empty(L) )
            changing Temp_List, L, Next_Entry;
			maintaining Temp_List.Prec = #Temp_List.Prec and
                        Reverse(Temp_List.Rem) o L.Rem = #L.Rem;
			decreasing |L.Rem|;
		do
			Remove(Next_Entry, L);
			Insert(Next_Entry, Temp_List);
		end;
        Advance_to_End(Temp_List);

        L :=: Temp_List;
	end Reverse_List;

end Iterative_List_Rev_Realiz;