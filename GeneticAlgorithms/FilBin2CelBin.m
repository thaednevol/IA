function out=FilBin2CelBin(X)

for i=1:size(X,1)
    A=num2str(X(i,:));
    n=size(A,1);
    %Como quedan espacios en blanco, se quitan:
    A=A(A~=' ');
    A=reshape(A,n,[]);
    out(i,:)=A;
end