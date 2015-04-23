Realization Recursive_Inverting_Realiz for Inverting_Capability of Queue_Template;
    Recursive Procedure Invert(updates Q: Queue);
        decreasing |Q|;

        Var E: Entry;
        Var Len: Integer;

        Len := Length(Q);
        If ( Less_Or_Equal(1, Len) ) then
            Dequeue(E, Q);
            Invert(Q);
            Enqueue(E, Q);
        end;
    end Invert;
end Recursive_Inverting_Realiz;