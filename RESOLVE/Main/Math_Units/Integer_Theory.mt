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

Precis Integer_Theory;
    uses Boolean_Theory, Set_Theory;

	(* Note that the type Z is built-in.  No need to introduce it here. *)

	Definition N : Powerset(Z);
	Definition z : Z;

	Type Theorem N_Subset_of_Z:
		For all n : N,
			n : Z;

    Definition neg: Z -> Z;

    Definition suc: Z -> Z;
	
	(* Temporary fix for numbers 0 to 9 *)
	Definition 0 : N;
	Definition 1 : N;
	Definition 2 : N;
	Definition 3 : N;
	Definition 4 : N;
	Definition 5 : N;
	Definition 6 : N;
	Definition 7 : N;
	Definition 8 : N;
	Definition 9 : N;

    --------------------------------------------------------------

    Definition (i: Z) + (j: Z): Z = 0;

    Definition (i: Z) - (j: Z): Z = 0;

    Definition (i: Z) * (j: Z) : Z = 0;

    Definition (i: Z) ** (j: Z) : Z = 0;

    Definition (i: Z) / (j: Z) : Z = 0;

    Definition (i: Z) mod (j: Z) : Z = 0;

    Definition (i: Z) rem (j: Z) : Z = 0;

    Definition (i: Z) div (j: Z) : Z = 0;

    Definition (i: Z) <= (j: Z) : B = true;

    Definition (i: Z) >= (j: Z) : B = true;

    Definition (i: Z) < (j: Z) : B = true;

    Definition (i: Z) > (j: Z) : B = true;

    Definition |(i: Z)| : Z = 0;

    Definition (i: Z) .. (j: Z) : Set(Z) = Empty_Set;

	Definition Sum(a : Z, s : Set(Z)) : Z;

    Definition Summation(s: Set(Z), f: Z -> Z) : Z = 0;

	Definition isEven(i : Z) : B = true;

	Theorem Commutativity_Addition:
		For all i, j: Z,
			(i + j) = (j + i);

    Theorem Commutativity_Multiplication:
		For all i, j: Z,
			(i * j) = (j * i);

    Theorem Associativity_Addition:
        For all i, j ,k: Z,
            (i + (j + k)) = ((i + j) + k);

    Theorem Associativity_Multiplication:
        For all i, j ,k: Z,
            (i * (j * k)) = ((i * j) * k);

    Theorem Distributivity_Multiplication_over_Addition:
        For all i, j, k: Z,
            (i * (j + k)) = ((i * j) + (i * k));
		-- Left distributivity is implied by commutativity

    Theorem Distributivity_Subtraction_over_Addition:
        For all i, j: Z,
            (i - (i + j)) = (0 - j);

    Theorem Zero_Addition:
        For all i: Z,
            (i + 0) = i;

    Theorem Subtraction:
        For all i: Z,
            (i - i) = 0;

    Theorem One:
        For all i: Z,
            (i * 1) = i;

    Theorem Two:
        (1 + 1) = 2;

    Theorem Zero_One_Order:
        0 < 1;

    Theorem Additive_Inverse:
        For all i, j: Z,
            (i - j = 0) = (i = j);
        -- converse is also true, but there is no point to matching i = j

    Theorem Multiplicative_Inverse:
        For all i, j: Z,
            (i * j = 1) implies i = 1 / j;

    --- Syntactic definitions of <=
    Theorem LT_to_LTE:
        For all i, j: Z,
            (i < j) = (i + 1 <= j);

    Theorem GT_to_LTE:
        For all i, j: Z,
            (i > j) = (j + 1 <= i);

    Theorem GTE_to_LTE:
        For all i, j: Z,
            (i >= j) = (j <= i);

    Theorem Not_LTE_to_LTE:
        For all i, j: Z,
            not(i <= j) = (j + 1 <= i);

    Theorem NEQ:
        For all i, j: Z,
            not(i = j) = (i /= j);

    Theorem NEQ_is_Symmetric:
        For all i, j: Z,
            (i /= j) = (j /= i);

    --- Order Theorems for Z
    Theorem Trichotomy_1:
        For all i,j : Z,
            For all p,q: B,
                ((i < j) = p and (i = j) = q) implies ((p /= q) or (i > j and p = false));

    Theorem Trichotomy_2:
		For all i,j : Z,
			For all p,q: B,
				((i < j) = p and (i > j) = q) implies ((p /= q) or (i = j and p = false));

    Theorem Trichotomy_3:
		For all i,j : Z,
			For all p,q: B,
				((i > j) = p and (i = j) = q) implies ((p /= q) or (i < j and p = false));

    Theorem Not_LTE_Plus_1:
        For all i: Z,
            ((i + 1) <= i) = false;

    Theorem Addition_For_Inequalities:
        For all i, j, k: Z,
            (i + k <= j + k) = (i <= j);

    Theorem Subtraction_For_Inequalities_1:
        For all i, j, k: Z,
            (i - k <= j - k) = (i <= j);

    Theorem Subtraction_For_Inequalities_2:
        For all i, j, k: Z,
            (i - j <= i - k) = (k <= j);

    Theorem LTE_is_Transitive:
        For all i, j, k: Z,
            ((i <= j) and (j <= k)) implies (i <= k);

    Theorem LTE_is_Antisymmetric:
        For all i, j: Z,
            ((i <= j) and (j <= i)) implies (i = j);

    Theorem LTE_is_Reflexive:
        For all i: Z,
            (i <= i) = true;

	-- Sketchy theorems
    Theorem LTE_and_NE:
        For all i, j: Z,
            ((i <= j) and (i /= j)) implies (i + 1 <= j);

    Theorem LTE_Subtract_One:
        For all i, j, k: Z,
            ((i + 1)  <= j) implies (i <= j);

    Theorem LTE_Add_One:
        For all i, j: Z,
            (1 <= j) implies (2 <= j + 1);

    Theorem Addition_Subtraction_Cancellation:
        For all i, j: Z,
            ((i + j) - j) = i;

    Theorem Minus_Two:
        For all i, j: Z,
            ((i - 1) - 1) = (i - 2);

    Theorem Equality_Inference_1:
        For all iz :Z,
            For all p: B,
                ((iz = iz) = p) implies (p = true);

    Theorem Equality_Inference_2:
            For all iz, j :Z,
                ((iz = j) = true) implies (iz = j);

end Integer_Theory;