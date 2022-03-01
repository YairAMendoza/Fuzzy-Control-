
%%%%%%%%%%%%%%%
%Función de tipo Triangular %
%%%%%%%%%%%%%%%

clear all;

%definición de parametros de ejes X Y
xmin=input (' minimo=');%
xmax=input ('maximo=');
res=0.5;
ymin=0;
ymax=1;

%Variables de entrada de funcion triangular
b=input('centro=');
a=input('inicio=');
c=input('fin=');

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

%código para generar gráfica
plot(ejex,pertentri)
title('Funcion de pertenencia triangular');
axis([xmin,xmax,ymin,ymax]);
ylabel('Grado de pertenencia');



