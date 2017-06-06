function [ok,sahm,caom,sActHerMaq,ActHerMaq,yam,ActOpeMaq,xamt]=verificarFactibilidad(papa,Maq,Act,Ope,Her,nmash,nmaso,nour,actha,M,noa)

ok=1;
sahm=zeros();
caom=zeros();
sActHerMaq=zeros();
ActHerMaq=zeros();
ActOpeMaq=zeros();
xamt=zeros();
yam=zeros();


    [papaok,sahm]=validarRestriccion1(papa,Her,nmash);
    if papaok==1
        [papaok,caom]=validarRestriccion2(papa,Ope,nmaso);
    end;
    if papaok==1
        % <- Lo que aparece en el workspace 5 actividades x 6 herramientas x 3 maquinas
        [papaok,sActHerMaq,ActHerMaq]=validarRestriccion3(papa,Act,Her,Maq,nour,actha);
    end;
    if papaok==1
        [papaok,yam]=validarRestriccion4(papa,Act,Her,Maq,M,actha,ActHerMaq);
    end;
    if papaok==1
        [papaok,ActOpeMaq]=validarRestriccion5(papa,Act,Ope,Maq,M,noa,yam);
    end;
    if papaok==1
        [papaok,xamt]=validarRestriccion6(papa,Act,Maq,M,yam);
    end;
    if papaok==1
        ok=1;
    end
