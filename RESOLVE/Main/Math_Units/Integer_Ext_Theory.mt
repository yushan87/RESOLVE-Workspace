Precis Integer_Ext_Theory;
	uses Integer_Theory;

Definition (i: Z) - (j: Z): Z = i + (-j);

Definition Max(m,n:Z):Z = {{m if (n <= m); n otherwise;}};

Corollary Max_1:
	For all m,n:Z,
	Max(m,n) = Max(n,m);
	
Corollary Max_2:
	For all m,n,p:Z,
	Max(Max(m,n),p) = Max(m,Max(n,p));
	
Corollary Max_3:
	For all n:Z,
	Max(n,n) = n;
	
Corollary Max_4:
	For all m,n:Z,
	m <= Max(m,n);
	
Corollary Max_5:
	For all m,n:Z,
	(m <= n) = (Max(m,n) = n);
	
Corollary Max_6:
	For all m,n,p:Z,
	Max(m,n) + p = Max(m + p, n + p);
	
Corollary Max_7:
	For all m,n,p:Z,
	Max(m,n) * |p| = Max(m * |p|, n * |p|);
	
Definition min(m,n:Z):Z = {{m if (m <= n); n otherwise;}};

Corollary Min_1:
	For all m,n:Z,
	min(m,n) = min(n,m);
	
Corollary Min_2:
	For all m,n,p:Z,
	min(min(m,n),p) = min(m,min(n,p));
	
Corollary Min_3:
	For all n:Z,
	min(n,n) = n;
	
Corollary Min_4:
	For all m,n:Z,
	min(m,n) <= m;
	
Corollary Min_5:
	For all m,n:Z,
	min(m,n) <= Max(m,n);
	
Corollary Min_6:
	For all m,n:Z,
	(m <= n) = (min(m,n) = m);
	
Corollary Min_7:
	For all m,n,p:Z,
	min(m,n) + p = min(m + p, n + p);
	
Corollary Min_8:
	For all m,n,p:Z,
	min(m,n) * |p| = min(m * |p|, n + |p|);

Corollary Min_9:
	For all m,n:Z,
	min(m,n) = - Max(-m,-n);
	
end Integer_Ext_Theory;