Realization Skeleton_Realiz for Preemptable_Queue_Template;
	
	Type P_Queue = Record 
			Dummy1: Integer;
			Dummy2: Integer;      
		end;
		correspondence true;
	end;
    
	Procedure Enqueue(alters E: Entry; updates Q: P_Queue);
	end Enqueue;

	Procedure Inject(alters E: Entry; updates Q: P_Queue);
	end Inject;

	Procedure Dequeue(replaces R: Entry; updates Q: P_Queue);
	end Dequeue;
 
	Procedure Swap_Last_Entry(updates E: Entry; updates Q: P_Queue);
	end Swap_Last_Entry;
 
	Procedure Length(restores Q: P_Queue): Integer;
	end Length;
	
	Procedure Rem_Capacity(restores Q: P_Queue): Integer;
	end Rem_Capacity;
    
	Procedure Clear(clears Q: P_Queue);
	end Clear;

end Skeleton_Realiz;