Theory Binary_Iterator_Theory;
		uses Integer_Theory, Modified_String_Theory;

	Definition Iterative_Apply(Start : (R : MType), 
		Value_Function : N -> (V : MType), 
		Value_Count : N, Step : (R * V) -> R) : R;

	Definition Concatenate(Value_Function : N -> (V : MType), Value_Count : N) : 
		Str(V);

end;
