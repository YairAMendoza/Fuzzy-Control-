close all; clear all; clc;
% Datos = importdata('IrisDataBase.dat')
% Adquisición de datos
dat = fopen('IrisDataBase.dat');
IrisDataBase = textscan(dat, '%f %f %f %f %s');
fclose(dat);
Datos(:,1)=IrisDataBase{2}
Datos(:,2)=IrisDataBase{3}
Datos(:,3)=IrisDataBase{4}
figure(1)
plot3(Datos(:,1),Datos(:,2),Datos(:,3),'.')
grid on;
DatosS=Datos(1:50,:);%Datos Iris-setosa
DatosVS=Datos(51:100,:); %Datos Iris-versicolour
DatosV=Datos(101:150,:);%Datos Iris-virginica
figure(2)
hold on;
plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'.r')
plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'.g')
plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'.b')
grid on;

P=[0,0,1,1;0,1,0,1];
T=[0,1,1,1];
W=[0;0];
b=0;
epocas=input('numero de epocas: ');
tic
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
toc
