clear all; close all; clc;
P=[0 1 2 3 4 -2 0; 1 2 1 -1 0 0 -1];
t=[-1 -1 1 1 1 -1 -1;
    -1 -1 -1 -1 -1 1 1];
%  w=[0,0;0,0];
%  b=[0;0];
w=rand(2,2);
b=rand(2,1);
 band=0;
 while band<length(P(1,:))
     for i=1:length(P(1,:))
     a=hardlims((w'*P(:,i))+b);
     e=t(:,i)-a;
     w=w+(e*P(:,i)')';
     b=b+e;
     if e==[0;0]
         band=band+1;
     else
         band=0;
     end
     
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
  l=linspace(0,6,100);
  
 f1w=m1w*l+intp12;
 f2w=m2w*l+intp22;
 plot(P(1,1:2),P(2,1:2),'*',P(1,3:5),P(2,3:5),'h',P(1,6:7),P(2,6:7),'p',linspace(-4,3,100),(w(1,1)*linspace(-4,3,100)+b(1,1))/-w(2,1),linspace(-4,3,100),(w(1,2)*linspace(-4,3,100)+b(2,1))/-w(2,2))
 grid on 
 hold on 
 xlabel('P(2)');ylabel('P(2)');
 title('Red perceptron:7 Patrones ')
 legend('Clase 1','Clase 2','clase 3','Frontera1','Frontera2','Location','northeastoutside')
 xlim([-3,5])
 ylim([-3,5])
%  plot(f1w,l,'.-c',f2w,l,'--m') se utilizo para verificar el vector de
%  pesos 