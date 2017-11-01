Realization Recursive_Append_Realiz for Append_Capability of Queue_Template;
	-- Activity 1:
	-- Attempt to verify this code and note that it verifies
	-- Explain VCs corresponding to decreasing clause and the recursive call

	-- Activity 2:
	-- Comment out calls to Dequeue and Enqueue and attempt to verify. What fails and why?
	-- Will the code work if you ran it?

	-- Activity 3:
	-- Uncomment the above. Change dreceasing clause to |P| and attempt to verify. What fails and why?
	-- Will the code work if you ran it?

	-- More activities
	-- Make other changes and explore

	-- The key words Recursive Procedure and a decreasing clause are needed for recursive implementations
	Recursive Procedure Append(updates P: Queue; clears Q: Queue);
		decreasing |Q|;		-- This is the progress metric used in verification to prove termination

		Var E: Entry;
		
		If ( 1 <= Length(Q) ) then
			Dequeue(E,Q);
			Enqueue(E,P);
			Append(P,Q);
		end;
	end Append;
end Recursive_Append_Realiz;