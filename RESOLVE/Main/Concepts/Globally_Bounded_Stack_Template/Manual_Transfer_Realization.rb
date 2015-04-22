Realization Manual_Transfer_Realization for Transfer_Capability of 
		Globally_Bounded_Stack_Template;

	Procedure Transfer(clears   Source      : Stack;
	                   replaces Destination : Stack);
		Var Workaround_Stack : Stack;
		Var Source_Reversed: Stack;
		Var Next_Entry: Entry;
		Var Empty: Boolean;

		Empty := Is_Empty(Source);
		While ( Not(Empty) )
			changing Source, Source_Reversed, Next_Entry, Empty;
			maintaining #Source = Reverse(Source_Reversed) o Source;
			decreasing |Source|;
		do
			Pop(Next_Entry, Source);
			Push(Next_Entry, Source_Reversed);
			Empty := Is_Empty(Source);
		end;
		
		Empty := Is_Empty(Source_Reversed);
		While ( Not(Empty) )
			changing Destination, Source_Reversed, Next_Entry, Empty;
			maintaining #Source = 
				Reverse(Source_Reversed) o Destination;
			decreasing |Source_Reversed|;
		do
			Pop(Next_Entry, Source_Reversed);
			Push(Next_Entry, Destination);
			Empty := Is_Empty(Source_Reversed);
		end;
	end Transfer;
end Manual_Transfer_Realization;
