clear all,close all,clc;

dat = fopen('IrisDataBase.dat');
IrisDataBase = textscan(dat, '%f %f %f %f %s');
fclose(dat);
Datos(:,1)=IrisDataBase{2};
Datos(:,2)=IrisDataBase{3};
Datos(:,3)=IrisDataBase{4};
figure(1)
plot3(Datos(:,1),Datos(:,2),Datos(:,3),'.')
grid on;
DatosS=Datos(1:50,:);%Datos Iris-setosa
DatosVS=Datos(51:100,:); %Datos Iris-versicolour
DatosV=Datos(101:150,:);%Datos Iris-virginica


%%
P=Datos';
T=[ones(50,1)'*-1,ones(50,1)'*-1,ones(50,1)';
    ones(50,1)'*-1,ones(50,1)',ones(50,1)'];

T1=length(find(T(1,:)<0));
T2=length(find(T(2,:)>0));
W=rand(2,3);
b=rand(2,1);
R=(((1/length(P(1,:)))*P)*P');
Lamax=max(eig(R));
alpha=1/(4*Lamax)*.99;
epocas=input('numero de epocas: ');

for x=1:epocas
    for y=1:length(P(1,:))
      a=hardlims((W*P(:,y))+b);
      e=T(:,y)-a; 
      W=W+(e*alpha*P(:,y)'); % Modificación de pesos
      b=b+e*alpha; % Modificación del valor de b
    end
end
    for k=1:2
        for y=1:length(P(1,:))
             CA(k,y)=purelin((W(k,:)*P(:,y))+b(k));
             
        end
    end
    G1=length(find(CA(1,:)<0));
    G2=length(find(CA(2,:)>0));
   verdadero1=T1;
   verdadero2=T2;
   falso1=T1-G1;
   falso2=T2-G2;
   P=[verdadero1 falso1
   falso2 verdadero2];
   d=(G1+G2)/(T1+T2);
   disp(sprintf('Desempeño=%5.2f%%',d*100))
intp11=-b(1,:)/W(1,1);
intp12=-b(1,:)/W(1,2); 
intp13=-b(1,:)/W(1,3);
intp21=-b(2,:)/W(2,1);
intp22=-b(2,:)/W(2,2);
intp23=-b(2,:)/W(2,3);
%%
%Graficar los planos 

syms x y z x2 y2 z2
A1=[intp11,0,0];B1=[0,intp12,0];C1=[0,0,intp13];
A2=[intp21,0,0];B2=[0,intp22,0];C2=[0,0,intp23];
u=B1-A1; v=C1-A1;
u2=B2-A2;v2=C2-A2;
p=[x-intp11 y-0 z-0;u(1) u(2) u(3) ;v(1) v(2) v(3)];
p2=[x2-intp21 y2-0 z2-0; 
    u2(1) u2(2) u2(3);
    v2(1) v2(2) v2(3)];
EC1=det(p);
EC2=det(p2);
Z=vpa(solve(EC1,'z'),6);
Z2=vpa(solve(EC2,'z2'),6);
[x,y]=meshgrid(0:0.1:6);
[x2,y2]=meshgrid(0:0.1:6);
figure(2)
hold on
% surf(x,y,0.592683*x - 0.23321*y + 0.699018,'facecolor','r')
% surf(x2,y2,0.23653*x2 - 0.663633*y2 + 0.901827,'facecolor','c') 
ezsurf(Z,[0 10 0 10])
colormap cool
ezsurf(Z2,[0 10], [0 10])


plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'.r')
plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'.g')
plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'.b')
grid on;
xlabel('P(1)'),ylabel('P(2)'),zlabel('P(3)')
title('Red ADALINE:Iris ')
 legend('plano de decision 1','plano de decision 2','Clase iris cetosa','Clase iris versicolor','Clase Irisi virginica ','Location','northeastoutside')
hold off
