function [papa]=crear_papa_2(Maq,Act,Ope,Her,Tie)

NumCrom=Maq*Act;

cromosoma=zeros(NumCrom,5);
for j=1:Act
    index=Maq*(j-1);
    for i=1:Maq
        k=index+i;
        cromosoma(k,1)=i;
    end;
end;
for j=1:Act
    index=Maq*(j-1);
    for i=1:Maq
       cromosoma(index+i,2)=j;
    end;
end;
for j=1:NumCrom
    cromosoma(j,3)=randi([0 Ope],1,1);
    cromosoma(j,4)=randi([0 Her],1,1);
    cromosoma(j,5)=randi([0 Tie],1,1);
end;

papa=cromosoma;