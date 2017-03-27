Realization Recursive_Searching_Realiz(
        Operation Compare_Entry(restores E, F: Entry) : Boolean;
            ensures Compare_Entry = ( E = F );
    ) for Searching_Capability of Globally_Bounded_List_Template;

    Operation Is_Present_In_Rem (restores E: Entry; restores L: List): Boolean;
        requires L.Prec = Empty_String;
        ensures Is_Present_In_Rem = ( Is_Substring(<E>, L.Rem) );
    Recursive Procedure
        decreasing |L.Rem|;

        Var Next_Entry: Entry;

        Is_Present_In_Rem := False();
        If ( not Is_Rem_Empty(L) ) then
            Remove(Next_Entry, L);

            If ( not Is_Present_In_Rem(E, L) ) then
                Is_Present_In_Rem := Compare_Entry(E, Next_Entry);
            else
                Is_Present_In_Rem := True();
            end;

            Insert(Next_Entry, L);
        end;
            
    end Is_Present_In_Rem;

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

end Recursive_Searching_Realiz;