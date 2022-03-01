clc,clear all,close all
figure
[X,Y]=meshgrid(-3*pi:.5:3*pi);
Z=sin(sqrt(X.^2+Y.^2));
surf(X,Y,Z)
axis([-3*pi 3*pi -3*pi 3*pi -2 2])
colormap cool

[fi col]=size(X);
N(:,1)=reshape(X,1,fi*col);
N(:,2)=reshape(Y,1,fi*col);
N(:,3)=reshape(Z,1,fi*col);
Neu=100;
W(:,1:2)=-5 + (10)*rand(100,2);
W(:,3)=rand(100,1);
figure(2)
plot3(W(:,1),W(:,2),W(:,3),'c*'),grid on
hold on 
alpha=0.7;
for i=1:100
    rn=randi([1 length(N)],1,length(N));
    j=1;
    while j<=length(N);
        for k=1:100
        d(k)=sqrt((N(rn(j),:)'-W(k,:)')'*(N(rn(j),:)'-W(k,:)'));
        end
            a = compet(-d');
            for k=1:100
                W(k,:)=W(k,:)+alpha*a(k)*(N(rn(j),:)-W(k,:));
            end
            j = j+1;
    end
    plot3(W(:,1),W(:,2),W(:,3),'b+'),grid on
    pause(0.001)
    alpha=alpha-0.005;
end