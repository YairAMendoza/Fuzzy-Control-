
clear all;close all;clc;
dat = fopen('IrisDataBase.dat'); 
IrisDataBase = textscan(dat, '%f %f %f %f %s');
sigm=5; % inicializo el valor de sigma
fclose(dat);
Datos(:,1)=IrisDataBase{1};
Datos(:,2)=IrisDataBase{2};
Datos(:,3)=IrisDataBase{3};
DatosS=Datos(1:50,:);%Datos Iris-setosa
DatosVS=Datos(51:100,:); %Datos Iris-versicolour
DatosV=Datos(101:150,:);%Datos Iris-virginica
figure
hold on;
plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'or','markerFaceColor','r') 
plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'og','markerFaceColor','g')
plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'ob','markerFaceColor','b')
grid on;
xy=Datos';% guardo la transpuesta de los datos para facilitar los calculos
w=[3.9,8.3,4.4;
    2.9,2,3.2;
    1.5,3.8,3.4] ;%se inicializan los pesos
alph=.2; % se inicializa el valor de alpha
plot3(w(1,1),w(2,1),w(3,1),'*k',w(1,2),w(2,2),w(3,2),'*k',w(1,3),w(2,3),w(3,3),'*k') % se grafican los pesos iniciales
xlabel('P(1)'),ylabel('P(2)'),zlabel('P(3)')...
 ,legend('Clase 1','Clase 2','Clase 3','Puntos iniciales random')
pause();
while alph>.001
   numr=round(rand(1)*(length(xy(1,:))-1))+1; %se selecciona al azar uno de los datos 
   a=(sum(w.*w)'-(2*w'*xy(:,numr))+(xy(:,numr)'*xy(:,numr))); %se calculan las distancias de los pesos al punto seleccionado anteriormente
   Beta=[1;1;1]*exp((-1/2)*(a/sigm).^2)'; %se hace el calculo de la distribucion normal
   w=w+(alph*Beta.*(([1;1;1]*xy(:,numr)')'-w)); %se modifican los pesos segun los resultados anteriores
  B=Beta(1,:)
  alph=alph-.005; %se va decrementando alpha
  plot3(w(1,1),w(2,1),w(3,1),'pm',w(1,2),w(2,2),w(3,2),'hm',w(1,3),w(2,3),w(3,3),'vm') % se grafica el movimiento que tienen los pesos
  pause(.01) %se da tiempo para que se despliegue la animacion en pantalla
  sigm=sigm-.025;% se decrementa el valor de sigma
end
figure
plot3(xy(1,1:50),xy(2,1:50),xy(3,1:50),'or','markerFaceColor','r')
hold on
plot3(xy(1,51:100),xy(2,51:100),xy(3,51:100),'og','markerFaceColor','g')
plot3(xy(1,101:150),xy(2,101:150),xy(3,101:150),'ob','markerFaceColor','b')
plot3(w(1,1),w(2,1),w(3,1),'pk',w(1,2),w(2,2),w(3,2),'pk',w(1,3),w(2,3),w(3,3),'pk','markerFaceColor','k')
grid on;
xlabel('P(1)'),ylabel('P(2)'),zlabel('P(3)')...
 ,legend('Clase 1','Clase 2','Clase 3','Centro de clase generado')