function [p1,p2]=traerPareja(padres)

i=randi([1 size(padres,1)],1,1);
j=randi([1 size(padres,1)],1,1);

while i==j
    j=randi([1 size(padres,1)],1,1);
end
p1=padres(i,:)-'0';
p2=padres(j,:)-'0';
   