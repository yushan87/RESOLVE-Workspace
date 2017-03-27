Precis Monogenerator_Theory;
	uses Basic_Properties;

Definition Is_Injective(D: SSet, f: D -> D): B;

-- YS: Not complete. Need to add the 3rd property!
Definition Is_Monogeneric_for(D : SSet, b : D, g : D -> D) : B =
	For all x : D,
		g(x) /= b and Is_Injective(D, g);

Theorem M1:
	For all D : SSet,
	For all b : D,
	For all g : D -> D,
		Is_Monogeneric_for(D, b, g) implies
			(For all T, U : SSet,
			For all f : T -> U,
			For all s : T * U * D -> U,
			For all p : T * D -> T,
				There exists unique i : T * D -> U,
					For all t : T,
						(i(t, b) = f(t)) and
						(For all x : D,
							i(t, g(x)) = s(t, i(p(t, x), x), x)));


Theorem M2:
	For all D1, D2 : SSet,
	For all b1 : D1,
	For all b2 : D2,
	For all g1 : D1 -> D1,
	For all g2 : D2 -> D2,
		(Is_Monogeneric_for(D1, b1, g1) and Is_Monogeneric_for(D2, b2, g2)) implies
			(not(There exists h : D1 -> D2,
				(h(b1) = b2) and (For all x : D1,
					h(g1(x)) = g2(h(x)) and Is_Bijective(h))));


--Temporary fix for conditional functions
Definition conditional(cond : B, a : Entity, b : Entity) : Entity;

end Monogenerator_Theory;