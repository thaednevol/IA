function out=genV(V)
n=length(V);
for i=1:n
    out(i,:)=21.5+V(i,1)*sin(4*pi*V(i,1)) + sin(20*pi*V(i,2));
end