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

Theory Natural_Number_Theory;
    uses Boolean_Theory;

    -- all definitions are syntactic place holders

    --Math Type N: SSet;
    Math Type N: Powerset(Z);

    Definition 0: N;

    Definition suc: N -> N;

    --------------------------------------------------------------

    Inductive Definition (m: N) + (n: N): N is
        (i) m + 0 = m;
        (ii) m + suc(n) = suc(m + n);

    Definition (m: N) - (n: N): N = 0;

    Inductive Definition (m: N) * (n: N): N is
        (i) m * 0 = 0;
        (ii) m * suc(n) = m * n + m;

    Definition (m: N) / (n: N): N = 0;

    Definition (m: N) ** (n: N): N = 0;

    Definition (m: N) mod (n: N): N = 0;

    Definition (m: N) rem (n: N): N = 0;

    Definition (m: N) div (n: N): N = 0;

    Definition (m: N) <= (n: N): B =
        There exists i: N such that m + i = n;

    Definition (m: N) >= (n: N) : B = ( n <= m );

    Definition (m: N) < (n: N) : B = ( m <= n and m /= n );

    Definition (m: N) > (n: N) : B = ( n < m );

end Natural_Number_Theory;
