%Operadores S_norma y T_norma
clc,clear all,close all
X=-15:0.1:15;
uA=1./(1+(((X+5)./7.5).^4));
uB=1./(1+(((X-5)./5).^2));
figure
subplot(1,2,1),plot(X,uA),grid on ,title('uA')
xlim([-15,15])
subplot(1,2,2),plot(X,uB),grid on,title('uB')
xlim([-15,15])

%Operadores T Norma
Tmin=min([uA;uB]);
Tap=uA.*uB;
Tbp=max([zeros(1,length(uA));(uA+uB-1)]);
Tdp=max([(uA.*(uB==1));(uB.*(uA==1));(((uA<0)+(uB<0))==1)]);
figure
plot(X,Tmin),hold on,plot(X,Tap),plot(X,Tbp),plot(X,Tdp),title('Operadores T norma')
grid on 
legend('minimo','producto algebraico','producto frontera','producto drastico')

%Operadores S norma 
Smax=max([uA;uB]);
Sas=(uA+uB)-(uA.*uB);
Sbs=min([ones(1,length(uA));(uA+uB)]);
Sds=max([(uA.*(uB==0));(uB.*(uA==0));(((uA>0)+(uB>0))==2)]);
figure
plot(X,Smax),hold on,plot(X,Sas),plot(X,Sbs),plot(X,Sds),title('Operadores S norma')
grid on
legend('maximo','suma algebraico','suma frontera','suma drastico')

