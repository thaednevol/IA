%%  ALGORITMO GENETICO - CASO OPTIMIZACI�N MANTENIMIENTO
%  Solucion al algoritmo
%%
clc;
clear all;
close all;
%Maq=input('Ingrese numero de maquinas: ')
%Act=input('Ingrese numero de actividades de mantenimiento preventivo: ')
%Ope=input('Ingrese numero de operarios: ')
%Her=input('Ingrese numero de herramientas: ')
%Tur=input('Ingrese numero de turnos: ')
%Papas=input('Ingrese numero de papas a generar: ')
Maq=3; Act=5; Ope=4; Her=6; Tur=12; Papas=1; NumCrom=Maq*Act;

%%
%  Se asignan los valores de los parametros
%%
nmash=zeros();
for h=1:Her
    %nmash(h)=input('Ingrese el numero maximo de actividades simultaneas por cada tipo de herramienta: ')
    nmash(h)=randi([2 Act],1,1);
end;

nmaso=zeros();
for o=1:Ope
    %nmaso(o)=input('Ingrese el numero maximo de actividades simultaneas por cada operario: ')
    nmaso(o)=randi([2 Act],1,1);
end;

actha=zeros();
for h=1:Her
    for a=1:Act
        %actha(h,a)=input('Ingrese si la herramienta h sirve para ejecutar la actividad a: ')
        actha(h,a)=round(rand);
    end,
end;

nour=zeros();
for h=1:Her
    %nour(h)=input('Ingrese la cantidad disponible de cada herramienta: ')
    nour(h)=randi([1 Her],1,1);
end;

p=1;

while p<=Papas
    papa=crear_papa(Maq,Act,Ope,Her,Tur);
    [papaok,sahm]=validarRestriccion1(papa,Her,nmash);
    if papaok==1
        [papaok,caom]=validarRestriccion2(papa,Ope,nmaso);
    end;
    if papaok==1
        % <- Lo que aparece en el workspace 5 actividades x 6 herramientas x 3 maquinas
        [papaok, var1, ActHerMaq]=validarRestriccion3(papa,Act,Her,Maq);
    end;
    
    if papaok==1
        papasok(:,:,p)= papa;
        p=p+1;
    end;
end;   



