function [p1,p2]=traerPareja(padres)

i=round(1+(length(padres)-1)*rand(1,1));
j=round(1+(length(padres)-1)*rand(1,1));

while i==j
    j=round(length(padres)*rand(1,1));
end

p1=padres(i,:);
p2=padres(j,:);
    