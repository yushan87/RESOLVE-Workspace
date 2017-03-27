Realization Iterative_Searching_Realiz(
        Operation Compare_Entry(restores E, F: Entry) : Boolean;
            ensures Compare_Entry = ( E = F );
    ) for Searching_Capability of Globally_Bounded_List_Template;

    Operation Is_Present_In_Rem (restores E: Entry; restores L: List): Boolean;
        requires L.Prec = Empty_String;
        ensures Is_Present_In_Rem = ( Is_Substring(<E>, L.Rem) );
    Procedure
        Var Next_Entry: Entry;

        Is_Present_In_Rem := False();
        While ( not Is_Rem_Empty(L) )
			changing L, Next_Entry;
            maintaining L.Prec o L.Rem = #L.Rem and Is_Present_In_Rem = Is_Substring(<E>, L.Prec);
            decreasing |L.Rem|;
        do
            Remove(Next_Entry, L);
            If ( Compare_Entry(Next_Entry, E) ) then
                Is_Present_In_Rem := True();
                Insert(Next_Entry, L);
                Advance_to_End(L);
            else
                Insert(Next_Entry, L);
                Advance(L);
            end;
        end;

        Reset(L);
    end;

    Procedure Contains (restores E: Entry; restores L: List): Boolean;
        Var Temp_Rem_List: List;
        Contains := False();
        
        -- Store L.Rem in a temporary list
        Swap_Remainders(L, Temp_Rem_List);
        Contains := Is_Present_In_Rem(E, Temp_Rem_List);

        -- If not found, check L.Prec
        If ( not Contains ) then
            Reset(L);
            Contains := Is_Present_In_Rem(E, L);
            Advance_to_End(L);
        end;

        -- Restore the list
        Swap_Remainders(L, Temp_Rem_List);        
    end Contains;

end Iterative_Searching_Realiz;