function [Xr]=FilBin2NumRea(a,b,m,X)

for i=1:size(X,1)
    A=num2str(X(i,:));
    n=size(A,1);
    %Como quedan espacios en blanco, se quitan:
    A=A(A~=' ');
    A=reshape(A,n,[]);
    out(i,:)=A;
end
Y=out;
for i=1:size(Y,1)
    A=num2str(Y(i,:));
    n=size(A,1);
    %Como quedan espacios en blanco, se quitan:
    A=A(A~=' ');
    A=reshape(A,n,[]);
    Z(i,:)=bin2dec(A);
end

for i=1:size(Z,1)
    Xr(i,:)=a + Z(i)*( ( b - a )/(2^m - 1));
end
