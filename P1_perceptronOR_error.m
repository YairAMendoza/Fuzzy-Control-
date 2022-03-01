clear all; close all; clc;
P=[0 0 1 1;0 1 0 1];
T=[0 1 1 0];
 w=rand(2,1);
 b=rand;
 error=0;
 L=length(P);
 while error<L
     for i=1:L
     a=hardlim((w'*P(:,i))+b);
     e=T(i)-a;
     w=w+e*P(:,i);
     b=b+e;
         if e==0
             error=error+1;
         else
             error=0;
         end
     end
 end
     intp1=-b/w(1,:);
     intp2=-b/w(2,:);
     m=(intp2-0)/(0-intp1);
mw=-1/m;
l =linspace(-2,2,10);
lw=linspace(0,0.5,10);
f=(m*l)+intp2;
fw=mw*l+intp2;
plotpv(P,T) 
hold on 
plot(f,l,'r',fw,lw,'g')
