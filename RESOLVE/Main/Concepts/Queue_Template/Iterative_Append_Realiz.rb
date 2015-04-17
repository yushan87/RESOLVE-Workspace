Realization Iterative_Append_Realiz for Append_Capability of Queue_Template;
    -- will not verify because loop invariant is adequate
    Procedure Append(updates P: Queue; clears Q: Queue);
        Var E: Entry;
        Var Len: Integer;
        Len := Length(Q);
        While ( Is_Not_Zero(Len) )
          -- fill in a suitable invariant
          maintaining true;
          decreasing |Q|;
        do
          Dequeue(E,Q);
          Enqueue(E,P);
          Len := Length(Q);
        end;
    end Append;
end Iterative_Append_Realiz;