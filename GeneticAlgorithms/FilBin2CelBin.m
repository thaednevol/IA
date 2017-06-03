function out=FilBin2CelBin(X)

out=zeros(length(X),size(X,2));

for i=1:length(X)
    A=num2str(X(i,:));
    n=size(A,1);
    %Como quedan espacios en blanco, se quitan:
    A=A(A~=' ');
    A=reshape(A,n,[]);
    out(i,:)=A;
end