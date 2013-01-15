Realization Recursive_Add_Realiz for Add_Capability of Integer_Template;
	uses Std_Boolean_Fac;

	Recursive Procedure Add(updates i: Integer; restores j: Integer);
		decreasing |j|;
		Var z:Integer;
      	If j > z then
        	  	Increment(i);
          		Decrement(j);
          		Add(i, j);
         	 	Increment(j);
      	else
          		If z > j then
              		Decrement(i);
              		Increment(j);
              		Add(i, j);
              		Decrement(j);
          		end;
      	end;
	end Add;
end Recursive_Add_Realiz;
