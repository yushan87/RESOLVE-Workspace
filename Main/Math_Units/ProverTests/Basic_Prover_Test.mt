
Theory Basic_Prover_Test;

	(* Some basic theory to operate on, borrowed from Integer_Theory. *)
	Math Type ZZ: SSet;

	Definition (i : ZZ) = (j : ZZ) : B;
	Definition (i : ZZ) + (j : ZZ) : ZZ;
	Definition (i : ZZ) - (j : ZZ) : ZZ;
	Definition (i : ZZ) < (j : ZZ) : B;

	Definition Zero : ZZ;
	Definition One  : ZZ;



	(* Axioms, which the prover will assume and use to prove theorems. *)
	Axiom Cancel: For all i, j, k : ZZ, (i + k) + (j - k) = (i + j);
	Axiom Identity: For all i : ZZ, (i + Zero) = i;
	Axiom Transitivity_Of_Less_Than: For all i, j, k : ZZ,
		((i < j) and (j < k)) implies (i < k);
	Axiom One_Bigger_Than_Zero: Zero < One;
	Axiom Add_Positive_Under_Less_Than: For all i, j, k : ZZ,
		(i < j) and (Zero < k) implies (i < j + k);


	(* Theorems, which the prover will attempt to prove. *)
	Theorem Simple_Substitution_Test: For all a, b, c : ZZ,
		(a + (c + Zero)) + (b - c) = (a + b) + Zero;

	Theorem Theory_Development_Test: For all a, b, c : ZZ,
		(b < c) and (a < b) implies (a < c + Zero);

	Theorem Existential_Instantiation_Test: For all a, b, c, d : ZZ,
		(a < b) implies (a < b + One);
end;
