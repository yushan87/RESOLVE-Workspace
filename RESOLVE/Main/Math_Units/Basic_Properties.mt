Precis Basic_Properties;
	uses Boolean_Theory;

Definition Is_Bijective(f : (D : SSet) -> (R : SSet)) : B;
Definition Is_Associative(f : (D : SSet) -> (R : SSet)) : B;
Definition Is_Commutative(f : (D : SSet) * D -> D) : B = 
	For all x, y : D,
		f(x, y) = f(y, x);
Definition Is_Right_Cancelative(f : (D : SSet) -> (R : SSet)) : B;
Definition Is_Total_Ordering(f : (D : SSet) -> (R : SSet)) : B;

Definition Is_Preserved_by(f : (D : SSet) -> (R : SSet), g : D -> B) : B;

Definition Is_Right_Identity_for(f : (D : SSet) * D -> D, i : D) : B;
Definition Is_Left_Identity_for(f : (D : SSet) * D -> D, i : D) : B;
Definition Is_Identity_for(f : (D : SSet) * D -> D, i : D) : B;
Definition Is_Factorable_for(f : (D : SSet) * D -> D, i : D) : B;

Definition Is_Homomorphism_for(f : (D : SSet) * D -> D, g : D -> D) : B;
Definition Is_Inverse_for(f : (D : SSet) * D -> D, g : D -> D) : B;

Definition Is_Monoid(D : SSet, i : D, f : D * D -> D) : B;
Definition Is_Abelian_Monoid(D : SSet, i : D, f : D * D -> D) : B;
Definition Is_Abelian_Group(D : SSet, i : D, f : D * D -> D, g : D -> D) : B;

-----------------------------------------------------------------------------------------
Definition Is_Transitive(f : (D : SSet) * D -> B) : B;
Theorem Is_Transitive_def:
	--For all D:SSet,
	--For all f:(D * D)->B,
	--For all x,y,z:D,
	For all f:(Entity*Entity)->B,
	For all x,y,z:Entity,
		(Is_Transitive(f) and f(x,y) and f(y,z)) implies f(x,z);
		
Definition Is_Total(f : (D : SSet) * D -> B) : B;
Theorem Is_Total_def:
	--For all D:SSet,
	--For all f:(D * D)->B,
	--For all x,y:D,
	For all f:(Entity*Entity)->B,
	For all x,y:Entity,
	For all p,q:B,
		(Is_Total(f) and f(x,y) = p and f(y,x) = q) implies (p or q);

Definition Is_Reflexive(f : (D : SSet) * D -> B) : B;
Theorem Is_Reflexive_def:
	For all f:(Entity*Entity)->B,
	For all x:Entity,
	For all b:B,
		Is_Reflexive(f) and f(x,x) = b implies b;
		
Definition Is_Antisymmetric(f : (D : SSet) * D -> B) : B;
Theorem Is_Antisymmetric_def:
	--For all D:SSet,
	--For all f:(D * D)->B,
	--For all x,y:D,
	For all f:(Entity*Entity)->B,
	For all x,y:Entity,
		(Is_Antisymmetric(f) and f(x,y) and f(y,x)) implies x = y;
		
end Basic_Properties;