function [pout]=BinChar2BinVect(pin)
    pout=zeros(size(pin,1),size(pin,2));
    for i=1:size(pin,1)
        pout(i,:)=pin(i,:)-'0';
    end