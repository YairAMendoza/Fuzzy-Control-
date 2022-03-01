clear all, clc, close all;
Ldf=359;
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

subplot(2,2,1)
plot(x,NOv,x,Ov,x,Sv,x,Ev,x,NEv); title('Angulo de la veleta (Input)'),grid on
xlabel('Grados'),ylabel('Grados de pertenencia'),legend('NOv','Ov','Sv','Ev','NEv')
subplot(2,2,2)
plot(y,NOg,y,Og,y,Sg,y,Eg,y,NEg); title('Angulo del generador (Input)'),grid on
xlabel('Grados'),ylabel('Grados de pertenencia'),legend('NOg','Og','Sg','Eg','NEg')
subplot(2,2,3)
plot(s1,ah,s1,nm,s1,h); title('Direccion de desplazamiento (Output)'),grid on
xlabel('Sentido de giro'),ylabel('Grados de pertenencia'),legend('Antihorario','No mover','Horario')
subplot(2,2,4)
plot(V2,b,V2,m,V2,a); title('Revoluciones por minuto (Output)'),grid on
xlabel('Velocidad [m/h]'),ylabel('Grado de pertenencia'),legend('Baja','Media','Alta')

Val1=input('Ingrese el valor del Angulo de la veleta: ')+1; %0-200
Val2=input('Ingrese el valor del Angulo del generado:  ')+1;
Px1=NOv(Val1);Py1=NOg(Val2);
Px2=Ov(Val1);Py2=Og(Val2);
Px3=Sv(Val1);Py3=Sg(Val2);
Px4=Ev(Val1);Py4=Eg(Val2);
Px5=NEv(Val1);Py5=NEg(Val2);
figure
subplot(2,1,1),plot(x,NOv,x,Ov,x,Sv,x,Ev,x,NEv), hold on ...
    ,plot(x(Val1),Px1,'r*',x(Val1),Px2,'g*',x(Val1),Px3,'b*',x(Val1),Px4,'c*',x(Val1),Px5,'m*'),grid on
title('Fuzzyficacion'),xlabel('Angulo de la Veleta'),ylabel('Grado de pertenencia')
legend('NOv','Ov','Sv','Ev','NEv','PNOv','POv','PSv','PEv','PNEv')
subplot(2,1,2),plot(y,NOg,y,Og,y,Sg,y,Eg,y,NEg), hold on...
    ,plot(y(Val2),Py1,'r*',y(Val2),Py2,'g*',y(Val2),Py3,'b*',y(Val2),Py4,'c*',y(Val2),Py5,'m*'),grid on
