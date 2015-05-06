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
	uses Monogenerator_Theory, Natural_Number_Theory, Basic_Properties;
	
Categorical Definition introduces
	Z : SSet,
	z0 : Z,
	NB : Z -> Z
related by
	Is_Monogeneric_for(Z, z0, NB);

Theorem zero_N:
	z0 = 0;
		
Inductive Definition Is_Neg(n : Z) : B is
	(i) Is_Neg(z0) = false;
	(ii) Is_Neg(NB(n)) = not(Is_Neg(n));
	
Inductive Definition -(n : Z) : Z is
	(i) -z0 = z0;
	(ii) -NB(n) = conditional(Is_Neg(n), n, NB(NB(n)));
	
Theorem I1:
	For all n : Z,
		Is_Neg(n) implies NB(n) = -n;
		
Theorem I2:
	For all n : Z,
		-(-n) = n;
		
Inductive Definition suc(n : Z) : Z is
	(i) suc(z0) = NB(NB(z0));
	(ii) suc(NB(n)) = conditional(Is_Neg(n), NB(NB(NB(n))), -n);
	

Definition z1 : Z = suc(z0);

Theorem one_N:
	z1 = 1;
	
Theorem I3:
	For all n : Z,
		not(Is_Neg(n)) implies
			(suc(n) = NB(NB(n)));

Corollary I3_1:
	For all n : Z,
		NB(n) = conditional(Is_Neg(n), -n, -suc(n));
		
Theorem I4:
	For all n : Z,
		suc(-suc(n)) = -n;
		
Corollary I4_1:
	Is_Bijective(suc);
	
Inductive Definition (m : Z) + (n : Z) : Z is
	(i) m + z0 = m;
	(ii) m + NB(n) = conditional(Is_Neg(n), -(-m + n), -(suc(-m + n)));
	
Corollary Plus_1:
	Is_Right_Identity_for(op +, z0);
	
Corollary Plus_2:
	For all m, n : Z,
		m + NB(n) = conditional(Is_Neg(n), -(-m + n), -(suc(-m + n)));
		
Corollary Plus_3:
	For all m, n : Z,
		m + NB(NB(n)) = conditional(Is_Neg(n), -suc(-(m + n)), suc(m + n));
		
Theorem I5:
	Is_Homomorphism_for(op +, op -);
	
Theorem I6:
	For all m, n : Z,
		suc(m + n) = m + suc(n);
		
Theorem I7:
	Is_Associative(op +);
	
Theorem I8:
	Is_Left_Identity_for(op +, z0);
	
Corollary I8_1:
	Is_Identity_for(op +, z0);
	
Theorem I9:
	For all m, n : Z,
		suc(m + n) = suc(m) + n and suc(m + -n) = suc(m) + -n;
		
Theorem I10:
	Is_Commutative(op +);
	
Corollary I10_1:
	Is_Inverse_for(op +, op -);
	
Corollary I10_2:
	Is_Abelian_Group(Z, z0, op +, op -);
		
Definition (m : Z) <= (n : Z) : B;
--
Definition (i: Z) >= (j: Z) : B;
Definition (i: Z) < (j: Z) : B;
Definition (i: Z) > (j: Z) : B;
	
Theorem One_Expanded_Def:
	z1 = suc(z0);
(*
Corollary One_1:
	For all m,n:Z,
		suc(m) = n implies n = m + 1;

Corollary One_2_a:
	For all n:Z,
		0 <= n implies NB(n) = -(n + 1);

Corollary One_2_b:
    For all n:Z,
    	Is_Neg(n) implies NB(n) = -n;
*)
Corollary One_3:
    z1 /= z0;

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

Corollary LTE_4:
    	Is_Total_Ordering(op <=);
    	
Corollary LTE_6:
	Is_Preserved_by(op +,op <=);
	
Corollary LTE_6_def: 
	For all l,m,n:Z,
	For all p:B,
		(l + n <= m + n) = p implies p = (l <= m);

Corollary LTE_8:
	For all m,n:Z,
	For all p:B,
		(-n <= -m) = p implies p = (m <= n);

Corollary LTE_9:
	For all n:Z,
	For all p:B,
		Is_Neg(n) = p implies p = not(z0 <= n);

Corollary LTE_10:
	not(z1 <= z0);

Definition |(n: Z)| : Z;

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

	--Omitted Is_Alg_Int_Like section

Inductive Definition (m:Z) * (n:Z):Z is
		(i) m * z0 = z0;
		(ii) Is_Neg(n) implies m * NB(n) = -(m * n);
		--(iii) not(Is_Neg(n)) implies m * NB(n) = -(m * n + m);
(*
Definition (m:Z) * (n:Z):Z;
Theorem Mult_Ind_Def_Expansion_ii:
	For all l,m,n:Z,
		Is_Neg(n) and m * NB(n) = l implies -(m * n) = l;
*)
Theorem Mult_Ind_Def_Expansion_iii:
	For all l,m,n:Z,
		not(Is_Neg(n)) and m * NB(n) = l implies -(m * n + m) = l;

Corollary Mult_Def_1:
	For all n:Z,
		n * z0 = z0;

Corollary Mult_Def_2:
	For all n: Z,
		n * z1 = n;

Theorem I14: --Is_Right_Distributive_Over(op+,op*);
	For all l,m,n:Z,
		(l + m) * n = (l * n) + (m * n);

Theorem I15:
	For all m,n:Z,
		-(m*n) = (-m)*n;

Theorem I16:
	For all m,n:Z,
		m * (-n) = -(m*n);

Theorem I17:
	For all m,n:Z,
		m * suc(n) = (m * n) + m;

