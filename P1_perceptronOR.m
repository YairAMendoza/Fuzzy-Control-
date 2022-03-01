clc, clear all, close all;

%Red perceptron 
%utilice el algoritmo perceptron para clasificar correctamente los
%siguientes patrones 
P=[0,0,1,1;0,1,0,1];
T=[0,1,1,1];
W=[0;0];
b=0;
epocas=input('numero de epocas: ');
for x=1:epocas
    for y=1:length(P)
 a=hardlim(W'*P(:,y)+b); % Salida de la red
 e=T(y)-a; % Error
 
 W=W+e*P(:,y); % Modificación de pesos
 b=b+e; % Modificación del valor de b
    end
end
intp1=-b/W(1,:);
intp2=-b/W(2,:);
m=(intp2-0)/(0-intp1);
mw=-1/m;
l =linspace(-2,2,100);
lw=linspace(1,0.3,100);
f=(m*l)+intp2;

fw=mw*l+intp2;

plotpv(P,T) 
hold on 
plot(f,l,'r',fw,lw,'g')
