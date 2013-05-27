Realization Manual_Transfer_Realization for UST_Transfer_Capability of 
		Globally_Bounded_Stack_Template;

	Definition D : Z = Sum i : Z where i > 0 and i < 10, i;

	Procedure Transfer(clears   Source      : Stack;
	                   replaces Destination : Stack);
		Var Workaround_Stack : Stack;
		Var Source_Reversed: Stack;
		Var Next_Entry: Entry;

		While (not Is_Empty(Source))
			changing Source, Source_Reversed, Next_Entry;
			maintaining #Source = Reverse(Source_Reversed) o Source;
		do
			Pop(Next_Entry, Source);
			Push(Next_Entry, Source_Reversed);
		end;

		Destination :=: Workaround_Stack;
		(* Clear(Destination); *)   (* VC does not reflect this! *)
		While (not Is_Empty(Source_Reversed))
			changing Destination, Source_Reversed, Next_Entry;
			maintaining #Source = 
				Reverse(Source_Reversed) o Destination;
		do
			Pop(Next_Entry, Source_Reversed);
			Push(Next_Entry, Destination);
		end;
	end Transfer;
end Manual_Transfer_Realization;
