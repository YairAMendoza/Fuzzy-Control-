function ConjTrapI = TrapecioI(ejex,a,b)

i=1;
% grados de pertenencia de la funcion hombro izq
for x=ejex;
    if (x<a)
        pertenhombroizq (i)=1;
    end
    if (x>=a)&&(x<b)
        pertenhombroizq (i)=1-(x-a)/(b-a);
    end
    if (x>=b)
        pertenhombroizq(i)=0;
    end
    i=i+1;
end

ConjTrapI=pertenhombroizq;

end

