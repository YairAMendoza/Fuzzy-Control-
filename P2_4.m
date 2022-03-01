%RED COMPETENCIA
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
Datos=Datos';

cm=mean(Datos); 
w=rand(2,3); 
w(1,:)=w(1,:)+cm(1);
w(2,:)=w(2,:)+cm(2);
alpha=.5; 
plot(w(1,1),w(2,1),'*m',w(1,2),w(2,2),'*m',w(1,3),w(2,3),'*m') 

for i=1:30
   
        D1=sqrt((((Datos(i,1)-w(1,1)^2)+((Datos(i,2)-w(2,1))^2))));
        D2=sqrt((((Datos(i,1)-w(1,2)^2)+((Datos(i,2)-w(2,2))^2))));
        D3=sqrt((((Datos(i,1)-w(1,3)^2)+((Datos(i,2)-w(2,3))^2))));
       
        [a,b]=min([D1,D2,D3]);
        
        if b==1
          w(:,1)=((1-alpha)*w(:,1))+(alpha*Datos(i,:));
        elseif b==2
            w(:,2)=((1-alpha)*w(:,2))+(alpha*Datos(i,:));
        else
            w(:,3)=((1-alpha)*w(:,3))+(alpha*Datos(i,:));
        end
        pause(0.5)
        plot(w(1,1),w(2,1),'r.',w(1,2),w(2,2),'g.',w(1,3),w(2,3),'b.')
        
end

figure
plot(DatosS(:,1),DatosS(:,2),'ro','markerFaceColor','r')
hold on 
plot(DatosVS(:,1),DatosVS(:,2),'go','markerFaceColor','g')
plot(DatosV(:,1),DatosV(:,2),'bo','markerFaceColor','b')
grid on;
plot(w(1,1),w(2,1),'r.',w(1,2),w(2,2),'g.',w(1,3),w(2,3),'b.')
