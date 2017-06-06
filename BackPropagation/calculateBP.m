function [Yf,Wi,ex,ec,d,jj,kk,b] = calculateBP(Xi,Wi,Yi,alpha,beta,Yf,d,b,jj,kk)
Ndecimals = 5;
ex=zeros();

for j=1:length(Yi)
    [Yf,Wf,error]=bp_metodo1(Xi,Wi,Yi,alpha,beta,j,Yf);
    ex(j)=error;
    Wi=Wf;
end

ec=sum(error.^2)/2;
    
L=sort(Yf);
Ymin=L(1)+L(2);
Ymax=L(3)+L(4);

%if d==abs(max(Yf)-min(Yf))
if d==abs((Ymax-Ymin)/2)
    return;
else
    d=abs((Ymax-Ymin)/2);
end
    
f = 10.^Ndecimals;
Yfmax=round(f*max(Yf))/f;
Yfmin=round(f*min(Yf))/f;    
a=Yfmin/Yfmax;
if a==b
    jj=jj+1;
else
    jj=0;
    b=a;
end
if jj>kk
    kk=jj;
end
