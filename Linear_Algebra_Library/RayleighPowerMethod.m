function aer = ray(a)

b = a;
x = zeros(size(a,1),1);
x(1) = 1;
c = a*x;
d = max(abs(c));
c = c/d;


e = a*c;
f = max(abs(e));
g = e/f;

while(1)
	if(sum(c-g) <0.00000000000001)
		printf("The largest Eigen Value is %f  \n",f);
		%disp(f);
		break
	endif
	c = a*g;
	d = max(abs(c));
	c = c/d;


	e = a*c;
	f = max(abs(e));
	g = e/f;
end
%disp(c);
printf("\n");
%x= g;
printf("The corresponding eigen vector is : \n");
disp(g);
printf("\n");
end