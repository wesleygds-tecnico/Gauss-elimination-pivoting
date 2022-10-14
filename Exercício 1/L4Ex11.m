function [] = L4Ex11
A = zeros(12);
n = length(A);
B = ones(12,1);
for i = 1:n
    for j = 1:n
        A(i,j) = 1/(i+j-1);
    end
end
disp(A)
D = A;
for j = 1:n-1                     %coluna
    for i = n-1:-1:1              %linha
        if(A(i+1,j)>A(i,j))         %Pivoteamento
            C = A(i,:);
            A(i,:) = A(i+1,:); 
            A(i+1,:) = C;
            C = B(i);
            B(i) = B(i+1);
            B(i+1) = C;
        end
    end
end
for j = 1:(n-1)             %Eliminação de Gauss
    for i = j+1:(n)        
        m = A(i,j)/A(j,j);
        A(i,j) = A(i,j) - A(j,j)*m;
        for k = (j+1):n
            A(i,k) = A(i,k) - A(j,k)*m;
        end
        B(i) = B(i) - B(j)*m;
    end
end
fprintf('O sistema é definido por: \n')
fprintf('A \n')
disp(A)
fprintf('B \n')
disp(B)
x = zeros(n,1);
x(n) = B(n)/A(n,n);
    for i = (n-1):-1:1
        soma = 0;
        for j = (i+1):n
            soma = soma + x(j)*A(i,j);       
        end
        x(i) = (B(i) - soma)/A(i,i);
    end 
fprintf('A solução encontrada é: \n')
disp(x)
fprintf('Verificação \n')
E = D*x;
disp(E)
end