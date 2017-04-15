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
Wi=[-0.0188,0.6732,0.9287;-0.7273,-0.4058,0.7489;-0.4942,-0.8239,-0.0350]

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

alpha=0.7;
beta=-1;

iterations=100000000;

A=[Xi(1,1) Xi(2,1);
   Xi(1,2) Xi(2,2);
   Xi(1,3) Xi(2,3);
   Xi(1,4) Xi(2,4)]

%for i = 1:iterations
d=0;
t=0.999;
i=0;
while d<t
    i=i+1;
    Yf=zeros(1,4);
    for j=1:length(Yi)
        [Yf,Wf]=bp_metodo1();
        H1 = beta*Wi(1,1) + Xi(1,j)*Wi(1,2) + Xi(2,j)*Wi(1,3);
        O1=sigma(H1);
        H2 = beta*Wi(2,1) + Xi(1,j)*Wi(2,2) + Xi(2,j)*Wi(2,3);
        O2=sigma(H2);
        
        H3 = beta*Wi(3,1) + O1*Wi(3,2) + O2*Wi(3,3);
        
        Yf(j)=sigma(H3);
        
        e(j)=Yi(j) - Yf(j);
        
        d3_1= Yf(j) * (1 - Yf(j)) * e(j);
        
        d2_1=O1 * (1-O1) * Wi(3,2) * d3_1;
        d2_2=O2 * (1-O2) * Wi(3,3) * d3_1;
       
        for k = 1:3
             if k == 1 % Bias cases
                Wi(1,k) = Wi(1,k) + alpha * beta * d2_1;
                Wi(2,k) = Wi(2,k) + alpha * beta * d2_2;
                Wi(3,k) = Wi(3,k) + alpha * beta * d3_1;
             else % When k=2 or 3 input cases to neurons
                    Wi(1,k) = Wi(1,k) + alpha*Xi(1,j)*d2_1;
                    Wi(2,k) = Wi(2,k) + alpha*Xi(2,j)*d2_2;
                if (k==2)
                    Wi(3,k) = Wi(3,k) + alpha*O1*d3_1;
                else
                    Wi(3,k) = Wi(3,k) + alpha*O2*d3_1;
                end
             end
        end
    end
    
    ec=sum(e.^2)/2;
    d=abs(max(Yf)-min(Yf));
end
i
Yf
ec