clear all; close all; clc;
[c1,fc1] = audioread('cafe.wav');
figure(1)
subplot(2,2,1), plot(linspace(0,2,length(c1)),c1);

c1=c1*3;

% hz60=.05*sin(linspace(0,2,length(c1))*120*pi);
hz60=0.12*sin((120*pi*linspace(0,2,length(c1)))+(pi/2));
hz=horzcat([0,0],1.2*sin(120*pi*linspace(0,2,length(c1))));
subplot(2,2,2), plot(linspace(0,2,length(c1)),hz60);
subplot(2,2,3), plot(linspace(0,2,length(c1)+2),hz);
subplot(2,2,4), plot(linspace(0,2,length(c1)),c1'+hz60);

%1=>2*pi
%60=>x
t=c1'+hz60;
%  w=[0;0;0];
w=rand(3,1);
b=rand(1,1);
% hz=horzcat([0],sin(linspace(0,2,length(c1))*120*pi));

 alph=.001;
              
%      for i=1:length(hz60)
%      a=(w'*[hz(:,i+2);hz(:,i+1);hz(:,i)]+b);
%      e=(t(i)-a);
%      w=w+(alph*e*[hz(:,i+2);hz(:,i+1);hz(:,i)]);
%      b=b+(alph*e);
%      er(i)=e;
%      end
 
     P=hz;
     
for i=1:length(P(1,:))
     a=purelin((w'*P(:,[i+2,i+1,i]))+b);
     e=t(:,i)-a;
     w=w+(alph*e*P(:,[i+2,i+1,i])')';
     b=b+(alph*e);
end

     figure(2)
plot(linspace(0,2,length(c1)),c1,linspace(0,2,length(c1)),er);
 sound(er,8000)