%% RED NEURONAL BACKPROPAGATION PARA UNA COMPUERTA XOR
%*************************************************************************
%*************************************************************************

clear all;
close all;
clc;

%%
% Primero se asignan los pesos
%%

Wi=[rand rand rand rand rand rand rand rand rand];

%%
%  A continuación se definen las entradas
%%

x1=[0 0 1 1];
x2=[0 1 0 1];

Xi = [x1;x2];


%%
%  Se definen las salidas
%%

Yi=[1 -1 -1 1];

alpha=0.7;
beta=-1;

Yf=zeros(1,4);

iterations=10

A=[Xi(1,1) Xi(2,1);
   Xi(1,2) Xi(2,2);
   Xi(1,3) Xi(2,3);
   Xi(1,4) Xi(2,4)]

for i = 1:iterations
    for j=1:length(Yi)
        Wi(1)
        H1 = beta*Wi(1) + Xi(1,j)*Wi(2) + Xi(2,j)*Wi(4);
        O1=sigma(H1);
        H2 = beta*Wi(2) + Xi(1,j)*Wi(3) + Xi(2,j)*Wi(5);
        O2=sigma(H2);
        H3 = beta*Wi(9) + H1*Wi(7) + H2*Wi(8);
        Yf(j)=sigma(H3);
        
        d3_1= Yf(j) * (1 - Yf(j)) * (Yi(j) - Yf(j));
        
        
        
    end
end