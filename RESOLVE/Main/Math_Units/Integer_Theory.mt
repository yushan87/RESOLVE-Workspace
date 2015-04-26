(*
 * This software is released under the new BSD 2006 license.
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
    

	
	Definition N : Powerset(Z);

	Type Theorem N_Subset_of_Z:
		For all naturals : N,
			naturals : Z;

	Definition 0:N;
	Definition 1:N;
	
	(* Note that the type Z is built-in.  No need to introduce it here. *)
	-- Definition Z:SSet;
	-- Is_Monogeneric_for(Z,0,NB);


	(*Inductive Definition Is_Neg(n:Z):B is
		(i) Is_Neg(0) = false;
		(ii) Is_Neg(NB(n)) = not(Is_Neg(n));
	*)

--	Definition Is_Neg(n:Z):B;

--  Definition NB(n:Z):Z;

	Definition (i: Z) >= (j: Z) : B;
	Definition (i: Z) <= (j: Z) : B;
	Definition (i: Z) < (j: Z) : B;
	Definition (i: Z) > (j: Z) : B;
(*    Theorem Is_Neg_Ind_Def_a:
    	Is_Neg(0) = false;

   	Theorem Is_Neg_Ind_Def_b:
   		For all n:Z,
    		Is_Neg(NB(n)) = not(Is_Neg(n));
*)
    (* Inductive Definition -(n:Z):Z is
    	(i) -(0) = 0;
    	(ii) Is_Neg(n) implies -(NB(n)) = n;
    	(iii) not(Is_Neg(n)) implies -(NB(n)) = NB(NB(n));
    *)

(*	Theorem N_Non_Neg:
		For all nnx:N,
			0 <= nnx;
*)			
    Theorem Unary_Minus_Ind_Def_a:
    	-(0) = 0;

(*   	
	Theorem Unary_Minus_Ind_Def_b:
   		For all n:Z,
   			Is_Neg(n) implies -(NB(n)) = n;

   	Theorem Unary_Minus_Ind_Def_c:
   		For all n:Z,
			not(Is_Neg(n)) implies -(NB(n)) = NB(NB(n));

	Theorem I1:
		For all n:Z,
			Is_Neg(n) implies NB(n) = -n;
*)
	Theorem I2:
		For all m,n:Z,
			-(-n) = m implies m = n;

	(* Inductive Definition suc(n:Z):Z is
		(i) suc(0) = NB(NB(0));
		(ii) Is_Neg(n) implies suc(NB(n)) = NB(NB(NB(n)));
		(iii) not(Is_Neg(n)) implies suc(NB(n)) = -n;
	*)

(*
    Definition suc: Z -> Z;

	Theorem Suc_Ind_Def_a:
		suc(0) = NB(NB(0));

	Theorem Suc_Ind_Def_b:
		For all n:Z,
			Is_Neg(n) implies suc(NB(n)) = NB(NB(NB(n)));

	Theorem Suc_Ind_Def_c:
		For all n:Z,
			not(Is_Neg(n)) implies suc(NB(n)) = -n;

	Theorem I3:
		For all n:Z,
			not(Is_Neg(n)) implies suc(n) = NB(NB(n));

	Corollary I3_1_a:
		For all n:Z,
			Is_Neg(n) implies NB(n) = -n;

	Corollary I3_1_b:
		For all n:Z,
			not(Is_Neg(n)) implies NB(n) = -suc(n);

	Theorem I4:
		For all m,n:Z,
			suc(-suc(n)) = m implies m = -n;

	Corollary I4_1: --Is_Bijective(suc);
		For all m,n:Z,
			(suc(m) = suc(n)) implies (m = n); --Is_Injective(suc)
			-- Is_Surjective(suc);
*)
	(* Inductive Definition (m:Z) + (n:Z) : Z is
		(i) m + 0 = m;
		(ii) Is_Neg(n) implies m + NB(n) = -(-m + n);
		(iii) not(Is_Neg(n)) implies m + NB(n) = -(suc(-m + n));
	*)

    Definition (m: Z) + (n: Z): Z;

	Corollary Plus_1:
		For all m,n:Z,
			n + 0 = m implies m = n; --Is_Right_Identity_for(op+,0);
(*
	Corollary Plus_2_a:
		For all m,n,i:Z,
			Is_Neg(n) and m + NB(n) = i implies i = -(-m + n);

	Corollary Plus_2_b:
		For all m,n,i:Z,
			not(Is_Neg(n)) and m + NB(n) = i implies i = -(suc(-m + n));

	Corollary Plus_3_a:
		For all m,n,i:Z,
			Is_Neg(n) and m + NB(NB(n)) = i implies i = -suc(-(m + n));

	Corollary Plus_3_b:
		For all m,n,i:Z,
			not(Is_Neg(n)) and m + NB(NB(n)) = i implies i= suc(m + n);
*)
(*	Theorem I5:
		Is_Homomorphism_for(op+,op-); *)

(*	Theorem I6:
		For all m,n,k:Z,
			suc(m + n) = k implies k = m + suc(n);
*)
	Theorem I7: -- Is_Associative(op+)
		For all l,m,n:Z,
			l + (m + n) = (l + m) + n;

	Theorem I8: -- Is_Left_Identity_for(+,0)
		For all m,n:Z,
			0 + n = m implies m = n;

(*  Corollary I8_1:
		Is_Identity_for(+,0); *)

(*	Theorem I9a:
		For all m,n,k:Z,
			suc(m + n) = k implies k = suc(m) + n;

	Theorem I9b:
		For all m,n,k:Z,				
			suc(m + (-n)) = k implies k  = suc(m) + (-n);
*)
	Theorem I10: -- Is_Commutative(op+);
		For all m,n,k:Z,
			m + n = k implies k = n + m;

	Corollary I10_1_a: -- Is_Inverse_for(op+,op-);
		For all n,m:Z,
			n + (-n) = m implies m = 0;

	Corollary I10_1_b: -- Is_Inverse_for(op+,op-);
		For all m,n:Z,
			(-n) + n = m implies m = 0;
(*
	Definition NN: Powerset(Z);
	Type Theorem NN_Subset_of_Z:
		For all n:NN,
			n:Z;
	Type Theorem NN_Def:
		For all n:Z,
			not(Is_Neg(n)) implies n:NN;
	Definition 0:NN; -- Corollary NN_1
	Corollary NN_2:
		For all n:NN,
			suc(n) = NB(NB(n));
	Type Theorem NN_3:
		For all n:NN,
			suc(n):NN;

	Type Theorem I11_a:
		For all m,n:NN,
			m + n: NN;
*)
(*	Theorem I11_b:
		For all n:Z,
			Is_Neg(n) implies Is_Neg(0 + n);
		--Is_Abelian_Monoid(NN,0,+^NN);
		--Is_Right_Cancelative(+^NN);
*)
(*	Theorem I12:
		For all n:Z,
			(n:NN and -n:NN) implies (n = 0);
		-- not(Is_Factorable_for(+^NN,0); *)

	
(*	Theorem One_Expanded_Def:
		1 = suc(0);

	Corollary One_1:
		For all m,n:Z,
			suc(m) = n implies n = m + 1;

	Corollary One_2_a:
		For all n:Z,
			not(Is_Neg(n)) implies NB(n) = -(n + 1); -- changed from n >= 0

	Corollary One_2_b:
    	For all n:Z,
    		Is_Neg(n) implies NB(n) = -n;
*)
    --Definition 1: NN; already defined in same file (not allowed);

    Corollary One_3:
    	1 /= 0;

    -- Corollaries 4 to 7 omitted


    Corollary LTE_1: -- Is_Transitive(op<=);
    	For all l,m,n:Z,
    		l <= m and m <= n implies l <= n;

    Corollary LTE_2: -- Is_Antisymmetric(<=)
    	For all m,n:Z,
    		m <= n and n <= m implies m = n;

    Corollary LTE_3: -- Is_Total(<=)
    	For all m,n:Z,
    		m <= n or n <= m;

    Corollary LTE_3a: --Is_Reflexive(<=) -- implied by Is_Total
    	For all n:Z,
    		n <= n;

(*  Corollary LTE_4:
    	Is_Total_Ordering(<=);*)

	Corollary LTE_6: --Is_Preserved_by(op+,<=);
		For all l,m,n:Z,
		For all p:B,
			(l + n <= m + n) = p implies p = (l <= m);

	Corollary LTE_8:
		For all m,n:Z,
		For all p:B,
			(-n <= -m) = p implies p = (m <= n);

(*	Corollary LTE_9:
		For all n:Z,
		For all p:B,
			Is_Neg(n) = p implies p = not(0 <= n);
*)
	Corollary LTE_10:
		not(1 <= 0);

	Definition |(n: Z)| : Z;
(*
	Theorem Abs_Val_Expanded_Def_1:
		For all n,m:Z,
			|n| = m and not(Is_Neg(n)) implies m = n;

	Theorem Abs_Val_Expanded_Def_2:
		For all n,m:Z,
			|n| = m and Is_Neg(n) implies m = -n;

	Corollary Abs_Val_1:
		For all n:Z,
			|(|n|)| = |n|;

	Corollary Abs_Val_2:
		For all n:Z,
			|(|-n|)| = |n|;
*)
	--Omitted Is_Alg_Int_Like section

(* 	Inductive Definition (m:Z) * (n:Z):Z is
		(i) m * 0 = 0;
		(ii) Is_Neg(n) implies m * NB(n) = -(m * n);
		(iii) not(Is_Neg(n)) implies m * NB(n) = -(m * n + m); *)

	Definition (m:Z) * (n:Z):Z;
(*	Theorem Mult_Ind_Def_Expansion_ii:
		For all l,m,n:Z,
			Is_Neg(n) and m * NB(n) = l implies -(m * n) = l;

	Theorem Mult_Ind_Def_Expansion_iii:
		For all l,m,n:Z,
			not(Is_Neg(n)) and m * NB(n) = l implies -(m * n + m) = l;
*)
	Corollary Mult_Def_1:
		For all n:Z,
			n * 0 = 0;

	Corollary Mult_Def_2:
		For all n: Z,
			n * 1 = n;

	Theorem I14: --Is_Right_Distributive_Over(op+,op*);
		For all l,m,n:Z,
			(l + m) * n = (l * n) + (m * n);

	Theorem I15:
		For all m,n:Z,
			-(m*n) = (-m)*n;

	Theorem I16:
		For all m,n:Z,
			m * (-n) = -(m*n);

(*	Theorem I17:
		For all m,n:Z,
			m * suc(n) = (m * n) + m;
*)
	Theorem I18: --Is_Left_Distributive_Over(op+,op*);
		For all l,m,n:Z,
			l * (m + n) = (l * m) + (l * n);

	Theorem I19: --Is_Associative(op*);
		For all l,m,n:Z,
			l * (m * n) = (l * m) * n;

	Theorem I20: --Is_Left_Zero_for(*,0)
		For all n:Z,
			0 * n = 0;

	Theorem I21: --Is_Left_Identity_for(op*,1)
		For all n:Z,
			1 * n = n;

	Theorem I22: --Is_Commutative(op*)
		For all m,n:Z,
			m * n = n * m;

(* 	Theorem I25:
		not(Is_Composite_for(op*,0)(; *)

	Corollary I25_1:
		For all l,m,n:Z,
			l /= 0 and m * l = n * l implies m = n;

	Corollary I25_2:
		For all l,m,n:Z,
        	l /= 0 and l * m = l * n implies m = n;

(* 	Corollary I25_3:
		Is_Integral_Domain(Z,0,1,-,+,op* ); *)


   	---------------------------------------------------------------
	-- Potential Addons                                
	---------------------------------------------------------------
	
	Theorem Not_LTE_N_1_0:
		For all i:N,
			not(1 <= i) implies i = 0;
			
	Theorem Not_LTE_Z_1_0:
		For all i:Z,
			not(1 <= i) implies i <= 0;
			
	Theorem Add_Zero:
		For all i:Z,
			0 + i = i;
			
    Definition (i: Z) - (j: Z): Z = i + (-j);
	Theorem Minus_Expanded_Def:
		For all i,j,k:Z,
			i - j = k implies k = i + (-j);
			
	Theorem Distribution_Unary_Minus_Over_Addition:
		For all i,j,k:Z,
			-(i + j) = k implies k = (-i) + (-j);
			
	Theorem Addition_Over_Equality: -- written to remove negatives
		For all i,j,k:Z,
			i + (-j) = k implies i = k + j;
			
	Theorem Addition_Over_LTE: -- written to remove negatives
		For all i,j,k:Z,
			i + (-j) <= k implies i <= k + j;
   
	Theorem LT_Expanded_Def_1:
    	For all i,j:Z,
    		(i < j) = (i + 1 <= j); 	
 
 	Theorem Subtr_Elim:
    	For all i,j,k:Z,
    		((i - j) = k) implies (k + j = i);   
    		
    Theorem LT_and_LTE_a:
    	For all m,n,p:Z,		
    		 m < n and n <= p implies m < p;
    		 
    Theorem LT_and_LTE_b:
    	For all m,n,p:Z,		
    		 m <= n and n < p implies m < p;
    		 			
    Corollary LTE_6_b:
		For all i,j,k,l:Z,
			i + j <= k and l <= j implies i + l <= k;
			
	Theorem Zero_LTE_One:
		0 <= 1;

	Theorem Neg_One_LTE_Zero:
		(-1) <= 0;
	
	Theorem Zero_LT_One:
		0 < 1;

	Theorem Neg_One_LT_Zero:
		(-1) < 0;	
				
	Theorem LTE_Plus_Non_Neg_RS:
		For all i,j,k,m:Z,	
			i <= j and j + m = k and 0 <= m implies i <= k;
			
	Theorem LTE_Sub_LS:
		For all i,j,k,m:Z,	
			i <= j and i + m = k and m <= 0 implies k <= j;

	Theorem GTE_Expanded_Def:
    	For all i,j:Z,
    	For all p:B,
    		(i >= j) = p implies (j <= i) = p;

    Theorem GT_Expanded_Def:
    	For all i,j:Z,
    	For all p:B,
    		(i > j) = p implies (j + 1 <= i) = p;
    		
    Theorem Not_GTE:
    	For all i,j:Z,
    	For all p:B,
    		(i < j) = p implies not(i >= j) = p;

    Theorem Not_GT:
    	For all i,j:Z,
    	For all p:B,
    		not(i > j) = p implies (i <= j) = p;

    Theorem Not_LTE:
    	For all i,j:Z,
    	For all p:B,
    		not(i <= j) = p implies p = (j + 1 <= i);

    Theorem Not_LT:
    	For all i,j:Z,
    		(i >= j) = not(i < j);

    Theorem Not_Eq_1:
    	For all i,j:Z,
    		(i > j) implies (i /= j);

    Theorem Not_Eq_2:
    	For all i,j:Z,
    		(i < j) implies (i /= j);

   	Theorem Not_Eq_3:
   		For all i,j,k:Z,
   			(i + j /= i + k) implies (j /= k);

   	Theorem Not_Eq_4:
   		For all i,j:Z,
   			(i <= j) and (j /= i) implies (i < j);
   			
   	Theorem Add_NonZero_Not_Eq:
   		For all i,j,k:Z,
   			(j /= 0) and (i + j = k) implies  i /= k;

	Theorem LT_implies_LTE:
		For all i,j:Z,
			(i < j) implies (i <= j);

	Theorem GT_implies_GTE:
    	For all i,j:Z,
    		(i > j) implies (i >= j);

	Theorem Not_LTE_Implies:
		For all i,j:Z,
			not(i<=j) implies j + 1 <= i;
					
	Theorem Add_GTE_Zero_GTE_a:
   		For all i,j,k:Z,
   			(i <= j) and (0 <= k) implies (i <= j + k);
   			

	Theorem Add_GTE_Zero_GTE_b:
   		For all i,j,k,m:Z,
   			(i <= j) and j + k = m  and 0 <= k implies (i <= m);		
   			
	Theorem LTE_Subtr:
		For all i,j,k:Z,
			i + (-j) = k and 0 <= j implies k <= i;
	
	Theorem LT_Subtr:
		For all i,j,k:Z,
			i + (-j) = k and 0 < j implies k < i;

	Theorem LTE_Substitution:
		For all i,j,k:Z,	
			i <= j and k <= i implies k <= j;
			
	Theorem Nested_Subt_1:
		For all i,j:Z,
			(i + j) - j = i;
			
	Theorem Nested_Subt_2:
		For all i,j:Z,
			(i + j) - i = j;	

    Definition (i: Z) ** (j: Z) : Z;

    Definition (i: Z) / (j: Z) : Z;

    Definition (i: Z) mod (j: Z) : Z;
    
end Integer_Theory;
