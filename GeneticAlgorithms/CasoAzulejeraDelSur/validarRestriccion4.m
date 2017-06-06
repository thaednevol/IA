function [ok,yam]=validarRestriccion4(papa,Act,Her,Maq,M,actha,ActHerMaq)
yam=zeros(Act,Maq);
        ok=1;
        for i=1:length(papa)
            if papa(i,2)~=0 && papa(i,1) ~= 0 && papa(i,5)~=0
                yam(papa(i,2),papa(i,1))=1;
            end
        end
        for p=1:length(papa)
            for m=1:Maq
                for a=1:Act
                    for h=1:Her
                        if M*actha(h,a)*yam(a,m)<ActHerMaq(h,a,m) && actha(h,a)*yam(a,m)>ActHerMaq(h,a,m)
                           ok=0;
                        end;
                    end;
                end;
            end;
        end;   





% ActHer=zeros(Act,Her);
% for i=1:length(papa)
%     if papa(i,2)~=0 && papa(i,4) ~= 0
%         ActHer(papa(i,2),papa(i,4))=1;
%     end
% end