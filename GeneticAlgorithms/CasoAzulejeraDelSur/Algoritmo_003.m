%%  ALGORITMO GENETICO - CASO OPTIMIZACION MANTENIMIENTO
%  Solucion al algoritmo
%%
clc;
clear all;
close all;
%Maq=input('Ingrese cantidad de tipos de m�quinas: ')
%Act=input('Ingrese cantidad de tipos de actividades de mantenimiento preventivo: ')
%Ope=input('Ingrese n�mero de operarios: ')
%Her=input('Ingrese cantidad de tipos de herramientas: ')
%Tie=input('Ingrese el n�mero de horas de trabajo: ')
%Papas=input('Ingrese numero de papas a generar: ')
Maq=3; Act=5; Ope=4; Her=6; Tie=12; Papas=10; NumCrom=Maq*Act;

%%
%  Se asignan los valores de los parametros
%%
nmash=zeros();
for h=1:Her
    %nmash(h)=input('Ingrese el n�mero m�ximo de actividades simultaneas por cada tipo de herramienta: ')
    nmash(h)=randi([2 Act],1,1);
end;

nmaso=zeros();
for o=1:Ope
    %nmaso(o)=input('Ingrese el n�mero m�ximo de actividades simultaneas por cada operario: ')
    nmaso(o)=randi([2 Act],1,1);
end;

actha=zeros();
for h=1:Her
    for a=1:Act
        %actha(h,a)=input('Ingrese 1 si la herramienta h sirve para ejecutar la actividad a, 0 de lo contrario: ')
        actha(h,a)=round(rand);
    end,
end;

nour=zeros();
for h=1:Her
    %nour(h)=input('Ingrese la cantidad disponible de cada herramienta: ')
    nour(h)=randi([1 Her],1,1);
end;

noa=zeros();
for o=1:Ope
    for a=1:Act
        %noa(o,a)=input('Ingrese 1 si el operario o puede ejecutar la actividad a, 0 de lo contrario: ')
        noa(o,a)=round(rand);
    end,
end;

cdm=zeros();
for m=1:Maq
    %cdm(m)=input('Ingrese el costo por hora detenida de cada m�quina: ')
    cdm(m)=randi([1 100],1,1);
end;

tdam=zeros();
for m=1:Maq
    for a=1:Act
        %tdam(a,m)=input('Ingrese las horas que tarda la actividad de mantenimiento en cada m�quina: ')
        tdam(a,m)=randi([1 100],1,1);
    end;
end;

tbfm=zeros();
for m=1:Maq
    for t=1:Tie
        %tbfm(m)=input('Ingrese el tiempo en el que se debe realizar el mantenimiento de la m�quina m: ')
        tbfm(m)=randi([1 Tie],1,1);
    end;
end;

clcm=zeros();
for m=1:Maq
    %clcm(m)=input('Ingrese el costo de penalizaci�n por hora de diferencia con respecto al tiempo en el que se deb�a realizar el mantenimiento de cada m�quina: ')
    clcm(m)=randi([1 100],1,1);
end;

iclctm=zeros();
for m=1:Maq
    %iclctm(m)=input('Ingrese el tiempo hasta el que incrementa el costo de penalizaci�n por cada m�quina: ')
    iclctm(m)=randi([1 Tie],1,1);
end;

%mb=input('Ingrese el costo m�ximo de mantenimiento de las m�quinas: ')
mb=randi([1 1000000],1,1);

%incremento=input('Ingrese la tasa de incremento del costo de penalizaci�n: ')
incremento=randi([1 10],1,1);

M=NumCrom*Papas;

p=1;


% Proceso de generaci�n de poblaci�n y verificaci�n
while p<=Papas
    papa=crear_papa(Maq,Act,Ope,Her,Tie);
    [papaok,sahm,caom,sActHerMaq,ActHerMaq,yam,ActOpeMaq,xamt]=verificarFactibilidad(papa,Maq,Act,Ope,Her,nmash,nmaso,nour,actha,M,noa);
    if papaok==1
        papasok(:,:,p)= papa;
        p=p+1;
    end;
end;   
p=1;


% Proceso de medici�n de desempe�o
FO=zeros();
while p<=size(papasok,3)
    papa=papasok(:,:,p);
    [FO(p),cmtto,cadel,catra,catrain]=calcularFO(papa,Act,Maq,cdm,tdam,tbfm,clcm,iclctm,incremento);
    p=p+1;
end;

%Se meten las funciones objetivo para crear una matriz que va a guardar los índices
for i=1:size(FO,2)
    FOs(1,i)=i;
    FOs(2,i)=FO(i);
end;
%Luego, se ordena por los valores de la función objetivo. Como resultado, los índices cambian
[Val,indices]=sort(FOs(2,:));

%Para seleccionar los n primeros índices se hace:
n=4;
indsel=indices(1:n);

%Luego, se seleccionan los individuos de la población
Poblacion=papasok;
for i=1:size(indsel,2)
    Px(:,:,i)=Poblacion(:,:,indsel(i))
end


% Proceso de selecci�n
%selpareja=input('Ingrese la cantidad de parejas de pap�s a seleccionar para el cruce: ')
selpareja=4;
[papasel]=seleccionar_parejas(papasok,selpareja);


% Proceso de cruce
n=round(NumCrom/3); m=2*round(NumCrom/3);
for i=1:selpareja
    papa1=papasel(:,:,1,i);
    papa2=papasel(:,:,2,i);
    hijo1(:,:,i)=[papa1(1:n,:);papa2(n+1:m,:);papa1(m+1:end,:)];
    hijo2(:,:,i)=[papa2(1:n,:);papa1(n+1:m,:);papa2(m+1:end,:)];
    hijos(:,:,i)=hijo1(:,:,i);
    hijos(:,:,selpareja+i)=hijo2(:,:,i);
end;

return;
% Proceso de mutaci�n
prob=1/(NumCrom*5);
for i=1:NumCrom
    hijoal(i,:)=[randi([1 Maq],1,1),randi([1 Act],1,1),randi([0 Ope],1,1),randi([0 Her],1,1),randi([0 Tie],1,1)];
end;
for j=1:NumCrom*5
    r(j)=rand();
end;


ok=1


