(*
 * This softare is released under the new BSD 2006 license.
 * 
 * Note the new BSD license is equivalent to the MIT License, except for the
 * no-endorsement final clause.
 * 
 * Copyright (c) 2007, Clemson University
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 *   * Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer. 
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution. 
 *   * Neither the name of the Clemson University nor the names of its
 *     contributors may be used to endorse or promote products derived from
 *     this software without specific prior written permission. 
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * This sofware has been developed by past and present members of the
 * Reusable Sofware Research Groups (RSRG) at Clemson University and
 * The Ohio State University.
 *)


Theory String_Theory;
    uses Integer_Theory;

	--The type of all strings of heterogenous type
	Definition SStr : MType;
	Definition Empty_String : SStr;

	--A function that restricts SStr to the type of all strings of some homogenous
	--type
	Definition Str : MType -> MType;

	Type Theorem Empty_String_In_All_Strs:
		For all T : MType,
			Empty_String : Str(T);

	Type Theorem All_Strs_In_SStr:
		For all T : MType,
		For all S : Str(T),
			S : SStr;

	--If R is a subset of T, then Str(R) is a subset of Str(T)
	Type Theorem Str_Subsets:
		For all T : MType,
		For all R : Powerset(T),
		For all s : Str(R),
			s : Str(T);

	--String length
	Definition |(s : SStr)| : N;

	--String concatenation
	--Definition (s : Str(U : MType)) o (t : Str(U)) : Str(U);
	Definition (s : SStr) o (t : SStr) : SStr;

	Type Theorem Concatenation_Preserves_Generic_Type:
		For all T : MType,
		For all U, V : Str(T),
			U o V : Str(T);

	--Definition Reverse(s : Str(U : MType)) : Str(U);

	Definition Reverse(s : SStr) : SStr;

	Type Theorem Reverse_Preserves_Generic_Type:
		For all T : MType,
		For all S : Str(T),
			Reverse(S) : Str(T);

	--Singleton string
	Definition <(e : (U : MType))> : Str(U);

	Definition Is_Permutation(s : Str(U : MType), t : Str(U)) : B;

	--Determines if for every pairing of elements from s and t, the given predicate
	--holds
	Definition Is_Universally_Related(s : Str(U : MType), t : Str(U),
			f : (U * U) -> B) : B;

	Definition Substring(s : Str(U : MType), startInclusive : Z, length : Z) :
		Str(U);

	Definition Element_At(i : Z, s : Str(U : MType)) : U;

	---------------------------------------------------------------
	-- Empty String Theorems                                     --
	---------------------------------------------------------------
	Theorem Reverse_Empty_String:
		Reverse(Empty_String) = Empty_String;

	Theorem Empty_String_Concatenation_Right:
		For all S : SStr,
			S o Empty_String = S;

	Theorem Empty_String_Concatenation_Left:
		For all S : SStr,
			Empty_String o S = S;

	---------------------------------------------------------------
	-- String Length Theorems                                    --
	---------------------------------------------------------------
	Theorem Same_String_Same_Length:
		For all S, T : SStr,
			S = T implies |S| = |T|;

	Theorem String_Length_Boundary:
		For all S, T : SStr,
		For all i : Z,
			|S o T| <= i implies
				|S| <= i and
				|T| <= i;

	Theorem String_Length_Boundary_Singleton_Left:
		For all S : SStr,
		For all E : Entity,
		For all i : Z,
			|<E> o S| <= i implies
				|S| < i;

	Theorem String_Length_Hack_1:
		For all U, V : SStr,
		For all E : Entity,
		For all i : Z,
			|U o (<E> o V)| <= i implies
				|U| < i and
				|V| < i;

	Theorem Reverse_Irrelevant_In_Length:
		For all S : SStr,
			|Reverse(S)| = |S|;

	Theorem Concatenate_Singleton_Increases_Length_Left:
		For all S : SStr,
		For all E : Entity,
			(|S| < |<E> o S|) = true;

	Theorem Concatenate_Singleton_Increases_Length_Right:
		For all S : SStr,
		For all E : Entity,
			(|S| < |S o <E>|) = true;

	Theorem Zero_Length_Implies_Empty_String:
		For all S : SStr,
			(|S| = 0) implies S = Empty_String;

	Theorem Length_Concatenation:
		For all U, V : SStr,
			|U o V| = |U| + |V|;

	---------------------------------------------------------------
	-- Singleton String Theorems                                 --
	---------------------------------------------------------------
	Theorem Reverse_Of_Singleton:
		For all E : Entity,
			Reverse(<E>) = <E>;

	---------------------------------------------------------------
	-- Reverse Theorems                                          --
	---------------------------------------------------------------
	Theorem Concatenation_Under_Reverse:
		For all U, V : SStr,
			Reverse(U o V) = Reverse(V) o Reverse(U);

	Theorem Reverse_Inverts_Itself:
		For all S : SStr,
			Reverse(Reverse(S)) = S;

	---------------------------------------------------------------
	-- Concatenation Theorems                                    --
	---------------------------------------------------------------
	Theorem Concatenation_Associative:
		For all U, V, W : SStr,
			(U o V) o W = U o (V o W);
end;
