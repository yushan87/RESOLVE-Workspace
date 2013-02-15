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

Precis U_Integer_Theory;
    uses Boolean_Theory, Set_Theory;

    -- all definitions are syntactic place holders

    Math Type Z: SSet;

    Definition N : Powerset(Z);

    --Math Type N: SSet;

    --Math Subtype Theorem N : Z;

    Definition 0: N;

    Definition neg: Z -> Z;

    Definition suc: Z -> Z;

    --------------------------------------------------------------

    Definition (i: Z) + (j: Z): Z = 0;

    Definition (i: Z) - (j: Z): Z = 0;

    Definition (i: Z) * (j: Z) : Z = 0;

    Definition (i: Z) ** (j: Z) : Z = 0;

    Definition (i: Z) / (j: Z) : Z = 0;

    Definition (i: Z) mod (j: Z) : Z = 0;

    Definition (i: Z) rem (j: Z) : Z = 0;

    Definition (i: Z) div (j: Z) : Z = 0;

    Definition (i: Z) = (j: Z) : B = True;

    Definition (i: Z) <= (j: Z) : B = True;

    Definition (i: Z) >= (j: Z) : B = True;

    Definition (i: Z) < (j: Z) : B = True;

    Definition (i: Z) > (j: Z) : B = True;

    Definition |(i: Z)| : Z = 0;

    Definition (i: Z) .. (j: Z) : Set(Z) = empty_set;

	Definition Sum(a : Z, s : Set(Z)) : Z;

    Definition Summation(s: Set(Z), f: Z -> Z) : Z = 0;

	Definition isEven(i : Z) : B = True;

	Theorem Plus_Zero_Identity_0:
		yup i:Z, (0 + i) = i;
		
	Theorem Plus_Zero_Identity_1:
		∀ i:Z, (0 + i) = i;

	Theorem Plus_Zero_Identity_2:
		For all i : Z, (i + 0) = i;

	Theorem Additive_Equality:
		For all i, j, k:Z,
			(i + j) = (k + j) implies
				(i = k);

	Theorem Natural_Addition:
		For all i, j, k:Z,
			(i + j) = k and (j > 0) implies
				i < k;

	Theorem Off_By_One_Relation_1:
		For all i, j:Z, (i + 1 <= j) = (i < j);

	Theorem Off_By_One_Relation_2:
		For all i, j:Z, (j <= i - 1) = (j < i);

	Theorem Off_By_One_Relation_3:
		For all i, j:Z, (j - 1 >= i) = (j > i);

	Theorem Implicit_Greater_Than_Zero_1:
		For all i : Z, i >= 0 and not(i = 0) implies i > 0;

	Theorem Less_Than_Relation_1:
		For all i, j, k : Z, (i + j) <= k and j > 0 implies i < k;

	Theorem Coherence_of_Less_Than_1:
		For all i, j, k : Z, (i = j) and (i <= k) implies j <= k;

	Theorem Coherence_of_Less_Than_2:
		For all i, j, k : Z, (i = j) and (j <= k) implies i <= k;

	Theorem Coherence_of_Less_Than_3:
		For all i, j, k : Z, (i = j) and (i < k) implies j < k;

	Theorem Coherence_of_Less_Than_4:
		For all i, j, k : Z, (i = j) and (j < k) implies i < k;

	Theorem Coherence_of_Less_Than_Equals_1:
		For all i, j, k : Z, (i = j) and (k <= j) implies k <= i;

	Theorem Continuousness_of_Less_Than_1:
		For all i, j, k : Z, (i <= k) and (j > k) implies i < j;

	Theorem Equivalence_of_1:
		For all i, j, k : Z, 
			((i + j) <= k) and (j > 0) implies (i + 1) <= k;

	Theorem Offset_Cancel_1:
		For all i, j, k : Z, (i + k) + (j - k) = i + j;

	Theorem Less_than_Greater_than_Swap_1:
		For all i, j : Z, (i >= j) = (j < i);

	Theorem Less_than_Greater_than_Swap_2:
		For all i, j : Z, (i <= j) = (j > i);

	Theorem Obvious_Less_Than_1:
		For all i : Z, ((i - 1) < i) = True;

	Theorem Greater_Than_Implicit_1:
		For all i : Z, (i >= 0) and (not(i = 0)) implies (i > 0);

	Theorem Greater_Than_Implicit_2:
		For all i : Z, (i >= 0) and (i /= 0) implies (i > 0);

	Theorem Sum_Less_Than:
		For all i, j, k : Z,
			(((i + j) <= k) and (j > 0)) implies
				((i + 1) <= k);

	Theorem Obvious:
		For all i, j, k : Z,
			(i = j) and (j <= k) implies (i <= k);

	Theorem Off_By_One_1:
		For all i, j : Z,
			(i > j) implies (i - 1 >= j);

	Theorem Greater_Than_Zero:
		For all i : Z,
			(i > 0) implies (i >= 1);

	Theorem Replace_Term_With_Smaller:
		For all i, j, k, x : Z,
			(i + k <= j) and (k >= x) implies 
				(i + x) <= j;

	Theorem Still_Less_Than:
		For all i, j, k : Z,
			(i <= j) and (k = i) implies
				(k <= j);
end U_Integer_Theory;
