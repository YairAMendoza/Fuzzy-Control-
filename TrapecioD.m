function ConjTrapD = TrapecioD(ejex,a,b)
i=1;
% condiciones de pertenencia de funcion tipo hombro
for x=ejex;
    if (x<a)
        pertenhombroder(i)=0;
    end
    if (x>=a)&&(x<b)
        pertenhombroder(i)=(x-a)/(b-a);
    end
    if (x>=b)
        pertenhombroder(i)=1;
    end
    i=i+1;
end
ConjTrapD=pertenhombroder;

end

