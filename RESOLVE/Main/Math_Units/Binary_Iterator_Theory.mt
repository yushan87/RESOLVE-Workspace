Theory Binary_Iterator_Theory;
		uses Integer_Theory, String_Theory;

	Definition Iterative_Apply(Start : (R : MType), 
		Value_Function : Z -> (V : MType), 
		Value_Count : Z, Step : (R * V) -> R) : R;

	Definition Concatenate(Value_Function : Z -> (V : MType), Value_Count : Z) : 
		Str(V);

end;
