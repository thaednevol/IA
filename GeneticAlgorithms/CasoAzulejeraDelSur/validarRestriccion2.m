function [ok,caom]=validarRestriccion2(papa,Ope,nmaso)
caom=zeros();
ok=1;
for j=1:Ope
   contador=0;
   for i=1:length(papa)
       if papa(i,3)==j
           contador=contador+1;
       end;
   end;
   caom(j)=contador;
   if contador>nmaso(j)
       ok=0;
       break;
   end;
end;