%мекхмеимне спюбмемхе

%БЯЪЙХЕ РЕУМХВЕЯЙХЕ ЬРСЙХ МНЛЕПЮ

L=5; %
M=51;
h=L/(M-1);
tau=0.01;
N=100;

%оюпюлерпш
Hi=0.1;

sig=2;
DD=1;

%мювюкэмше сякнбхъ
for i=1:1:M
    T(1,i)=0;
end


%явхрюрэ



for i=1:1:N
    T(1,1) = (sig*DD*DD*(i-1)*tau/Hi).^(1/sig);
    T(2,1) = (sig*DD*DD*(i)*tau/Hi).^(1/sig);
    for j=2:1:M-1
        T(2,j) = T(1,j) + (tau*Hi/(2*h*h))*((T(1,j+1)-T(1,j))*((T(1,j+1)).^sig) - (T(1,j)-T(1,j-1))*((T(1,j-1)).^sig));          
       
    end
   
    for j=2:1:M-1
         T(1,j) = T(2,j);
    end
end


 
        %янгдюмхе гмювемхи он Y
for i=1:1:M
    Y(i)=T(2,i);
end

%янгдюмхе гмювемхи он у
for i=1:1:M
    X(i)=(i-1)*h;
end

%опюбхкэмне пеьемхе
for i=1:1:N
    for j=1:1:M
        if h*j <= DD*i*tau
            Y0(j) = ((sig*DD/Hi).^(1/sig))*((DD*i*tau-(j-1)*h).^(1/sig));
        else Y0(j)=0;
        end
    end
end

    


plot(X, Y, X, Y0)



