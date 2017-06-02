function out=GenVr(X1,X2)
if length(X1)==length(X2)
    n=length(X1);
    for i=1:n
        out(i,:)=[X1(i) X2(i)];
    end
else
    return
end