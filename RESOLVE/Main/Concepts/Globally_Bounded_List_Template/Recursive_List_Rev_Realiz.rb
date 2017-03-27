Realization Recursive_List_Rev_Realiz for List_Reversal_Capability of Globally_Bounded_List_Template;

    Recursive Procedure Reverse_List(updates L: List);
        decreasing |L.Rem|;

        Var E: Entry;
        
        If ( not Is_Rem_Empty(L) ) then
            Remove (E, L);
            Reverse_List(L);
            Insert(E, L);
            Advance(L);
        end;
    end Reverse_List;

end Recursive_List_Rev_Realiz;