xlabel('Angulo del generador'),ylabel('Grado de pertenencia')
legend('NOg','Og','Sg','Eg','NEg','PNOg','POg','PSg','PEg','PNEg')
%%

        vc=min(NOv(Val1),NOg(Val2));
        g1=min(vc,nm);
        gg1=min(vc,b);
        
        vc=min(Ov(Val1),NOg(Val2));
        g2=min(vc,ah);
        gg2=min(vc,b);
        
        vc=min(Sv(Val1),NOg(Val2));
        g3=min(vc,ah);
        gg3=min(vc,a);
        
        vc=min(Ev(Val1),NOg(Val2));
        g4=min(vc,h);
        gg4=min(vc,m);
        
        vc=min(NEv(Val1),NOg(Val2));
        g5=min(vc,nm);
        gg5=min(vc,b);
        
        vc=min(NOv(Val1),Og(Val2));
        g6=min(vc,ah);
        gg6=min(vc,m);
        
        vc=min(Ov(Val1),Og(Val2));
        g7=min(vc,nm);
        gg7=min(vc,b);
        
        vc=min(Sv(Val1),Og(Val2));
        g8=min(vc,ah);
        gg8=min(vc,m);
        
        vc=min(Ev(Val1),Og(Val2));
        g9=min(vc,ah);
        gg9=min(vc,a);
        
        vc=min(NEv(Val1),Og(Val2));
        g10=min(vc,h);
        gg10=min(vc,m);
        
        vc=min(NOv(Val1),Sg(Val2));
        g11=min(vc,h);
        gg11=min(vc,a);
        
        vc=min(Ov(Val1),Sg(Val2));
        g12=min(vc,h);
        gg12=min(vc,m);
        
        vc=min(Sv(Val1),Sg(Val2));
        g13=min(vc,nm);
        gg13=min(vc,b);
        
        vc=min(Ev(Val1),Sg(Val2));
        g14=min(vc,ah);
        gg14=min(vc,m);
        
        vc=min(NEv(Val1),Sg(Val2));
        g15=min(vc,ah);
        gg15=min(vc,a);
        
        vc=min(NOv(Val1),Eg(Val2));
        g16=min(vc,ah);
        gg16=min(vc,m);
        
        vc=min(Ov(Val1),Eg(Val2));
        g17=min(vc,h);
        gg17=min(vc,a);
        
        vc=min(Sv(Val1),Eg(Val2));
        g18=min(vc,h);
        gg18=min(vc,m);
        
        vc=min(Ev(Val1),Eg(Val2));
        g19=min(vc,nm);
        gg19=min(vc,b);
        
        vc=min(NEv(Val1),Eg(Val2));
        g20=min(vc,ah);
        gg20=min(vc,m);
        
        vc=min(NOv(Val1),NEg(Val2));
        g21=min(vc,nm);
        gg21=min(vc,b);
        
        vc=min(Ov(Val1),NEg(Val2));
        g22=min(vc,ah);
        gg22=min(vc,b);
        
        vc=min(Sv(Val1),NEg(Val2));
        g23=min(vc,h);
        gg23=min(vc,a);
        
        vc=min(Ev(Val1),NEg(Val2));
        g24=min(vc,h);
        gg24=min(vc,m);
        
        vc=min(NEv(Val1),NEg(Val2));
        g25=min(vc,nm);
        gg25=min(vc,b);
        
        Recs1=max(max([g1;g5;g7;g13;g19;g21;g25]));%No mover
        Recs2=max(max([g2;g4;g6;g10;g11;g12;g17;g18;g23;g24]));%Antihorario
        Recs3=max(max([g3;g8;g9;g14;g15;g16;g20;g22]));%Horario
       
        Recv1=max(max([gg1;gg5;gg6;gg7;gg10;gg13;gg19;gg21;gg25]));%baja
        Recv2=max(max([gg2;gg4;gg8;gg12;gg14;gg16;gg18;gg20;gg22;gg24]));%media
        Recv3=max(max([gg3;gg9;gg11;gg15;gg17;gg23]));%alta
            
 for i=1:Ldf
    if nm(i)<=Recs1
       nmr(i)=nm(i);
    else
       nmr(i)=Recs1;
    end
           
    if ah(i)<=Recs2
       ahr(i)=ah(i);
    else
       ahr(i)=Recs2;
    end
    
    if h(i)<=Recs3
       hr(i)=h(i);
    else
       hr(i)=Recs3;
    end
 end
 
  for i=1:Ldf
    if b(i)<=Recv1
       br(i)=b(i);
    else
       br(i)=Recv1;
    end
           
    if m(i)<=Recv2
       mr(i)=m(i);
    else
       mr(i)=Recv2;
    end
    
    if a(i)<=Recv3
       ar(i)=a(i);
    else
       ar(i)=Recv3;
    end
 end
 
 ConjDefs=max([nmr;ahr;hr]);
 Deffs=sum(ConjDefs.*s1)/sum(ConjDefs); 
 ConjDefv=max([br;mr;ar]);
 Deffv=sum(ConjDefv.*V2)/sum(ConjDefv); 
 
 %para sentido
 figure
 subplot(2,1,1),plot(s1,nmr,'--r','LineWidth',2),hold on ,plot(s1,ahr,'-.b','LineWidth',2),plot(s1,hr,'g','LineWidth',2),grid on
 title('Conjuntos Recortados'), xlabel('Sentido de giro '),ylabel('Pertenenencia')
 legend('No mover','Antihorario','Horario')
 subplot(2,1,2),plot(s1,ConjDefs,'m','LineWidth',1),grid on
 title('Union de conjuntos (Max)'),xlabel('Sentido de giro'),ylabel('Pertenenencia');
 legend('Conjunto a defuzzificar ')
 figure
 plot(s1,ConjDefs,'m','LineWidth',1.5),hold on...
     ,plot([Deffs,Deffs],[0,1],'r--','linewidth', 1.5)...
     ,plot(Deffs,ConjDefs,'b.','linewidth', 0.001),grid on;
 title('Defuzzificacion Direccion '),xlabel('Sentido de giro'),ylabel('Pertenenencia');
 legend('Conjunto defuzzificado','Eje del centroide');
 %para velocidad
 figure
 subplot(2,1,1),plot(V2,br,'--r','LineWidth',2),hold on ,plot(V2,mr,'-.b','LineWidth',2),plot(V2,ar,'g','LineWidth',2),grid on
 title('Conjuntos Recortados'), xlabel('velocidad'),ylabel('Pertenenencia')
  legend('V.Baja','V.Media','V.Alta')
 subplot(2,1,2),plot(V2,ConjDefv,'m','LineWidth',1),grid on
 title('Union de conjuntos (Max)'),xlabel('Velocidad'),ylabel('Pertenenencia')
  legend('Conjunto a defuzzificar ')
 figure
 plot(V2,ConjDefv,'m','LineWidth',1.5),hold on...
     ,plot([Deffv,Deffv],[0,1],'r--','linewidth', 1.5)...
     ,plot(Deffv,ConjDefv,'b.','linewidth', 0.001),grid on;
 title('Defuzzificacion Velocidad'),xlabel('Velocidad [m/h]'),ylabel('Pertenenencia');
 legend('Conjunto defuzzificado','Eje del centroide');

 disp(['Zs : ',num2str(Deffs)])
 disp(['Zv : ',num2str(Deffv)])
       
        

