function [papasel]=seleccionar_parejas(papasok,selpareja)
for p=1:selpareja
    n=size(papasok,3);
    i=randi([1 n],1,1);
    j=randi([1 n],1,1);
    while i==j
        j=randi([1 n],1,1);
    end;
    papasel(:,:,1,p)=papasok(:,:,i);
    papasel(:,:,2,p)=papasok(:,:,j);
end;