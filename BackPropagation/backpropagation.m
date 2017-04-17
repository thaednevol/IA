%% RED NEURONAL BACKPROPAGATION PARA UNA COMPUERTA XOR
%*************************************************************************
%*************************************************************************

clear all;
close all;
clc;


%%
% Primero se asignan los pesos
%%

Wi=[rand rand rand;rand rand rand;rand rand rand];

%%
%  A continuación se definen las entradas
%%

x1=[0 0 1 1];
x2=[0 1 0 1];

Xi = [x1;x2];


%%
%  Se definen las salidas
%%
Yi=[0 1 1 0];


A=[Xi(1,1),Xi(2,1),Yi(1);
   Xi(1,2),Xi(2,2),Yi(2);
   Xi(1,3),Xi(2,3),Yi(3);
   Xi(1,4),Xi(2,4),Yi(4)]


d=0;
t=0.8;

%for i = 1:iterations

alpha=0.7;
beta=-1;

iteraciones=0;

while d<t
    iteraciones=iteraciones+1;
    Yf=zeros(1,4);
    for j=1:length(Yi)
        [Yf,Wf,error]=bp_metodo1(Xi,Wi,Yi,alpha,beta,j,Yf);
        Wi=Wf;
    end
    
    ec=sum(error.^2)/2;
    if d==abs(max(Yf)-min(Yf))
       print "Algo raro paso";
       return
       
    else
        d=abs(max(Yf)-min(Yf))
    end
end

iteraciones
Yf
ec

%% Modificacion de alpha
%
%%
Wi=[rand rand rand;rand rand rand;rand rand rand];

indice=1;

for alpha=0.1:0.1:2
beta=0;

d=0;
iteraciones=0;
Wp=Wi;

while d<t
    tic;
    iteraciones=iteraciones+1;
    Yf=zeros(1,4);
    for j=1:length(Yi)
        [Yf,Wf,error]=bp_metodo1(Xi,Wp,Yi,alpha,beta,j,Yf);
        Wp=Wf;
    end
    tiempo_usado=toc;
    ec=sum(error.^2)/2;
    if d==abs(max(Yf)-min(Yf))
       print "Algo raro paso";
       return
    else
        d=abs(max(Yf)-min(Yf));
        [d alpha]
    end
end
Va(indice,1)=[ec];
Va(indice,2)=[tiempo_usado];
Va(indice,3)=[iteraciones];
Va(indice,4)=Wi(9)-Wf(9);
indice=indice+1;
end

x=0.1:0.1:2;

 subplot(2,2,1)
 y1=Va(:,1);
 plot(x,y1);
 grid on
 title('Error cuadrático vs alpha')

 subplot(2,2,2)
 y2=Va(:,2);
 plot(x,y2);
 grid on
 title('Tiempo usado vs alpha')

 subplot(2,2,3)
 y3=Va(:,3);
 plot(x,y3);
 grid on
 title('Iteraciones vs alpha')

 subplot(2,2,4)
 y4=Va(:,4);
 plot(x,y4);
 grid on
 title('Delta peso neurona salida vs alpha')

 %% MODIFICACION ALFA 2
 %
 %%
indice=1;

minX=0.1;
maxX=2;
step=0.01;

x=minX:step:maxX;

Va=zeros(length(x),4);

for alpha=minX:step:maxX
beta=0;

d=0;
iteraciones=0;
Wp=Wi;

while d<t
    tic;
    iteraciones=iteraciones+1;
    Yf=zeros(1,4);
    for j=1:length(Yi)
        [Yf,Wf,error]=bp_metodo1(Xi,Wp,Yi,alpha,beta,j,Yf);
        Wp=Wf;
    end
    tiempo_usado=toc;
    ec=sum(error.^2)/2;
    if d==abs(max(Yf)-min(Yf))
       print "Algo raro paso";
       return
    else
        d=abs(max(Yf)-min(Yf));
        [d alpha]
    end
end
Va(indice,1)=[ec];
Va(indice,2)=[tiempo_usado];
Va(indice,3)=[iteraciones];
Va(indice,4)=Wi(9)-Wf(9);
indice=indice+1;
end


figure

 subplot(2,2,1)
 y1=Va(:,1);
 plot(x,y1);
 grid on
 title('Error cuadrático vs alpha')

 subplot(2,2,2)
 y2=Va(:,2);
 plot(x,y2);
 grid on
 title('Tiempo usado vs alpha')

 subplot(2,2,3)
 y3=Va(:,3);
 plot(x,y3);
 grid on
 title('Iteraciones vs alpha')

 subplot(2,2,4)
 y4=Va(:,4);
 plot(x,y4);
 grid on
 title('Delta peso neurona salida vs alpha')

 