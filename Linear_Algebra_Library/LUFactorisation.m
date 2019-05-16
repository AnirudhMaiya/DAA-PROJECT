function [lw,dia,up] = lu1(a)
%a = [1 1 -1;8 0 3;-1 1 -2];
%b= [9 ;3 ;2];
%a = [1 1 -1;0 0 3;-1 1 -2];
  [m1,n1] = size(a);
  perm = eye(m1);
  lower = eye(m1);
  if(a(1,1) == 0)
	for k = 2:m1
		if (a(k,1)>0)
			temp = a(1,:);
			a(1,:) = a(k,:);
			a(k,:) = temp;
		endif
	endfor
	endif
  for i = 1:m1
    if a(i,i) ==0
       for k = 1:m1
          if a(k,k) != 0 && i+k<m1+1
          temp = a(i,:);
		  a(i,:) = a(i+k,:);
		  a(i+k,:) = temp;
		  temp = perm(i,:);
		  perm(i,:) = perm(i+k,:);
		  perm(i+k,:) = temp;
		  %disp(perm);
		  temp = lower(i,:);
		  lower(i,:) = lower(i+k,:);
		  lower(i+k,:) = temp;
		  %disp(lower);
          break
          endif
       endfor
     endif
	for j = 1:m1
        if i+j < m1+1  
          l = a(i+j,i)/a(i,i);
          a(i+j,:) = a(i+j,:) - l*a(i,:);
		  lower(i+j,:) = lower(i+j,:) - l*lower(i,:);
		  %disp(lower)
        endif
     endfor
endfor
for k = 1:m1
	b(k,k) = a(k,k);
endfor
c = a;
for k  = 1:m1
	c(k,:) = c(k,:)/b(k,k);
endfor
disp("Lower Triangular Matrix is : ");
disp(inv(lower));
printf("\n");
disp("Diagonal Matrix is : ");
disp(b);
printf("\n");
disp("Upper Triangular Matrix is : ");
disp(c);
printf("\n");
[fw,lw] = gauss_jordan(lower);
up =  c;
dia = b;
end