function out=GenVb(X1,X2)
n=length(X1);
for i=1:n
    out(i,:)=[num2str(X1(i,:)) '' num2str(X2(i,:))];
end
