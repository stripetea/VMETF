%������ 2 ����� �����

%������ ����������� ����� ������

L=5; %
M=101;
h=L/(M-1);
tau=0.01;
N=100;

%���������
Hi=0.1;
T_g=300;

%��������� �������
for i=1:1:M
    T(1,i)=0;
end

%��������� �������
for i=1:1:N
    T(i,1)=T_g;
end

%�������

%�������� �������� �� �
for i=1:1:M
    X(i)=(i-1)*h;
end

for i=1:1:N
    
    for j=2:1:M-1
        %T(i+1,j) = T(i,j) + (tau*Hi/(h*h))*(T(i,j+1)-2*T(i,j)+T(i,j-1)); %��� ���� ������� �� ��� ���� �� ������� ������
        %�� ��� ����
        T(2,j) = T(1,j) + (tau*Hi/(h*h))*(T(1,j+1)-2*T(1,j)+T(1,j-1));
             
    end
   % T(2,M)=0;
    for j=1:1:M
        T(1,j) = T(2,j);
    end
        
end
T(1,N)=300;

 
        %�������� �������� �� Y
for i=1:1:M
    Y0(i)=T(2,i);
end




for i=1:1:M
    eta = h*(i-1)/(2*sqrt(Hi*tau*N));
    Y1(i)=T_g*(erfc(eta));
end

plot(X, Y0, X, Y1);
