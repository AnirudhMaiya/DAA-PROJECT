function [solution] = Gaussian(a,b)
  a = [a b];
  [m1,n1] = size(a);
  c = 1;
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
		  disp(a);
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
x=zeros(1,m1);
for s=m1:-1:1
    dummy=0;
    for k=2:m1
        dummy=dummy+a(s,k)*x(k);
    end
	%disp(a(s,n))
    x(s)=(a(s,n1)-dummy)/a(s,s);
end
disp('Solutions are');
%disp(a);
disp(x');
disp('Matrix after Gaussian Elimination is');
disp(a);
printf("\n");
end

