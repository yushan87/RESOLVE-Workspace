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
    uses Boolean_Theory, Set_Theory, Natural_Number_Theory, Integer_Theory;

    Local Math Type Gamma;

    Math Type Str: SSet -> SSet;

    Definition empty_string: Str(Gamma);

    Definition ext: Str(Gamma) x Gamma -> Str(Gamma);

    --------------------------------------------------------------

    Inductive Definition (s: Str(Gamma)) o (t: Str(Gamma)): Str(Gamma) is
        (i)  s o empty_string = s;
        (ii) For all x: Gamma, s o ext(t, x) = ext(s o t, x);

    Inductive Definition |(s: Str(Gamma))|: N is
        (i)  |empty_string| = 0;
        (ii) For all x: Gamma, |ext(s, x)| = suc(|s|);
        
    Definition <(x: Gamma)>: Str(Gamma) = (ext(empty_string, x));

    Inductive Definition Rev(s: Str(Gamma)): Str(Gamma) is
        (i)  Rev(empty_string) = empty_string;
        (ii) For all x: Gamma, Rev(ext(s, x)) = <x> o Rev(s);

    --Definition Occurs_Ct(x: Gamma, s: Str(Gamma)): N = 0;

    Inductive Definition Occurs_Ct(x: Gamma, s: Str(Gamma)): N is
        (i)  Occurs_Ct(x, empty_string) = 0;
        (ii) For all y: Gamma, Occurs_Ct(x, ext(s, y)) = {{
                 Occurs_Ct(x, s) + 1 if x = y;
                 Occurs_Ct(x, s)     if x /= y;
             }}; 

    Inductive Definition (s: Str(Gamma)) ** (n: Z): Str(Gamma) is
        (i)  s**0 = empty_string;
        (ii) s**NB(NB(n)) = s**n o s;

    Definition (s: Str(Gamma)) is_prefix_of (t: Str(Gamma)): B =
        There exists u: Str(Gamma) such that (s o u) = t;

    Definition (s: Str(Gamma)) is_suffix_of (t: Str(Gamma)): B =
        There exists u: Str(Gamma) such that (u o s) = t;

    Definition (s: Str(Gamma)) is_substring_of (t: Str(Gamma)): B =
        There exists u, v: Str(Gamma) such that (u o s o v) = t;

    Definition (s: Str(Gamma)) is_permutation_of (t: Str(Gamma)): B =
        For all x: Gamma, Occurs_Ct(x, s) = Occurs_Ct(x, t);
        
    Definition Is_prefix(p: Str(Gamma), q:Str(Gamma)):B =
		 (there exists u: Str(Gamma),(p o u) = q);
		 
	Definition Is_Suffix(p: Str(Gamma), q:Str(Gamma)):B =
		 (there exists u: Str(Gamma), (u o p) = q);
	
	Definition Is_Substring(p: Str(Gamma), q:Str(Gamma)):B =
		 (there exists u,v: Str(Gamma), (u o p o v) = q);

      Definition Is_Permutation(s: Str(Gamma), t: Str(Gamma)): B =
        For all x: Gamma, Occurs_Ct(x, s) = Occurs_Ct(x, t);

	Definition Prt_Btwn(m,n: N, q:Str(Gamma)):Str(Gamma) = q;

	Definition Symb(q:Str(Gamma)):Gamma = true;

	-- added the following for selection sort example verification with Isabelle

	Definition IsSubstring(p: Str(Gamma), q:Str(Gamma)):B =
		 (there exists u,v: Str(Gamma), (u o p o v) = q);

      Definition IsPermutation(s: Str(Gamma), t: Str(Gamma)): B =
        For all x: Gamma, Occurs_Ct(x, s) = Occurs_Ct(x, t);

	Definition PrtBtwn(m,n: N, q:Str(Gamma)):Str(Gamma) = q;

	Definition DeString(q:Str(Gamma)):Gamma = true;

	Theorem S1: For all s:Str(Gamma), Rev(Rev(s)) = s;
	Theorem S2: For all s:Str(Gamma), for all e:Gamma, 
		Rev(s o <e>) = <e> o Rev(s);

end String_Theory;
