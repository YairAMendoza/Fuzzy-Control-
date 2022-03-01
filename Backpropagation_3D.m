
clc,clear all,close all
% Comenzamos el foward propagation.
[X,Y]=meshgrid(-3*pi:.2:3*pi);
[fi co]=size(X);
ME(:,1)=reshape(X,1,fi*co);
ME(:,2)=reshape(Y,1,fi*co);
P=ME';
n1 = 20;  %Numero de neuronas en la capa oculta
ep = 1;   % Ventana de valores iniciales
Q = length(P);
% Valores iniciales
W1 = ep*(2*rand(n1,2)-1);
b1 = ep*(2*rand(n1,1)-1);
W2 = ep*(2*rand(1,n1)-1);
b2 = ep*(2*rand-1);
alfa = 0.04;
    T=sin(sqrt(P(1,:).^2+P(2,:).^2));
figure
for Epocas = 1:500
    sum = 0;
    for q = 1:Q
        % Propagación de la entrada hacia la salida
        a1 = tansig(W1*P(:,q) + b1);
        a2(q) = tansig(W2*a1 + b2);
        % Retropropagación de la sensibilidades
        %T=sin(sqrt(P(1,q).^2+P(2,q).^2));
        e = T(q)-a2(:,q);
        s2 = -2*(1-a2(q)^2)*e;
        s1 = diag(1-a1.^2)*W2'*s2;
        % Actualización de pesos sinapticos y polarizaciones
        W2 = W2 - alfa*s2*a1';
        b2 = b2 - alfa*s2;
        W1 = W1 - alfa*s1*P(:,q)';
        b1 = b1 - alfa*s1;  
        % Sumando el error cuadratico 
        sum = e^2 + sum;
    end
    % Error cuadratico medio
    emedio(Epocas) = sum/Q;
    subplot(1,2,1),plot3(ME(:,1),ME(:,2),a2','.r'),grid on 
    axis([-3*pi 3*pi -3*pi 3*pi -2 2])
    subplot(1,2,2),plot(emedio),grid on 
    pause(0.0001)
end
[X,Y]=meshgrid(-3*pi:.5:3*pi);
x=-3*pi:.5:3*pi;
Z=sin(sqrt(X.^2+Y.^2));
for i=1:length(x)
    n1 = (W1*[X(i);Y(i)])+b1;
    a1 = tansig(n1);
    a2(i) = (W2*a1)+b2;
end
figure, subplot(1,3,1), plot(emedio),grid on,title('Error cuadratico Medio')
 subplot(1,3,2),surf(X,Y,Z,'FaceColor','blue','FaceAlpha',0.3,'EdgeColor','none'),grid on,title('Señal patron')
 axis([-3*pi 3*pi -3*pi 3*pi -2 2]) 
 colormap spring
 subplot(1,3,3),plot3(ME(:,1),ME(:,2),a2','.r'),grid on,title('Señal obtenida')
  axis([-3*pi 3*pi -3*pi 3*pi -2 2])
  
 figure,surf(X,Y,Z,'FaceColor','blue','FaceAlpha',0.9,'EdgeColor','none'),grid on,title('Señal patron'),hold on 
plot3(ME(:,1),ME(:,2),a2','.r'),grid on,title('Señal obtenida')

 
    