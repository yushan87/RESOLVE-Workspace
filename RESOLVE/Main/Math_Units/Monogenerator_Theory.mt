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
Precis Monogenerator_Theory;
	uses Basic_Properties;

Definition Is_Monogeneric_for(D : SSet, b : D, g : D -> D) : B;

(*
Theorem M1:
	For all D : SSet,
	For all b : D,
	For all g : D -> D,
		Is_Monogeneric_for(D, b, g) implies
			(For all T, U : SSet,
			For all f : T -> U,
			For all s : T * U * D -> U,
			For all p : T * D -> T,
				There exists unique i : T * D -> U,
					For all t : T,
						(i(t, b) = f(t)) and
						(For all x : D,
							i(t, g(x)) = s(t, i(p(t, x), x), x)));


Theorem M2:
	For all D1, D2 : SSet,
	For all b1 : D1,
	For all b2 : D2,
	For all g1 : D1 -> D1,
	For all g2 : D2 -> D2,
		(Is_Monogeneric_for(D1, b1, g1) and Is_Monogeneric_for(D2, b2, g2)) implies
			(not(There exists h : D1 -> D2,
				(h(b1) = b2) and (For all x : D1,
					h(g1(x)) = g2(h(x)) and Is_Bijective(h))));
*)

--Temporary fix for conditional functions
Definition conditional(cond : B, a : Entity, b : Entity) : Entity;

end Monogenerator_Theory;