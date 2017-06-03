function [ok,sahm]=validarRestriccion1(papa,Her,nmash)
sahm=zeros();
ok=1;
for j=1:Her
   contador=0;
   for i=1:length(papa)
       if papa(i,4)==j
           contador=contador+1;
       end;
   end;
   sahm(j)=contador;
   if contador>nmash(j)
       ok=0;
       break;
   end;
end;
