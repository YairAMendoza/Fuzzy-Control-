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

figure
plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'ro','markerFaceColor','r')
hold on 
plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'go','markerFaceColor','g')
plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'bo','markerFaceColor','b')
grid on;
xy=Datos';
cm=sum(xy,2)/length(xy(1,:)); 
w=rand(3,3); 
w(1,:)=w(1,:)+cm(1); 
w(2,:)=w(2,:)+cm(2);
w(3,:)=w(3,:)+cm(3);
alph=.5; 
plot3(w(1,1),w(2,1),w(3,1),'*k',w(1,2),w(2,2),w(3,2),'*k',w(1,3),w(2,3),w(3,3),'*k')
xlabel('P(1)'),ylabel('P(2)'),zlabel('P(3)')...
    ,legend('Clase 1','Clase 2','Clase 3','Puntos iniciales random')
C(1,:)=w(1,:);
C(2,:)=w(2,:);
C(3,:)=w(3,:);
pause;
while alph>.1
  numr=round(rand(1)*149)+1; 
  a=max(compet((sum(w.*w)'-(2*w'*xy(:,numr))+(xy(:,numr)'*xy(:,numr)))*-1).*[1:3]'); 
  w(:,a)=w(:,a)+alph*(xy(:,numr)-w(:,a)); %modifico los pesos  de la neurona ganadora
  alph=alph-.005; %decremento el valor de alpha
  plot3(w(1,1),w(2,1),w(3,1),'pm',w(1,2),w(2,2),w(3,2),'hm',w(1,3),w(2,3),w(3,3),'vm') %grafico el movimiento que van teniendo los pesos
  pause(.06) %doy tiempo para que se despliegue lo anterior

end
figure
plot3(DatosS(:,1),DatosS(:,2),DatosS(:,3),'ro','markerFaceColor','r')
hold on  
plot3(DatosVS(:,1),DatosVS(:,2),DatosVS(:,3),'go','markerFaceColor','g')
plot3(DatosV(:,1),DatosV(:,2),DatosV(:,3),'bo','markerFaceColor','b')
grid on;
plot3(C(1,1),C(2,1),C(3,1),'*m',C(1,2),C(2,2),C(3,2),'*m',C(1,3),C(2,3),C(3,3),'*m')
plot3(w(1,1),w(2,1),w(3,1),'pk',w(1,2),w(2,2),w(3,2),'pk',w(1,3),w(2,3),w(3,3),'pk','markerFaceColor','k')
xlabel('P(1)'),ylabel('P(2)'),zlabel('P(3)')...
 ,legend('Clase 1','Clase 2','Clase 3','Puntos iniciales random','','','Centro de clase generado')