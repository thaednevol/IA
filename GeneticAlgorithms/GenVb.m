function out=GenVb(X1,X2)
n=length(X1);
for i=1:n
    out(i,:)=[X1(i,:) '' X2(i,:)];
end
