function [ok,sActHerMaq,ActHerMaq]=validarRestriccion3(papa,Act,Her,Maq,nour,actha)
ActHerMaq=zeros(Her,Act,Maq);
ok=1;
for i=1:length(papa)
    if papa(i,2)~=0 && papa(i,4) ~= 0 && papa(i,1)~=0
        ActHerMaq(papa(i,4),papa(i,2),papa(i,1))=1;
    end
end
sActHerMaq=zeros(Her,Act);
for m=1:Maq
    sActHerMaq(:,:)=ActHerMaq(:,:,m)+sActHerMaq(:,:);
end
if max(dot(sActHerMaq',actha')>nour)>0
    ok=0;
end;




% ActHer=zeros(Act,Her);
% for i=1:length(papa)
%     if papa(i,2)~=0 && papa(i,4) ~= 0
%         ActHer(papa(i,2),papa(i,4))=1;
%     end
% end