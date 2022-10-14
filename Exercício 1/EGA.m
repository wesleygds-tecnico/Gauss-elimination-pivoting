function [] = EGA(A,B)
D = A;
n = length(A);
if (det(A)~=0)
    for j = 1:(n-1)
        for i = (j+1):n
            if (A(j,j) == 0)
                C = A(j,:);
                A(j,:) = A(j+1,:);
                A(j+1,:) = C;
                C = B(j,1);
                B(j,1) = B(j+1,1);
                B(j+1,1) = C;
            else
                m = A(i,j)/A(j,j);
                A(i,j) = A(i,j) - A(j,j)*m;
                for k = (j+1):n
                     A(i,k) = A(i,k) - A(j,k)*m; 
                end
                B(i) = B(i) - B(j)*m;
            end
        end
    end
    fprintf('O sistema equivalente é definido por: \n');
    disp(A)
    disp(B)
    x = zeros(n,1);
    x(end) = B(end)/(A(end,end));
    for i = (n-1):-1:1 
        soma = 0;
        for j = (i+1):n
            soma = soma + x(j)*A(i,j);
        end
        x(i) = (B(i) - soma)/A(i,i);
    end
else
    fprintf('Sistema impossível');
end
fprintf('O resultado do sistema é: \n')
disp(x)
fprintf('Verificação \n')
C = D*x;
disp(C)
C = -det(A);
fprintf('A determinante da matriz triangular é: %d \n', C)
end


