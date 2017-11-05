Realization UVRT_Stack_Realiz for Communally_Bounded_Stack_Template;
	uses Set_Theory;
	
	Facility UVRT_Fac is Communal_UVR_Template(Entry, Max_Capacity)
		realized by Communal_Array_Realiz;
		
	Shared Variables
		correspondence
			depending_on UVRT::Accessible_Loc;
			Conc.Total_Size = ||UVRT_Fac::Accessible_Loc||;
	end Shared Variables;
	
	Type Stack = UVRT_Fac::Pos;
		convention ...;
		correspondence
			depending_on UVRT_Fac::Ref, UVRT_Fac::Content;
			Conc.S = Iterated_Concatenation(i = 1..
					||Closure_for(Location, Ref, {S})|| - 1) <Contents(Ref^{i-1}(S))>;
		finalization
			affects UVRT_Fac::Accessible_Loc, UVRT_Fac::Ref, UVRT_Fac::Content;
			ensures #Accessible_Loc = Accessible_Loc union 
			                Closure_for(Location, {#Ref}, #S);
			        Ref[Closure_for(Location, {#Ref}, #S)] = {Void} and 
			        Info.Is_Initial[#Content[Closure_for(Location, {#Ref}, #S)]] = 
			                {true};
		
			Set_to_Void(S); -- Let UVRT take care of finalization
		end;
	end;
	
	Procedure Push(alters E: Entry; updates S: Stack);
		affects UVRT_Fac::Accessible_Loc, UVRT_Fac::Ref, UVRT_Fac::Content;
		ensures Accessible_Loc = #Accessible_Loc union {S} and
				Fn_Restricted_to(Ref, #Accessible_Loc) = 
					Fn_Restricted_to(#Ref, #Accessible_Loc) and
				Ref(S) = #S and 
				Fn_Restricted_to(Content, #Accessible_Loc) = 
					Fn_Restricted_to(#Content, #Accessible_Loc)] and
				Contents(S) = #E;
		
		Var New_Pos: Pos;
		
		Give_New_Loc(New_Pos);
		Swap_Content_of(New_Pos, E);
		Redirect_Ref_at(New_Pos, S);
		Relocate_to(S, New_Pos);
	end Push;

	Procedure Pop(replaces R: Entry; updates S: Stack);
		affects UVRT_Fac::Accessible_Loc, UVRT_Fac::Ref, UVRT_Fac::Content;
		ensures Accessible_Loc = #Accessible_Loc ~ {S} and
				Fn_Restricted_to(Ref, Accessible_Loc) = 
					Fn_Restricted_to(#Ref, Accessible_Loc) and
				S = #Ref(#S) and 
				Fn_Restricted_to(Content, Accessible_Loc) = 
					Fn_Restricted_to(#Content, Accessible_Loc) and
				R = #Contents(#S);
		
		Swap_Content_of(S, R);
		Follow_Ref(S); -- Let UVRT take care of finalization
	end Pop;
		
	Procedure Is_Empty(restores S : Stack) : Boolean;
		Is_Empty := Is_Void(S);
	end Is_Empty;

	Procedure Occupied_Size(): Integer;
		Occupied_Size := UVRT_Fac::Occupied_Size();
	end Occupied_Size;

	Procedure Clear(clears S: Stack);
		affects UVRT_Fac::Accessible_Loc, UVRT_Fac::Ref, UVRT_Fac::Content;
		ensures Accessible_Loc = #Accessible_Loc ~ 
					Closure_for(Location, {#Ref}, #S) and
			    Fn_Restricted_to(Ref, Accessible_Loc) = 
					Fn_Restricted_to(#Ref, Accessible_Loc) and
			    Ref[Closure_for(Location, {#Ref}, #S)] = {Void} and
			    Fn_Restricted_to(Content, Accessible_Loc) = 
					Fn_Restricted_to(#Content, Accessible_Loc)] and
			    Info.Is_Initial[Content[Closure_for(Location, {#Ref}, #S)]] = {true};
		
		Set_to_Void(S); -- Let UVRT take care of finalization
	end Clear;
	
end UVRT_Stack_Realiz;