Theorem I18: --Is_Left_Distributive_Over(op+,op*);
	For all l,m,n:Z,
		l * (m + n) = (l * m) + (l * n);

Theorem I19: --Is_Associative(op*);
	For all l,m,n:Z,
		l * (m * n) = (l * m) * n;

Theorem I20: --Is_Left_Zero_for(*,0)
	For all n:Z,
		z0 * n = z0;

Theorem I21: --Is_Left_Identity_for(op*,1)
	For all n:Z,
		z1 * n = n;

Theorem I22: --Is_Commutative(op*)
	For all m,n:Z,
		m * n = n * m;

(* 	Theorem I25:
		not(Is_Composite_for(op*,0)(; *)

Corollary I25_1:
	For all l,m,n:Z,
		l /= z0 and m * l = n * l implies m = n;

Corollary I25_2:
	For all l,m,n:Z,
        l /= z0 and l * m = l * n implies m = n;

 (*	Corollary I25_3:
		Is_Integral_Domain(Z,0,1,-,+,op* ); *)


   	---------------------------------------------------------------
	-- Potential Addons                                
	---------------------------------------------------------------
	
			
	Theorem Not_LTE_Z_1_0:
		For all i:Z,
			not(z1 <= i) implies i <= z0;
			
	Theorem Add_Zero:
		For all i:Z,
			z0 + i = i;
(*			
    Definition (i: Z) - (j: Z): Z = i + (-j);
	Theorem Minus_Expanded_Def:
		For all i,j,k:Z,
			i - j = k implies k = i + (-j);
			
	Theorem Distribution_Unary_Minus_Over_Addition:
		For all i,j,k:Z,
			-(i + j) = k implies k = (-i) + (-j);
*)			
	Theorem Addition_Over_Equality: -- written to remove negatives
		For all i,j,k:Z,
			i + (-j) = k implies i = k + j;
			
	Theorem Addition_Over_LTE: -- written to remove negatives
		For all i,j,k:Z,
			i + (-j) <= k implies i <= k + j;
   
	Theorem LT_Expanded_Def_1:
    	For all i,j:Z,
    		(i < j) implies (z1 + i <= j); 	
 (*
 	Theorem Subtr_Elim:
    	For all i,j,k:Z,
    		((i - j) = k) implies (k + j = i);   
 *)   		
    Theorem LT_and_LTE_a:
    	For all m,n,p:Z,		
    		 m < n and n <= p implies m + z1 <= p;
    		 
    Theorem LT_and_LTE_b:
    	For all m,n,p:Z,		
    		 m <= n and n < p implies m + z1 <= p;
    		 			
    Corollary LTE_6_b:
		For all i,j,k,l:Z,
			i + j <= k and l <= j implies i + l <= k;
			
	Theorem Zero_LTE_One:
		z0 <= z1;

	Theorem Neg_One_LTE_Zero:
		(-z1) <= z0;
	
	Theorem Zero_LT_One:
		z0 < z1;

	Theorem Neg_One_LT_Zero:
		(-z1) < z0;	
				
	Theorem LTE_Plus_Non_Neg_RS:
		For all i,j,k,m:Z,	
			i <= j and j + m = k and z0 <= m implies i <= k;
			
	Theorem LTE_Sub_LS:
		For all i,j,k,m:Z,	
			i <= j and i + m = k and m <= z0 implies k <= j;

	Theorem GTE_Expanded_Def:
    	For all i,j:Z,
    	For all p:B,
    		(i >= j) = p implies (j <= i) = p;

    Theorem GT_Expanded_Def:
    	For all i,j:Z,
    	For all p:B,
    		(i > j) = p implies (j + z1 <= i) = p;
    		
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
    		not(i <= j) = p implies p = (j + z1 <= i);

    Theorem Not_LT:
    	For all i,j:Z,
    		not(i + z1 <= j) implies j <= i;

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
   			(i <= j) and (j /= i) implies (i + z1 <= j);
   			
   	Theorem Add_NonZero_Not_Eq:
   		For all i,j,k:Z,
   			(j /= 0) and (i + j = k) implies  i /= k;

	Theorem LT_implies_LTE:
		For all i,j:Z,
			(i < j) implies (i <= j);

	Theorem GT_implies_GTE:
    	For all i,j:Z,
    		(i > j) implies (j <= i);

	Theorem Not_LTE_Implies:
		For all i,j:Z,
			not(i<=j) implies j + z1 <= i;
					
	Theorem Add_GTE_Zero_GTE_a:
   		For all i,j,k:Z,
   			(i <= j) and (z0 <= k) implies (i <= j + k);
   			
	Theorem Add_GTE_Zero_GTE_b:
   		For all i,j,k,m:Z,
   			(i <= j) and j + k = m  and z0 <= k implies (i <= m);		
   			
	Theorem LTE_Subtr:
		For all i,j,k:Z,
			i + (-j) = k and z0 <= j implies k <= i;
	
	Theorem LT_Subtr:
		For all i,j,k:Z,
			i + (-j) = k and z0 < j implies k + z1 <= i;

	Theorem LTE_Substitution:
		For all i,j,k:Z,	
			i <= j and k <= i implies k <= j;
(*			
	Theorem Nested_Subt_1:
		For all i,j:Z,
			(i + j) - j = i;
			
	Theorem Nested_Subt_2:
		For all i,j:Z,
			(i + j) - i = j;
*)
    Definition (i: Z) ** (j: Z) : Z;

    Definition (i: Z) / (j: Z) : Z;

    Definition (i: Z) mod (j: Z) : Z;
    
end Integer_Theory;
