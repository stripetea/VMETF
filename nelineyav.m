
L=5; %
M=101;
h=L/(M-1);
tau=0.01;
N=100;

%���������
Hi=0.1;
TeT=0.8;
sig = 2;
DD=1;

%��������� �������
for i=1:1:M
    T(1,i)=0;
end




%�������

for i=1:1:N

   %�������� 
   %��������� �������
    T(1,1) = (sig*DD*DD*(i-1)*tau/Hi).^(1/sig); %
    T(2,1) = (sig*DD*DD*(i)*tau/Hi).^(1/sig);   %
   %������������ �������
   for j=2:1:M-1
        A(j) = Hi*tau*(1-TeT)*(T(1,j-1).^sig)/(2*h*h);
        B(j) = Hi*tau*(1-TeT)*(T(1,j+1).^sig)/(2*h*h);
        C(j) = 1 + A(j) + B(j);
        D(j) = tau*(1-TeT)*Hi/(2*h*h)*(T(1,j+1)*(T(1,j+1).^sig) + T(1,j-1)*(T(1,j-1).^sig)) + (1 - Hi*tau*(1-TeT)/(2*h*h)*((T(1,j+1).^sig) + (T(1,j-1).^sig)))*T(1,j);
   end
   
   %����������� 

    Beta(1) = T(2,1);    %
   Alfa(1) = 0; 
    

    %
    
   for j=2:1:M-1
       Alfa(j+1) = B(j)/(C(j) - A(j)*Alfa(j));                         %
       Beta(j+1) = (D(j) + A(j)*Beta(j))/(C(j) - A(j)*Alfa(j));        %
   end
   
   T(2,M) = 0;
  
     Beta(1) = T(2,1);    %
   Alfa(1) = 0;  
   for j=1:1:M-1
       T(2,M-j) = Alfa(M-j+1)*T(2,M-j+1) + Beta(M-j+1);
   end
   
   for j =1:1:M
       T(1,j) = T(2,j);
   end
end


%�������� �������� �� �
for i=1:1:M
    X(i)=(i-1)*h;
end
 
        %�������� �������� Y
for i=1:1:M
    Y(i)=T(2,i);
end


%���������� �������
for i=1:1:N
    for j=1:1:M
        if h*j <= DD*i*tau
            Y0(j) = ((sig*DD/Hi).^(1/sig))*((DD*i*tau-(j-1)*h).^(1/sig));
        else Y0(j)=0;
        end
    end
end


plot(X, Y, X, Y0);

