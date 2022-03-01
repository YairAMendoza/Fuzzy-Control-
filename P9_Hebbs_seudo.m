clc, clear all , close all ;
%REGLA DE HEBBS SEUDOINVERSA
I1=imresize(rgb2gray(imread('Eserio.png')),[640,480]);
I2=imresize(rgb2gray(imread('Etriste.png')),[640,480]);
I3=imresize(rgb2gray(imread('Efeliz.png')),[640,480]);
% figure
% subplot(1,3,1),imhist(I1);
% subplot(1,3,2),imhist(I2);
% subplot(1,3,3),imhist(I3);
figure
imshow([I1,I2,I3])
bin1=I1<118;
bin2=I2<118;
bin3=I3<118;
bin3=imerode(bin3,ones(6,6));
bin3=bwareaopen(bin3,200);
figure
imshow([bin1,bin2,bin3])
p1=sum(bin1,2);
p2=sum(bin2,2);
p3=sum(bin3,2);
figure
subplot(1,3,1),plot(p1);
subplot(1,3,2),plot(p2);
subplot(1,3,3),plot(p3);
%%
%Regla de Hebbs
P=[p1,p2,p3];
% Porth=orth(P);
P=inv(P'*P)*P';
T=[-1 1 1;-1,-1 1];
W=T*P;


%%
%introduccion de la imagen de prueba 
IPr=imread('Eprueba.png');
Ip=imresize(rgb2gray(IPr),[640,480]);
% figure
%  imhist(Ip);
binp=Ip<118;
binp=imerode(binp,ones(6,6));
binp=bwareaopen(binp,200);
figure
imshow(binp)
Pp=sum(binp,2);
% Ppn=Pp/norm(Pp);
figure
plot(Pp)
%%
%comprobacion de la imagen patron 
a=W*Pp;
figure
imshow(IPr)
    if a(1)<0 & a(2)<0
    clc
    disp('Estas serio')
    elseif a(1)>0 && a(2)<0
    clc
    disp('Estas triste ')
    elseif a(1)>0 & a(2)>0
    clc
    disp('Estas Feliz......')
    else
    disp('No se reconoce')  
    end
    