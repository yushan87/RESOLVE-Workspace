Realization Stack_Based_Realiz for Globally_Bounded_List_Template;

    Facility SF is Globally_Bounded_Stack_Template(Entry)
            realized by Array_Realiz;

    Type List is represented by Record
			Left: SF.Stack;
			Right: SF.Stack;
		end;
	end;

	Procedure Advance( upd P: List );

	end Advance;

	Procedure Reset( upd P: List );

	end Reset;

	Procedure Length_of_Rem( rest P: List ): Integer;

	end Length_of_Rem;

	Procedure Insert( clr New_Entry: Entry; upd P: List );

	end Insert;

	Procedure Rmng_Capacity(): Integer;

	end;

	Procedure Remove( rpl Entry_Removed: Entry; upd P: List );

	end;

	Procedure Advance_to_End( upd P: List );

	end;

	Procedure Swap_Remainders( upd P, Q: List );

	end;

	Procedure Swap_Prev_Entry_w( upd E: Entry; upd P: List );

	end;

	Procedure Length_of_Prec( rest P: List ): Integer;

	end;

	Procedure Clear_List( clr P: List );

	end;
	
	Procedure Is_Prec_Empty( rest P: List ): Boolean;
	
	end;		
	
	Procedure Is_Rem_Empty( rest P: List ): Boolean;
	
	end;

	Procedure Clear( clr P: List );
	
	end;

end Stack_Based_Realiz;