clc,clear all,close all
%definición de parametros de ejes X Y
xmin=0;ymin=0;
xmax=10;ymax=1;
ejex=xmin:0.1:xmax;
TDA=TrapecioD(ejex,3,7);
TIA=TrapecioI(ejex,3,7);

TDB=TrapecioD(ejex,4,6);
TIB=TrapecioI(ejex,4,6);

xmins=-5;
xmaxs=5;
ejexs=xmins:0.1:xmaxs;
TDC=TrapecioD(ejexs,-1,1);
TIC=TrapecioI(ejexs,-1,1);

Ldf=length(TDA);

figure
subplot(3,1,1),plot(ejex,TIA),hold on,plot(ejex,TDA),grid on,legend('A1','A2')
title('Conjunto de entrada A');
axis([xmin,xmax,ymin,ymax]),ylabel('Grado de pertenencia'),xlabel('X')

subplot(3,1,2),plot(ejex,TIB),hold on,plot(ejex,TDB),grid on,legend('B1','B2')
title('Conjunto de entrada B');
axis([xmin,xmax,ymin,ymax]),ylabel('Grado de pertenencia'),xlabel('Y')

subplot(3,1,3),plot(ejexs,TIC),hold on,plot(ejexs,TDC),grid on,legend('C1','C2')
title('Conjunto de salida C');
axis([xmins,xmaxs,ymin,ymax]),ylabel('Grado de pertenencia'),xlabel('Z')

Val1=(input('Ingrese el valor de X: ')*10)+1;
Val2=(input('Ingrese el valor de Y: ')*10)+1;
Px1=TDA(Val1);Py1=TDB(Val2);
Px2=TIA(Val1);Py2=TIB(Val2);
figure
subplot(2,1,1),plot(ejex,TIA,ejex,TDA), hold on ,plot(ejex(Val1),Px1,'*r',ejex(Val1),Px2,'*b'),grid on
title('Fuzzyficacion'),xlabel('X'),ylabel('Grado de pertenencia'),...
    legend('A1','A2','PpA2','PpA1')
subplot(2,1,2),plot(ejex,TIB,ejex,TDB), hold on ,plot(ejex(Val2),Py1,'*r',ejex(Val2),Py2,'*b'),grid on
xlabel('Y'),ylabel('Grado de pertenencia'),legend('B1','B2','PpB2','PpB1')
%%
%Reglas 
       r1=min(TIA(Val1),TIB(Val2));
       R1=min(r1,TIC);
       r2=min(TIA(Val1),TDB(Val2));
       R2=min(r2,TDC);
       r3=min(TDA(Val1),TIB(Val2));
       R3=min(r3,TDC);
       r4=min(TDA(Val1),TDB(Val2));
       R4=min(r4,TIC);
       
       Rec1=max(max(R1,R4));
       Rec2=max(max(R2,R3));
       
       RC=max(r1,r4);
       RC2=max(r2,r3);

 for i=1:Ldf
    if TIC(i)<=Rec1
       TICr(i)=TIC(i);
    else
       TICr(i)=Rec1;
    end
           
    if TDC(i)<=Rec2
       TDCr(i)=TDC(i);
    else
       TDCr(i)=Rec2;
    end
    
 end
 
 ConjDef=max(TDCr,TICr);
 Deff=sum(ConjDef.*ejexs)/sum(ConjDef);    
 figure
 subplot(2,1,1),plot(ejexs,TDCr,'--r','LineWidth',2),hold on ,plot(ejexs,TICr,'-.b','LineWidth',2),grid on
 title('Conjuntos Recortados'), xlabel('Z'),ylabel('Pertenenencia'),legend('C2','C1')
 subplot(2,1,2),plot(ejexs,ConjDef,'g','LineWidth',1),grid on
 title('Union de conjuntos (Max)'),xlabel('Z'),ylabel('Pertenenencia'),legend('Conjunto recortado')
 figure
 plot(ejexs,ConjDef,'m','LineWidth',1.5),hold on...
     ,plot([Deff,Deff],[0,1],'r--','linewidth', 1.5)...
     ,plot(Deff,ConjDef,'b.','linewidth', 0.001),grid on,legend('Conjunto recortado fuzzificado','Eje del centroide')
 title('Defuzzificacion');

 disp(['Z : ',num2str(Deff)])
       
 


