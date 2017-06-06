function [FO,cmtto,cadel,catra,catrain]=calcularFO(papa,Act,Maq,cdm,tdam,tbfm,clcm,iclctm,incremento)
    yam=zeros(Act,Maq);
    xamt=zeros(Act,Maq);
        for i=1:length(papa)
            if papa(i,2)~=0 && papa(i,1) ~= 0 && papa(i,5)~=0
                yam(papa(i,2),papa(i,1))=1;
                xamt(papa(i,2),papa(i,1))=papa(i,5);
            end;
        end;
       
    cmtto=0;
    cadel=0;
    catra=0;
    catrain=0;
    for m=1:Maq
        for a=1:Act
            cmtto=cmtto+cdm(m)*tdam(a,m)*yam(a,m);
            td=abs(tbfm(m)-xamt(a,m));
            if tbfm(m)>xamt(a,m)
                cadel=cadel+clcm(m)*td;
            elseif tbfm(m)<xamt(a,m)
                    if td<=iclctm(m)
                        catrain=catrain+td*incremento*clcm(m);                      
                    else
                        catrain=catrain+iclctm(m)*incremento*clcm(m);
                        catra=catra+catrain*((xamt(a,m)-(tbfm(m)+iclctm(m))));                                         
                    end;
            end;
        end;
    end;
    FO=cmtto+cadel+catra+catrain;  