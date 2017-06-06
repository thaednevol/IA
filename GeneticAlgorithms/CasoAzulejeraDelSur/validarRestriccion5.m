function [ok,ActOpeMaq]=validarRestriccion5(papa,Act,Ope,Maq,M,noa,yam)
ActOpeMaq=zeros(Ope,Act,Maq);
ok=1;
for i=1:length(papa)
    if papa(i,2)~=0 && papa(i,3) ~= 0 && papa(i,1)~=0
        ActOpeMaq(papa(i,3),papa(i,2),papa(i,1))=1;
    end
end
        for p=1:length(papa)
            for m=1:Maq
                for a=1:Act
                    for o=1:Ope
                        if M*noa(o,a)*yam(a,m)<ActOpeMaq(o,a,m) && noa(o,a)*yam(a,m)>ActOpeMaq(o,a,m)
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