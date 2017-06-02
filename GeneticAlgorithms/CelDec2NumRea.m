function out=CelDec2NumRea(a,b,m,X)
for i=1:length(X)
    out(i,:)=a + X(i)*( ( b - a )/(2^m - 1));
end