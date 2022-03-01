clc,clear all,close all
dat = fopen('IrisDataBase.dat');
IrisDataBase=textscan(dat, '%f %f %f %f %s');
fclose(dat);
Datos(:,1)=IrisDataBase{2};
Datos(:,2)=IrisDataBase{3};
Datos(:,3)=IrisDataBase{4};
DatosS=Datos(1:50,:);
DatosVS=Datos(51:100,:); 
DatosV=Datos(101:150,:);
figure(1)
plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'r.')
hold on 
plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'g.')
plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'b.')
grid on;
xy=Datos';% guardo la transpuesta de los datos para facilitar los calculos
cm=sum(xy,2)/length(xy(1,:)); 
w=rand(3,3); 
w(1,:)=w(1,:)+cm(1)
w(2,:)=w(2,:)+cm(2);
w(3,:)=w(3,:)+cm(3);
s=-10:0.01:10;
plot3(w(1,1),w(2,1),w(3,1),'pk',w(1,2),w(2,2),w(3,2),'hk',w(1,3),w(2,3),w(3,3),'vk')
C(1,:)=w(1,:);
C(2,:)=w(2,:);
C(3,:)=w(3,:);
pause;% se grafican los pesos iniciales
sigm=3.5;
figure
while sigm>.1
  numr=round(rand(1)*(length(xy(1,:))-1))+1; %se selecciona al azar uno de los datos 
  a=max(compet((sum(w.*w)'-(2*w'*xy(:,numr))+(xy(:,numr)'*xy(:,numr)))*-1).*[1:3]'); 
  multp=exp((-1/2)*(a/sigm).^2);
  B=exp((-1/2)*((s-a)/sigm).^2);%se hace el calculo de la distribucion normal
  w(:,a)=w(:,a)+multp*(xy(:,numr)-w(:,a)); %se modifican los pesos segun los resultados anteriores
  hold on 
  grid on
  subplot(2,1,2),plot(B)
  hold on 
  grid on
  subplot(2,1,1),plot3(w(1,1),w(2,1),w(3,1),'pm',w(1,2),w(2,2),w(3,2),'hm',w(1,3),w(2,3),w(3,3),'vm') % se grafica el movimiento que tienen los pesos
 
  plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'r.')
  plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'g.')
  plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'b.')
  
  pause(.06) %se da tiempo para que se despliegue la animacion en pantalla
  sigm=sigm-.025;% se decrementa el valor de sigma
end
figure,plot(B)
figure
plot3(xy(1,1:50),xy(2,1:50),xy(3,1:50),'*r',xy(1,51:100),xy(2,51:100),xy(3,51:100),'+g',xy(1,101:150),xy(2,101:150),xy(3,101:150),'^b',w(1,1),w(2,1),w(3,1),'pk',w(1,2),w(2,2),w(3,2),'hk',w(1,3),w(2,3),w(3,3),'vk')
grid on;