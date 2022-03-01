function ConjTri= Triangulo(ejex,a,b,c)
i=1;
for x=ejex;
    
    %grado de pertenencia = 0
    if (x<a)||(x>=c)   
        pertentri(i)=0;
    end
    
    %pendiente positiva
    if (x>=a)&&(x<b)
        pertentri(i)=(x-a)/(b-a);
    end
    
    %pendiente negativa
    if (x>=b)&&(x<c)
        pertentri(i)=1-(x-b)/(c-b);
    end
    i=i+1;
end
 ConjTri=pertentri;
end

