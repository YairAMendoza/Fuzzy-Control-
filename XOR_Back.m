clc,clear all,close all
% Patrones de aprendizaje y objetivos
P = [0 0 1 1;
     0 1 0 1]; 
T = [0 1 1 0];  
Q = length(P);
% Valores iniciales
W1=rand(2,2);
b1=rand(2,1);
W2=rand(1,2);
b2=rand;
alfa = 0.05;
for Epocas = 1:1000
    sum = 0;
    for q = 1:Q
        % Propagación de la entrada hacia la salida
        a1 = tansig(W1*P(:,q) + b1);
        a2(q) = tansig(W2*a1 + b2);
        
        e = T(q)-a2(q);
        s2 = -2*(1-a2(q)^2)*e;
        s1 = diag(1-a1.^2)*W2'*s2;
       
        W2 = W2 - alfa*s2*a1';
        b2 = b2 - alfa*s2;
        W1 = W1 - alfa*s1*P(:,q)';
        b1 = b1 - alfa*s1;  
        % Sumando el error cuadratico 
        sum = e^2 + sum;
    end
    % Error cuadratico medio
    emedio(Epocas) = sum/Q;
end
figure, subplot(1,2,1), plot(emedio),title('Error cuadratico medio')

% Verificación de la respuesta de la multicapa
for q = 1:Q
    a(q) = tansig(W2*tansig(W1*P(:,q) + b1)+ b2);
end
a
% Frontera de decisión
u = linspace(-2, 2, 100);
v = linspace(-2, 2, 100);
for i = 1:length(u)
    for j = 1:length(v)
        z(i,j) = tansig(W2*tansig(W1*[u(i); v(j)] + b1) + b2);   
    end
end
subplot(1,2,2), hold on, contour(u, v, z',[-0.9, 0, 0.9],'LineWidth', 2)  
axis([-0.5 1.5 -0.5 1.5]), plot(P(1,[1,4]),P(2,[1,4]),'ro', P(1,[2,3]),P(2,[2,3]),'bo'),title('Compuerta XOR')
