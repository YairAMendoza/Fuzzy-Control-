clc,clear all,close all
X=0:0.1:10;
%conjuntos difusos iniciales 
ua=X./(X+2);
uB=2.^-X;
uC=1./1+10*((X-2).^2);
uC=uC/max(uC);
uA=ua/max(ua); %se normaliza para tener grado de pertenecia maximo en 1
figure
subplot(1,3,1),plot(X,uA),title('UA'),grid on
subplot(1,3,2),plot(X,uB),title('UB'),grid on
subplot(1,3,3),plot(X,uC),title('UC'),grid on 
%Complementos
uAn=1-uA;
uBn=1-uB;
uCn=1-uC;
figure
subplot(1,3,1),plot(X,uAn),title('UAn'),grid on
subplot(1,3,2),plot(X,uBn),title('UBn'),grid on
subplot(1,3,3),plot(X,uCn),title('UCn'),grid on 

%Union 
    UAuB=max([uA;uB]);
    UAuC=max([uA;uC]);
    UBuC=max([uB;uC]);
figure
subplot(1,3,1),plot(X,UAuB),title('UAuB'),grid on
subplot(1,3,2),plot(X,UAuC),title('UAuC'),grid on
subplot(1,3,3),plot(X,UBuC),title('UBuC'),grid on 

%Interseccion 

    UAiB=min([uA;uB]);
    UAiC=min([uA;uC]);
    UBiC=min([uB;uC]);
    UAiCn=min([uA;uCn]);
    UBniC=min([uBn;uC]);

figure
subplot(1,3,1),plot(X,UAiB),title('UAiB'),grid on
subplot(1,3,2),plot(X,UAiC),title('UAiC'),grid on
subplot(1,3,3),plot(X,UBiC),title('UBiC'),grid on
%leyes de de moorgan
AiCnn=1-UAiCn;
BniCn=1-UBniC;
AuCn=1-UAuC;
figure
subplot(1,3,1),plot(X,AiCnn),title('Aicnn'),grid on
subplot(1,3,2),plot(X,BniCn),title('BniCn'),grid on
subplot(1,3,3),plot(X,AuCn),title('AuCn'),grid on

