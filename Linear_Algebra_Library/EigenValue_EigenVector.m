function x = eig123(A)
warning('off', 'all');
syms a d
[m,n] = size(A);
I = eye(m);
v = [];
%v = diag(v);
brick = A -(d*I);
w = (det(brick));
p = sym2poly(w);
r = roots(p);
r = real(r);
%disp(r);
for i = 1:length(r)
		fprintf('Eigen Value is %f',(r(i)));
		disp("\n");
		disp(null((subs(brick,r(i)))));
		printf("\n");
		printf("\n");

end
%disp(x);
%printf("\n");
end