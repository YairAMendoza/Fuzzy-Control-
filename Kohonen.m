clc,clear all,close all
dat = fopen('Datacomp.dat');
Datacomp = textscan(dat, '%f %f %s');
fclose(dat);
Datos(:,1)=Datacomp{1};
Datos(:,2)=Datacomp{2};
DatosS=Datos(1:15,:);
DatosVS=Datos(16:20,:); 
DatosV=Datos(21:30,:); 
figure(1)
plot(DatosS(:,1),DatosS(:,2),'ro','markerFaceColor','r')
hold on 
plot(DatosVS(:,1),DatosVS(:,2),'go','markerFaceColor','g')
plot(DatosV(:,1),DatosV(:,2),'bo','markerFaceColor','b')
grid on;
xy=Datos';
cm=sum(xy,2)/length(xy(1,:)); 
w=rand(2,3); 
w(1,:)=w(1,:)+cm(1); 
w(2,:)=w(2,:)+cm(2);
alph=.5; 
plot(w(1,1),w(2,1),'*k',w(1,2),w(2,2),'*k',w(1,3),w(2,3),'*k')
xlabel('P(1)'),ylabel('P(2)')...
 ,legend('Clase 1','Clase 2','Clase 3','Puntos iniciales random')
C(1,:)=w(1,:);
C(2,:)=w(2,:);
s=-15:0.01:15;
pause;
sigm=3.5;
pause();
while sigm>.1
  numr=round(rand(1)*29)+1; 
  a=max(compet((sum(w.*w)'-(2*w'*xy(:,numr))+(xy(:,numr)'*xy(:,numr)))*-1).*[1:3]'); 
  multp=exp((-1/2)*(a/sigm).^2);
  B=exp((-1/2)*((s-a)/sigm).^2);
  w(:,a)=w(:,a)+multp*(xy(:,numr)-w(:,a)); %modifico los pesos  de la neurona ganadora
  sigm=sigm-.025; 
  hold on 
  subplot(1,2,1),plot(w(1,1),w(2,1),'pm',w(1,2),w(2,2),'hm',w(1,3),w(2,3),'vm') %grafico el movimiento que van teniendo los pesos
  hold on
  subplot(1,2,1), plot(DatosS(:,1),DatosS(:,2),'ro','markerFaceColor','r')
  subplot(1,2,1),plot(DatosVS(:,1),DatosVS(:,2),'go','markerFaceColor','g')
  subplot(1,2,1),plot(DatosV(:,1),DatosV(:,2),'bo','markerFaceColor','b')
  title('Busqueda de los centros de la clase ')
  grid on
  subplot(1,2,2),plot(B),title('Campana de Gauss')
  grid  on   
  pause(.06) %doy tiempo para que se despliegue lo anterior
end
figure
plot(DatosS(:,1),DatosS(:,2),'ro','markerFaceColor','r')
hold on  
plot(DatosVS(:,1),DatosVS(:,2),'go','markerFaceColor','g')
plot(DatosV(:,1),DatosV(:,2),'bo','markerFaceColor','b')
grid on;
plot(C(1,1),C(2,1),'*m',C(1,2),C(2,2),'*m',C(1,3),C(2,3),'*m')
plot(w(1,1),w(2,1),'pk',w(1,2),w(2,2),'pk',w(1,3),w(2,3),'pk','markerFaceColor','k')
xlabel('P(1)'),ylabel('P(2)')...
 ,legend('Clase 1','Clase 2','Clase 3','Puntos iniciales random','','','Centros Encontrados')