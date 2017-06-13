function out=CelDec2NumRea(a,b,m,X)
for i=1:size(X,1)
    out(i,:)=a + X(i)*( ( b - a )/(2^m - 1));
end