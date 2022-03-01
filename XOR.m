clear all; close all; clc;
P=[0 0 1 1;0 1 0 1];
T=[-1 1 1 -1];
 W=rand(2,1);
 b=rand;
for x=1:1000
    for y=1:length(P)
 a=purelin(W'*P(:,y)+b); % Salida de la red
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
grid on 
plot(f,l,'r')

