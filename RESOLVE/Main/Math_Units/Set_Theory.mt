Precis Set_Theory;
    uses Natural_Number_Theory;

    Definition Card: SSet;
    Definition ||(S:SSet)||: Card;
    Definition FinPowerset(S: SSet): SSet;

	Type Theorem Fin_0:
		For all S: SSet,
		For all T: FinPowerset(S),
			T: SSet;

	Type Theorem Fin_1:
		For all S: SSet,
		For all T: FinPowerset(S),
			T: Powerset(S);

	Type Theorem Card_1:
		For all S: SSet,
		For all T: FinPowerset(S),
			||T||: N;

	Definition Empty_Set: SSet; -- {}
       
	Type Theorem Powerset_1:
		For all S: SSet,
		For all T: Powerset(S),
			T: SSet;

	Definition (S: SSet) union (T: SSet): SSet;
    Definition (S: SSet) intersection (T: SSet): SSet = Empty_Set;
    Definition (e: Entity) is_in (S: SSet): B;
    Definition (e: Entity) is_not_in (s: SSet): B; -- = not (e is_in s);
    Definition complement (S: SSet): SSet;
    Definition (S: SSet) without (T: SSet): SSet;
    Definition (S: SSet) is_subset_of (T: SSet): B;
    Definition (S: SSet) is_not_subset_of (T: SSet): B;
    Definition (S: SSet) is_proper_subset_of (T: SSet): B;
    Definition (S: SSet) is_not_proper_subset_of (T: SSet): B;
    Definition Singleton(e: Entity): SSet;   -- {(e: Entity)}

	Corollary Union_1_a: -- Is_Identity_for(union, Empty_Set);
		For all S: SSet,
			Empty_Set union S = S;

	Corollary Union_1_b: -- Is_Identity_for(o, Empty_String);
		For all S: SSet,
			S union Empty_Set = S;

	Corollary Concatenation_2: -- Is_Associative(union);
		For all S, T, U: SSet,
			S union (T union U) = (S union T) union U;

end Set_Theory;