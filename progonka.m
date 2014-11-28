%ÇÀÄÀ×À 2 ßÂÍÀß ÑÕÅÌÀ

%âñÿêèå òåõíè÷åñêèå øòóêè íîìåğà

L=5; %
M=101;
h=L/(M-1);
tau=0.01;
N=100;

%ÏÀĞÀÌÅÒĞÛ
Hi=0.1;
T_g=300;
TeT=2;


%ÍÀ×ÀËÜÍÛÅ ÓÑËÎÂÈß
for i=1:1:M
    T(1,i)=0;
end
%ÃĞÀÍÈ×ÍÛÅ ÓÑËÎÂÈß
T(2,1) = T_g;
T(1,1) = T_g;
%ÑÎÇÄÀÍÈÅ ÇÍÀ×ÅÍÈÉ ÏÎ Õ
for i=1:1:M
    X(i)=(i-1)*h;
end

%Ñ×ÈÒÀÒÜ

for i=1:1:N

   %ÏĞÎÃÎÍÊÀ 
   
   %ÊÎİÔÔÈÖÈÅÍÒÛ ÑÈÑÒÅÌÛ
   A = Hi*tau*TeT/(h*h);
   B = A;
   C = 1 + 2*Hi*tau*TeT/(h*h);
   for j=2:1:M-1
       D(j) = T(1,j) + Hi*tau*(1-TeT)/(h*h)*(T(1,j+1) -2*T(1,j) + T(1,j-1));
   end
   
   %ÏĞÎÃÎÍÎ×ÍÛÅ 

   Beta(2) = T_g; 
   Alfa(2) = 0;
    
   for j=2:1:M-1
       Alfa(j+1) = B/(C - A*Alfa(j));
       Beta(j+1) = (D(j) + A*Beta(j))/(C - A*Alfa(j));
   end
   
   T(2,M) = 0;
   
   for j=1:1:M-2
       T(2,M-j) = Alfa(M-j+1)*T(2,M-j+1) + Beta(M-j+1);
   end
   
   for j =1:1:M
       T(1,j) = T(2,j);
   end
end


 
        %ÑÎÇÄÀÍÈÅ ÇÍÀ×ÅÍÈÉ Y
for i=1:1:M
    Y(i)=T(2,i);
end



for i=1:1:M
    eta = h*(i-1)/(2*sqrt(Hi*tau*N));
    Y1(i)=T_g*(erfc(eta));
end

plot(X, Y, X, Y1);
