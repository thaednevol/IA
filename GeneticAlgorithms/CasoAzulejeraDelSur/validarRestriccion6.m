function [ok,xamt]=validarRestriccion6(papa,Act,Maq,M,yam)
xamt=zeros(Act,Maq);
ok=1;
       for i=1:length(papa)
            if papa(i,2)~=0 && papa(i,1) ~= 0 && papa(i,5)~=0
                xamt(papa(i,2),papa(i,1))=papa(i,5);
            end
        end
        for p=1:length(papa)
            for m=1:Maq
                for a=1:Act
                    if xamt(a,m)<yam(a,m) && xamt(a,m)>yam(a,m)*M
                     ok=0;
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