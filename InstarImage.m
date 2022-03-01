clc,clear all,close all;
Ima=imread('pat2.jpg');
Id=double(Ima);
figure,imshow(Ima),title('Imagen para entrenar');
Cr=Ima(:,:,1);
Cg=Ima(:,:,2);
Cb=Ima(:,:,3);
%obtencion de los patrones de entrenamiento 
figure(2)
plot3(Ima(:,:,1),Ima(:,:,2),Ima(:,:,3),'m.')
hold on 
xlabel('Niveles de rojo'),ylabel('Niveles de verde'),zlabel('Niveles de azul')
title('Puntos de entrenamiento')
grid on 
Crv=[Cr(:)'];
Cgv=[Cg(:)'];
Cbv=[Cb(:)'];
Datos=[Crv;Cgv;Cbv]';
xy=double(Datos');
cm=sum(xy,2)/length(xy(1,:)); 
w=zeros(4,3); 
w(1,:)=[221,220,218]+20;
w(2,:)=[101,113,27]+20;
w(3,:)=[139,45,35]+20;
w(4,:)=[168,108,22]+20;
alph=.5; 
plot3(w(1,1),w(1,2),w(1,3),'*k',w(2,1),w(2,2),w(2,3),'*k',w(3,1),w(3,2),w(3,3),'*k',w(4,1),w(4,2),w(4,3),'*k')
C(1,:)=w(1,:);
C(2,:)=w(2,:);
C(3,:)=w(3,:);
C(4,:)=w(4,:);
%%
figure
while alph>.001
  numr=round(rand(1)*(length(Datos)-1))+1; 
  a=max(compet((sum(w'.*w')'-(2*w*xy(:,numr))+(xy(:,numr)'*xy(:,numr)))*-1).*[1:4]');  
  w(a,:)=w(a,:)+alph*(xy(:,numr)-w(a,:)')'; %modifico los pesos  de la neurona ganadora
  alph=alph-.005; %decremento el valor de alpha
  hold on 
  grid on 
  plot3(C(1,1),C(1,2),C(1,3),'*k',C(2,1),C(2,2),C(2,3),'*k',C(3,1),C(3,2),C(3,3),'*k',C(4,1),C(4,2),C(4,3),'*k')
  plot3(w(1,1),w(1,2),w(1,3),'pr',w(2,1),w(2,2),w(2,3),'hg',w(3,1),w(3,2),w(3,3),'vb',w(4,1),w(4,2),w(4,3),'om') %grafico el movimiento que van teniendo los pesos
  pause(.03) %doy tiempo para que se despliegue lo anterior

end
plot3(w(1,1),w(1,2),w(1,3),'pc',w(2,1),w(2,2),w(2,3),'hc',w(3,1),w(3,2),w(3,3),'vc',w(4,1),w(4,2),w(4,3),'oc') %grafico el movimiento que van teniendo los pesos
figure
plot3(Ima(:,:,1),Ima(:,:,2),Ima(:,:,3),'y.')
hold on 
plot3(C(1,1),C(1,2),C(1,3),'*k',C(2,1),C(2,2),C(2,3),'*k',C(3,1),C(3,2),C(3,3),'*k',C(4,1),C(4,2),C(4,3),'*k')
plot3(w(1,1),w(1,2),w(1,3),'pr',w(2,1),w(2,2),w(2,3),'pr',w(3,1),w(3,2),w(3,3),'pr',w(4,1),w(4,2),w(4,3),'pr')
grid on 
%%
[fil,col,capa]=size(Id);
salida=zeros(fil,col);
for i=1:fil
    for j=1:col
     
        Df=sqrt((((Id(i,j,1)-w(1,1))^2)+((Id(i,j,2)-w(1,2))^2)+((Id(i,j,3)-w(1,3))^2)));
        DI1=sqrt((((Id(i,j,1)-w(2,1))^2)+((Id(i,j,2)-w(2,2))^2)+((Id(i,j,3)-w(2,3))^2)));
        DI2=sqrt((((Id(i,j,1)-w(3,1))^2)+((Id(i,j,2)-w(3,2))^2)+((Id(i,j,3)-w(3,3))^2)));
        DI3=sqrt((((Id(i,j,1)-w(4,1))^2)+((Id(i,j,2)-w(4,2))^2)+((Id(i,j,3)-w(4,3))^2)));
        
        [a,b]=min([Df,DI1,DI2,DI3]);
        if b==1
            salida(i,j,1)=w(1,1);
            salida(i,j,2)=w(1,2);
            salida(i,j,3)=w(1,3);
            
        elseif b==2
            salida(i,j,1)=w(2,1);
            salida(i,j,2)=w(2,2);
            salida(i,j,3)=w(2,3);
        elseif b==3
            salida(i,j,1)=w(3,1);
            salida(i,j,2)=w(3,2);
            salida(i,j,3)=w(3,3);
        elseif b==4 
            salida(i,j,1)=w(4,1);
            salida(i,j,2)=w(4,2);
            salida(i,j,3)=w(4,3);
        
        end
    end
end

    figure,imshow(uint8(salida)),title('Resultado de la imagen clasificada')
        
        
        