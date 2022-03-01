clc, clear all, close all; 

[S1,fs1] =audioread('cafe.wav');
S=S1(:,1)';
L=length(S1);
alpha=1e-03;
k=1:L;
V=1.2*sin((2*pi*k)/3);
M=0.2*sin(((2*pi*k)/3)+pi/2);
t=S+M;
figure
plot(t)
figure
plot(S)
W=rand(1,1);
for i=1:L-1
    P=[V(i+1),V(i)]';
   a(:,i)=purelin(W*P);
   e(:,i)=t(:,1)-a(:,i);
end
figure

plot(e,'r')


