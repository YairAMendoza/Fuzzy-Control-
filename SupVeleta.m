clc,clear all,close all
Ldf=360;
x=linspace(0,359,Ldf);
NOv=trapmf(x, [0 0 9 81]);
Ov=trapmf(x,  [12 83 101 173]);
Sv=trapmf(x,  [99 171 189 260]);
Ev=trapmf(x, [189 260 278 350]);
NEv=trapmf(x,  [278 350 368 440]);

y=linspace(0,359,Ldf);
NOg=trapmf(y, [0 0 9 81]);
Og=trapmf(y,  [9 81 99 171]);
Sg=trapmf(y,  [99 171 189 260]);
Eg=trapmf(y, [188 260 278 350]);
NEg=trapmf(y,  [278 350 368 440]);

s1=linspace(-5,5,Ldf);
ah=trapmf(s1,  [-5 -5 -4 0]);
nm=trapmf(s1,   [-4 -0.5 0.5 4]);
h=trapmf(s1,   [0 4 5 5]);

V2=linspace(0,10,Ldf);
b=trapmf(V2, [0 0 1 4]);
m=trapmf(V2, [1 4 6 9]);
a=trapmf(V2, [6 9 10 14]);


%%

it=1;
for i=1:Ldf
    for j=1:Ldf
        vc=min(NOv(i),NOg(j));
        g1=min(vc,nm);
        gg1=min(vc,b);
        
        vc=min(Ov(i),NOg(j));
        g2=min(vc,ah);
        gg2=min(vc,b);
        
        vc=min(Sv(i),NOg(j));
        g3=min(vc,ah);
        gg3=min(vc,a);
        
        vc=min(Ev(i),NOg(j));
        g4=min(vc,h);
        gg4=min(vc,m);
        
        vc=min(NEv(i),NOg(j));
        g5=min(vc,nm);
        gg5=min(vc,b);
        
        vc=min(NOv(i),Og(j));
        g6=min(vc,ah);
        gg6=min(vc,m);
        
        vc=min(Ov(i),Og(j));
        g7=min(vc,nm);
        gg7=min(vc,b);
        
        vc=min(Sv(i),Og(j));
        g8=min(vc,ah);
        gg8=min(vc,m);
        
        vc=min(Ev(i),Og(j));
        g9=min(vc,ah);
        gg9=min(vc,a);
        
        vc=min(NEv(i),Og(j));
        g10=min(vc,h);
        gg10=min(vc,m);
        
        vc=min(NOv(i),Sg(j));
        g11=min(vc,h);
        gg11=min(vc,a);
        
        vc=min(Ov(i),Sg(j));
        g12=min(vc,h);
        gg12=min(vc,m);
        
        vc=min(Sv(i),Sg(j));
        g13=min(vc,nm);
        gg13=min(vc,b);
        
        vc=min(Ev(i),Sg(j));
        g14=min(vc,ah);
        gg14=min(vc,m);
        
        vc=min(NEv(i),Sg(j));
        g15=min(vc,ah);
        gg15=min(vc,a);
        
        vc=min(NOv(i),Eg(j));
        g16=min(vc,ah);
        gg16=min(vc,m);
        
        vc=min(Ov(i),Eg(j));
        g17=min(vc,h);
        gg17=min(vc,a);
        
        vc=min(Sv(i),Eg(j));
        g18=min(vc,h);
        gg18=min(vc,m);
        
        vc=min(Ev(i),Eg(j));
        g19=min(vc,nm);
        gg19=min(vc,b);
        
        vc=min(NEv(i),Eg(j));
        g20=min(vc,ah);
        gg20=min(vc,m);
        
        vc=min(NOv(i),NEg(j));
        g21=min(vc,nm);
        gg21=min(vc,b);
        
        vc=min(Ov(i),NEg(j));
        g22=min(vc,ah);
        gg22=min(vc,b);
        
        vc=min(Sv(i),NEg(j));
        g23=min(vc,h);
        gg23=min(vc,a);
        
        vc=min(Ev(i),NEg(j));
        g24=min(vc,h);
        gg24=min(vc,m);
        
        vc=min(NEv(i),NEg(j));
        g25=min(vc,nm);
        gg25=min(vc,b);
        
        Recs1=max(max([g1;g5;g7;g13;g19;g21;g25]));%No mover
        Recs2=max(max([g2;g4;g6;g10;g11;g12;g17;g18;g23;g24]));%Antihorario
        Recs3=max(max([g3;g8;g9;g14;g15;g16;g20;g22]));%Horario
       
        Recv1=max(max([gg1;gg5;gg6;gg7;gg10;gg13;gg19;gg21;gg25]));%baja
        Recv2=max(max([gg2;gg4;gg8;gg12;gg14;gg16;gg18;gg20;gg22;gg24]));%media
        Recv3=max(max([gg3;gg9;gg11;gg15;gg17;gg23]));%alta
            
 for l=1:Ldf
    if nm(l)<=Recs1
       nmr(l)=nm(l);
    else
       nmr(l)=Recs1;
    end
           
    if ah(l)<=Recs2
       ahr(l)=ah(l);
    else
       ahr(l)=Recs2;
    end
    
    if h(l)<=Recs3
       hr(l)=h(l);
    else
       hr(l)=Recs3;
    end
 end
 
  for k=1:Ldf
    if b(k)<=Recv1
       br(k)=b(k);
    else
       br(k)=Recv1;
    end
           
    if m(k)<=Recv2
       mr(k)=m(k);
    else
       mr(k)=Recv2;
    end
    
    if a(k)<=Recv3
       ar(k)=a(k);
    else
       ar(k)=Recv3;
    end
  end
 
 
     ConjDefs=max([nmr;ahr;hr]);
     Deffs(it)=sum(ConjDefs.*s1)/sum(ConjDefs); 
     ConjDefv=max([br;mr;ar]);
     Deffv(it)=sum(ConjDefv.*V2)/sum(ConjDefv); 

     it=it+1;

    end
end

       
[Xs,Ys]=meshgrid(x);
ute=1;
for i=1:Ldf
    for j=1:Ldf
        Zs(i,j)=Deffs(ute);
        ute=ute+1;
    end
end
figure
mesh(Xs,Ys,Zs);xlabel('Angulo veleta'); ylabel('Angulo generador'); zlabel('Sentido de giro'),title('Superficie sentido');

[Xv,Yv]=meshgrid(y);
ute=1;
for i=1:Ldf
    for j=1:Ldf
        Zv(i,j)=Deffv(ute);
        ute=ute+1;
    end
end
figure
mesh(Xv,Yv,Zv);xlabel('Angulo veleta '); ylabel('Angulo generador'); zlabel('Velocidad'),title('Superficie velocidad')

