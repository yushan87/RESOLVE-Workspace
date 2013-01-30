Realization Example_Realiz for Example_Capability of Integer_Template;
	uses Std_Boolean_Fac;

	Procedure Example(updates I: Integer);
		Var Two, J, K: Integer;

		Increment(Two);
		Increment(Two);

		J := Div(I, Two);
		I := Product(J, Two);
	end Example;
end Example_Realiz;
