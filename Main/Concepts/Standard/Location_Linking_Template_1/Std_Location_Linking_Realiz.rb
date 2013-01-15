Realization Std_Location_Linking_Realiz for Location_Linking_Template_1;

	uses Std_Boolean_Fac;

	Type Position is represented by Record
		info: Info;
		target: Position;
	end;

	Procedure Take_New_Location(updates P: Position);
	end;

	Procedure Relocate(updates P: Position; preserves Q: Position);
	end;

	Procedure Follow_Link(updates P: Position);
	end;

	Procedure Relocate_To_Target(updates P: Position; preserves Q: Position);
	end;

	Procedure Redirect_Link(preserves P: Position; updates Q: Position);
	end;

	Procedure Redirect_To_Target(updates P: Position; preserves Q: Position);
	end;

	Procedure Redirect_and_Update(preserves P: Position; updates Q: Position);
	end;

	Procedure Is_At_Void(preserves P: Position): Boolean;
	end;

	Procedure Reset_To_Void(clears P: Position);
	end;

	Procedure Swap_Info(preserves P: Position; updates I: Info);
	end;
	
end Std_Location_Linking_Realiz;