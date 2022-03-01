clc,clear all,close all
w1=rand(2,1);
b1=rand(2,1);
w2=rand(2,1);
b2=rand;

patron=-2:.5:2;
patron=patron';
alpha=0.08;
for epoca=1:100
    LMS=0;
for i=1:length(patron)
    a0=patron(i);
    n1=w1*a0+b1;
    a1=tansig(n1);
    
    n2=w2'*a1+b2;
    a2=purelin(n2);
    
    % Calculamos el error.
    t=1+sin((pi/4)*patron(i));
    e=t-a2; 
    % Calculamos la sensitividad.
    s2=-2*1*e;
    s1=diag(((1-a1).*a1))*w2*s2;
    % Actualizamos las w's y b's
    w2=w2-(alpha*s2*a1);
    b2=b2-(s2*alpha);
    
    w1=w1-(alpha*s1*a0);
    b1=b1-(s1*alpha);
     LMS= e^2 + LMS;
  alpha=alpha-0.0001;
end
 Emedio(epoca) = LMS/length(patron);
 
end
%entrenamiento
x = -2:0.1:2;
s = 1 + sin((pi/4)*x);
figure, hold on, plot(x,s,'r'), hold off,grid on,title('Funcion Patron')
figure, subplot(1,2,1), plot(Emedio),grid on,title('Error cuadratico Medio')
for i=1:length(x)
    n1 = (w1*x(i))+b1;
    a1 = tansig(n1);
    a2(i) = (w2'*a1)+b2;
end
 subplot(1,2,2), hold on, plot(x,s,'r'),plot(x,a2,'b'), hold off,grid on,title('Señal obtenida VS Señal patron')
 
    