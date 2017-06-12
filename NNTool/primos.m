n=63;
inPrimo=zeros(n,6);
outPrimo=zeros(n,1);
for i=1:1:n
    inPrimo(i,:)=bitget(i, fix(log2(n))+1:-1:1);
    
    if i~=1 && i~=2
        y=2;
        x=i;
        outPrimo(i)=1;
        while (y<=sqrt(x))
            if(rem(x,y)==0)
                outPrimo(i)=0;
                break;
            end
            y = y + 1;
        end 
    else
        outPrimo(i)=1;
    end
end
inPrimo=inPrimo';
%outPrimo=outPrimo;

nVal=10;
inVPrimo=zeros(nVal,fix(log2(nVal))+1);
outVPrimo=zeros(nVal,1);
for i=1:1:nVal
    k=randi([1 nVal],1,1);
    inVPrimo(i,:)=bitget(k, fix(log2(nVal))+1:-1:1);
    
    if k~=1 && k~=2
        y=2;
        x=k;
        outVPrimo(i)=1;
        while (y<=sqrt(x))
            if(rem(x,y)==0)
                outVPrimo(i)=0;
                break;
            end
            y = y + 1;
        end 
    else
        outVPrimo(i)=1;
    end
end

%outVPrimo=outVPrimo';

return

outPrimo=[1 1 1 0 0 0 1 0 1 0 1 0 0 0 0 0 1 0 0 0 1 0 1 0 0 0 0 0 1 0 1 0]; 
