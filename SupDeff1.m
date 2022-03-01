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

it=1;
for i=1:Ldf
    for j=1:Ldf

       r1=min(TIA(i),TIB(j));
       R1=min(r1,TIC);
       r2=min(TIA(i),TDB(j));
       R2=min(r2,TDC);
       r3=min(TDA(i),TIB(j));
       R3=min(r3,TDC);
       r4=min(TDA(i),TDB(j));
       R4=min(r4,TIC);
       
       Rec1=max(max(R1,R4));
       Rec2=max(max(R2,R3));
       
      
        for k=1:Ldf
            if TIC(k)<=Rec1
               TICr(k)=TIC(k);
            else
               TICr(k)=Rec1;
            end

            if TDC(k)<=Rec2
               TDCr(k)=TDC(k);
            else
               TDCr(k)=Rec2;
            end
        end
        
         ConjDef=max(TDCr,TICr);
         Deff(it)=sum(ConjDef.*ejexs)/sum(ConjDef); 

it=it+1;
    end
end

[X,Y]=meshgrid(ejex);
ute=1;
for k=1:Ldf
    for j=1:Ldf
        Z(k,j)=Deff(ute);
        ute=ute+1;
    end
end
figure
surf(X,Y,Z);xlabel('X'); ylabel('Y'); zlabel('Z');
title('Superficie de control'), colormap('cool');