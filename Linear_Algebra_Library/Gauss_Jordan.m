function [ans,ide] = gauss_jordan(a)
%a = [2 1 1;4 -6 0;-2 7 2];
dummy_size = size(a,1);
I = eye(dummy_size);
a = [a I];
[m1,n1] = size(a);
  if(a(1,1) == 0)
	for k = 2:m1                     % if first pivot = 0
		if (a(k,1)>0)
			temp = a(1,1);
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
		  %disp(a);
          break
          endif
       endfor
     endif
     for j = 1:m1
        if i+j < m1+1  
          l = a(i+j,i)/a(i,i);
          a(i+j,:) = a(i+j,:) - l*a(i,:);
        endif
     endfor
endfor
r = zeros(dummy_size);
I = zeros(dummy_size);
for k = 1:dummy_size*dummy_size
	r(k) = a(k);
	endfor							%resizing upper

for k = 1:dummy_size*dummy_size
	I(k) = a(k+(dummy_size*dummy_size));
	endfor                                               %resizing L 
%disp(I);
%disp(r);
for j = dummy_size:-1:2
	for i = j-1:-1:1
		l = r(i,j)/r(j,j);
		r(i,j) = r(i,j) - l*r(j,j); 
		I(i,:) = I(i,:) - l*I(j,:);
		%disp(l);
	endfor
endfor


for i = 1:dummy_size
	I(i,:) = I(i,:)/r(i,i);
	r(i,i) = 1;
endfor
%disp("Inverse of Matrix is : ");
%disp(I);
%printf("\n");
ans = r;
ide = I;
end
