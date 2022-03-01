clc, clear all, close all;
%Red ADALINE
%utilice el algoritmo ADALINE para clasificar correctamente los
%siguientes patrones 
P=[0,0,1,1;0,1,0,1];
T=[-1,1,1,1];
W=rand(2,1);
b=rand;
R=(((1/4)*P)*P');
Lamax=max(eig(R));
alpha=1/(4*Lamax)*.99;
epocas=input('numero de epocas: ');
R2=0;
for x=1:epocas
    for y=1:length(P)
 a=purelin(W'*P(:,y)+b); % Salida de la red
 e=T(y)-a; % Error
 W=W+e*alpha*P(:,y); % Modificación de pesos
 b=b+e*alpha; % Modificación del valor de b
    end
end
intp1=-b/W(1,:);
intp2=-b/W(2,:);
m=(intp2-0)/(0-intp1);
mw=-1/m;
l =linspace(-1,1.5,80);
lw=linspace(0,1.5,20);
f=(m*l)+intp2;
fw=mw*lw+intp2;
%Graficar Frontera y vector de pesos 
hold on 
axis([-0.5,1.5,-0.5,1.5])
plot(P(1,1),P(2,1),'o','MarkeredgeColor',[113/255,200/255,8/255],'MarkerFaceColor',[113/255,200/255,8/255])
plot(P(1,2:4),P(2,2:4),'^','MarkeredgeColor',[12/255,196/255,192/255],'MarkerFaceColor',[12/255,196/255,192/255])
plot(f,l,'m','Linewidth',2,'color',[255/255,102/255,0/255])
plot(fw,lw,'g:','Linewidth',2,'color',[203/255,5/255,104/255]),title('RED ADALINE PARA COMPUERTA OR')
xlabel('P(1)'),ylabel('P(2)'),legend('Clase 1','Clase 2','Frontera','Vector de peso','Location','northeastoutside')
grid on 
hold off

