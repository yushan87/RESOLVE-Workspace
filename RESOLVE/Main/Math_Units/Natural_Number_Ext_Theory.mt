Precis Natural_Number_Ext_Theory;
	uses Natural_Number_Theory;

Definition Max(m,n:N):N = {{m if (n <= m); n otherwise;}};

Corollary Max_1:
	For all n:N,
	Max(0,n) = n;
	
Corollary Max_2:
	For all m,n:N,
	Max(m,n) = Max(n,m);
	
Corollary Max_3:
	For all m,n,p:N,
	Max(Max(m,n),p) = Max(m,Max(n,p));
	
Corollary Max_4:
	For all m,n:N,
	m <= Max(m,n);
	
Corollary Max_5:
	For all m,n:N,
	(m <= n) = (Max(m,n) = n);
	
Corollary Max_6:
	For all m,n,p:N,
	Max(m,n) + p = Max(m + p, n + p);
	
	
Definition min(m,n:N):N = {{m if (m <= n); n otherwise;}};

Corollary Min_1:
	For all n:N,
	min(0,n) = 0;
	
Corollary Min_2:
	For all m,n,p:N,
	min(m,n) = min(n,m);
	
Corollary Min_3:
	For all m,n,p:N,
	min(min(m,n),p) = min(m,min(n,p));
	
Corollary Min_4:
	For all m,n:N,
	min(m,n) <= m;
	
Corollary Min_5:
	For all m,n:N,
	min(m,n) <= Max(m,n);
	
Corollary Min_6:
	For all m,n:N,
	(m <= n) = (min(m,n) = m);
	
Corollary Min_7:
	For all m,n,p:N,
	min(m,n) + p = min(m + p, n + p);
		
end Natural_Number_Ext_Theory;