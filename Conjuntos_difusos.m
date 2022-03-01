clc,clear all,close all

x1=0:255;
coizq=1./(1+exp(0.09*(x1-80)));
comedio=exp((-1/2)*(((x1-100)/17).^2));
coder=1./(1+exp(-0.09*(x1-120)));

figure , hold on ,plot(comedio), plot(coizq),plot(coder),grid on
legend('Luz media','Poca Luz','Mucha Luz')
title('Conjuntos difusos continuos'),xlabel('Intensidad luminosa[Cd]')
ylabel('Pertenencia')
axis([0,200,0,1])


%%
x2=0:255;
%definición de parametros de ejes X Y
xmin=0;
xmax=255;
res=0.5;
ymin=0;
ymax=1;

%Variables de entrada de funcion triangular
b=100; %Centro
a=50; %inicio
c=150;%fin

ejex=xmin:res:xmax;
i=1;

for x=ejex;
    
    %grado de pertenencia = 0
    if (x<a)|(x>=c)   
        pertentri(i)=0;
    end
    
    %pendiente positiva
    if (x>=a)&(x<b)
        pertentri(i)=(x-a)/(b-a);
    end
    
    %pendiente negativa
    if (x>=b)&(x<c)
        pertentri(i)=1-(x-b)/(c-b);
    end
    i=i+1;
end

% Variables de entrada funcion especifica
b1=150;%fin
a1=30;%punto de inflexion

ejex=xmin:res:xmax;
i=1;
% grados de pertenencia de la funcion hombro izq
for x=ejex;
    if (x<a1)
        pertenhombroizq (i)=1;
    end
    if (x>=a1)&(x<b1)
        pertenhombroizq (i)=1-(x-a1)/(b1-a1);
    end
    if (x>=b1)
        pertenhombroizq(i)=0;
    end
    i=i+1;
end

% variables de entrada de la funcion 
b2=150;
a2=60;

ejex=xmin:res:xmax;
i=1;

% condiciones de pertenencia de funcion tipo hombro
for x=ejex;
    if (x<a2)
        pertenhombroder(i)=0;
    end
    if (x>=a2)&(x<b2)
        pertenhombroder(i)=(x-a2)/(b2-a2);
    end
    if (x>=b2)
        pertenhombroder(i)=1;
    end
    i=i+1;
end

%código para generar gráfica
figure
plot(ejex,pertentri),hold on,plot(ejex,pertenhombroizq),plot(ejex,pertenhombroder),grid on
legend('Luz media','Poca Luz','Mucha Luz')
title('Conjuntos difusos discretos');
axis([xmin,xmax,ymin,ymax]);
ylabel('Grado de pertenencia');
xlabel('Intesidad luminosa [Cd]')


