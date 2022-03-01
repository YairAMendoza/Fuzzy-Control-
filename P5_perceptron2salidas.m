clear all, close all, clc;
%Clasificacion de 7 muestras a partir d una red ADALINE 
P=[0 1 2 3 4 -2 0; 1 2 1 -1 0 0 -1];
t=[-1 -1 1 1 1 -1 -1;-1 -1 -1 -1 -1 1 1];
R=(((1/length(P(1,:)))*P)*P');
Lamax=max(eig(R));
alpha=1/(4*Lamax)*.99;
w=rand(2,2);
b=rand(2,1);
 epocas=input('numero de epocas: ');
 for j=1:epocas
     for i=1:length(P(1,:))
     a=purelin((w'*P(:,i))+b);
     e=t(:,i)-a;
     w=w+(e*alpha*P(:,i)')';
     b=b+e*alpha;
     end
 end
  intp11=-b(1,:)/w(1,1);
  intp12=-b(1,:)/w(1,2);
  intp21=-b(2,:)/w(2,1);
  intp22=-b(2,:)/w(2,2);
  m1=(intp12-0)/(0-intp11);
  m1w=-1/m1;
  m2=(intp22-0)/(0-intp21);
  m2w=-1/m2;
  L=linspace(-4,2,15);
  l=linspace(0,2,15);
 f1w=m1w*L+intp21;
 f2w=m2w*l+intp22;
 grid on 
 hold on
 plot(P(1,1:2),P(2,1:2),'*',P(1,3:5),P(2,3:5),'h',P(1,6:7),P(2,6:7),'p')
 plot(linspace(-4,4,100),(w(1,1)*linspace(-4,4,100)+b(1,1))/-w(2,1))
 plot(linspace(-4,4,100),(w(1,2)*linspace(-4,4,100)+b(2,1))/-w(2,2),'m')  
 xlabel('P(2)');ylabel('P(2)');
 title('Red ADALINE:7 Patrones ')
 legend('Clase 1','Clase 2','clase 3','Frontera1','Frontera2','Location','northeastoutside')
 xlim([-3,5])
 ylim([-3,5])
