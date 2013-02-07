

Theory Multi_Set_Theory;
		uses Boolean_Theory, Set_Theory, Integer_Theory, 
			String_Theory;

	Local Math Type Gamma;
	Math Type MultiSet: SSet -> SSet;

	(* The empty multiset. *)
	Definition empty_set: MultiSet(Gamma);

	(* ElementToMultiSet takes an x and turns it into a MultiSet containing
         * exactly one x and nothing else. *)
	Definition ElementToMultiSet(x : Gamma) : MultiSet(Gamma);

	(* StringToMultiSet takes s : Str(Gamma) and turns it into  
	 * t : MultiSet(Gamma) such that for all x, 
         * Count(x, t) = Occurs_Ct(x, s). *)
	Definition StringToMultiSet(s : Str(Gamma)) : MultiSet(Gamma);

	(* Union returns the union of the two sets: the new set has a number of
         * each element e equal to the sum of the number of es in each of s and
         * t. *)
	Definition Union(s : MultiSet(Gamma), t : MultiSet(Gamma))
		: MultiSet(Gamma);

	(* |s| returns the number of elements in s. *)
	Definition |(s : MultiSet(Gamma))| : N;

	(* Count returns the number of xs in s. *)
	Definition Count(x : Gamma, s : MultiSet(Gamma)) : N;


end Multi_Set_Theory;
