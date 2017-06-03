function out=FilBin2CelDec(X)

for i=1:length(X)
    A=num2str(X(i,:));
    n=size(A,1);
    %Como quedan espacios en blanco, se quitan:
    A=A(A~=' ');
    A=reshape(A,n,[]);
    out(i,:)=bin2dec(A);
end