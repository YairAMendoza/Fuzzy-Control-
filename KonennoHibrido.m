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
W(1,:)=[mean(xy(1,1:50)),mean(xy(2,1:50)),mean(xy(3,1:50))];%rand(1,3);
W(2,:)=[mean(xy(1,51:100)),mean(xy(2,51:100)),mean(xy(3,51:100))];%rand(1,3);
W(3,:)=[mean(xy(1,101:150)),mean(xy(2,101:150)),mean(xy(3,101:150))];%rand(1,3)
s=-10:0.01:10;
plot3(W(1,1),W(2,1),W(3,1),'pk',W(1,2),W(2,2),W(3,2),'hk',W(1,3),W(2,3),W(3,3),'vk')
C(1,:)=W(1,:);
C(2,:)=W(2,:);
C(3,:)=W(3,:);
pause;% se grafican los pesos iniciales
sigm=0.9;
while sigm>.1
  numr=round(rand(1)*(length(xy(1,:))-1))+1; %se selecciona al azar uno de los datos 
  
        d(1)=sqrt((xy(:,numr)-W(1,:)')'*(xy(:,numr)-W(1,:)'));
        d(2)=sqrt((xy(:,numr)-W(2,:)')'*(xy(:,numr)-W(2,:)'));
        d(3)=sqrt((xy(:,numr)-W(3,:)')'*(xy(:,numr)-W(3,:)'));
        a=gaussmf(d,[sigm,0]);
        W(1,:)=W(1,:)+a(1)*(xy(:,numr)'-W(1,:));
        W(2,:)=W(2,:)+a(2)*(xy(:,numr)'-W(2,:));
        W(3,:)=W(3,:)+a(3)*(xy(:,numr)'-W(3,:));
  %se modifican los pesos segun los resultados anteriores
  plot3(W(1,1),W(2,1),W(3,1),'pm',W(1,2),W(2,2),W(3,2),'hm',W(1,3),W(2,3),W(3,3),'vm') % se grafica el movimiento que tienen los pesos 
  pause(.06) %se da tiempo para que se despliegue la animacion en pantalla
  sigm=sigm-.025;% se decrementa el valor de sigma
end
figure
plot3(xy(1,1:50),xy(2,1:50),xy(3,1:50),'*r',xy(1,51:100),xy(2,51:100),xy(3,51:100),'+g',xy(1,101:150),xy(2,101:150),xy(3,101:150),'^b',W(1,1),W(2,1),W(3,1),'pk',W(1,2),W(2,2),W(3,2),'hk',W(1,3),W(2,3),W(3,3),'vk')
grid on;