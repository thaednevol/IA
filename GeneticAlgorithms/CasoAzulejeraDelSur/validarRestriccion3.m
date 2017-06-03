function [ok,caom,ActHerMaq]=validarRestriccion3(papa,Act,Her,Maq)
ActHerMaq=zeros(Act,Her,Maq);
for i=1:length(papa)
    if papa(i,2)~=0 && papa(i,4) ~= 0 && papa(i,1)~=0
        ActHerMaq(papa(i,2),papa(i,4),papa(i,1))=1;
    end
end

ok=1;
caom=0;

% ActHer=zeros(Act,Her);
% for i=1:length(papa)
%     if papa(i,2)~=0 && papa(i,4) ~= 0
%         ActHer(papa(i,2),papa(i,4))=1;
%     end
% end