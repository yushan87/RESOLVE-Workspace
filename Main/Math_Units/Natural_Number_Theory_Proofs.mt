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


Proofs_for Natural_Number_Theory_Proofs;
    uses Boolean_Theory, Set_Theory, Integer_Theory;
    
  Definition 0: N;

  Definition suc: N -> N;
  Corollary plus_pty_1: a: N and a + 0 = a;
       
  Corollary plus_pty_2: a, b: N and a + suc(b) = suc(a + b);

  Proof of Theorem N2:
    Goal for all k, m, n: N, k + (m + n) = (k + m) + n;
    Def S1: Powerset(N) = { n: N, for all k, m: N, k + (m + n) = (k + m) + n };
    Goal S1 = N;
    Goal 0 is_in S1;
    Goal for all n: S1, suc(n) is_in S1;
    (Base_case) Goal 0 is_in S1;
        Goal for all k, m: N, k + (m + 0) = (k + m) + 0;
        Goal for all k, m: N, if k is_in N and m is_in N then k + (m + 0) = (k + m) + 0;
        Supposition k, m: N;
            Goal k + (m + 0) = (k + m) + 0;
            k + (m + 0) = k + m    by Corollary plus_pty_1;
            k + m = (k + m) + 0     by Corollary plus_pty_1;
        [s1] Deduction if k is_in N and m is_in N then k + (m + 0) = (k + m) + 0;
        [s2] b, a: N and a + (b + 0) = (a + b) + 0    by self & modus ponens;
        [s3] For all k: N, for all m: N, k + (m + 0) = (k + m) + 0     by s2 & universal generalization;
        [s4] 0 is_in S1     by s3;
    (Inductive_case) Goal for all n: N, suc(n) is_in S1;
        Goal for all n: N, if n is_in S1 then suc(n) is_in S1;
        Supposition n: S1;
          [s5] For all k, m: N, k + (m + n) = (k + m) + n     by Def S1;
          Goal suc(n) is_in S1;
            Goal for all k, m: N, k + (m + suc(n)) = (k + m) + suc(n);
            Goal for all k, m: N, if k is_in N and m is_in N then k + (m + suc(n)) = (k + m) + suc(n);
            Supposition k, m: N;
                Goal k + (m + suc(n)) = (k + m) + suc(n);
                k + (m + suc(n)) = k + suc(m + n)     by Corollary plus_pty_2;
                (k + suc(m + n)) = suc(k + (m + n))     by Corollary plus_pty_2;
                [s6] a, b: N and a + (b + n) = (a + b) + n     by s5 & universal instantiation;
                suc(k + (m + n)) = suc((k + m) + n)     by s6;
                suc((k + m) + n) = (k + m) + suc(n)     by Corollary plus_pty_2;
            Deduction if k is_in N and m is_in N then k + (m + suc(n)) = (k + m) + suc(n);
            [s7] For all k, m: N, k + (m + suc(n)) = (k + m) + suc(n)     by universal generalization;
            [s8] suc(n) is_in S1     by s7;
        Deduction if n is_in S1 then suc(n) is_in S1;
        for all n: N, suc(n) is_in S1     by s8 & universal generalization;
        Definition Monogeneric_Pty_3: B = if (0 is_in S1 and (for all x: S1, suc(x) is_in S1)) then (N = S1);
        0 is_in S1 and (for all n: N, suc(n) is_in S1)    by s4 & and rule;
        N = S1     by Definition Monogeneric_Pty_3 & modus ponens;
        For all k, m, n: N, k + (m + n) = (k + m) + n     by Def S1 & universal generalization;
  QED

end Natural_Number_Theory_Proofs;
