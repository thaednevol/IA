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
Wi
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


%ALGORITMO PROFE
Y = zeros(1,4);
e = zeros(1,4);
aux = 1;
dwant = zeros(1,9);
counter = 0;
ec = 3;
alpha = 0.1;
beta = 0.4;
E = 1.6;

A=[Xi(1,1) Xi(2,1);
   Xi(1,2) Xi(2,2);
   Xi(1,3) Xi(2,3);
   Xi(1,4) Xi(2,4)]

while ec > E
    ec = 0;
    for i = 1:1:4
        S1 = (Xi(1,i)*Wi(2) + Xi(2,i)*Wi(4) + Wi(1));
        O1 = (1/(1+exp(-S1)));
        
        S2 = (Xi(1,i)*Wi(3) + Xi(2,i)*Wi(5) + Wi(6));
        O2 = (1/(1+exp(-S2)));
        
        S3 = (O1*Wi(7) + O2*Wi(8) + Wi(9));
        O3 = 1 / (1+exp(-S3));
        
        error = Yi(i)-O3;
        
        if error ~= 0
            d0 = error * exp(S3) / (1+exp(S3))^2;
            
            dw7 = alpha*d0*O1;
            dw8 = alpha*d0*O2;
            
            dw9 = alpha*d0;
            
            dS1 = d0*Wi(7);
            dS2 = d0*Wi(8);
            
            d1 = dS1* exp(S1) / (1 + exp(S1))^2;
            d2 = dS2* exp(S2) / (1 + exp(S2))^2;
            
            dw1 = alpha*d1;
            
            dw2 = alpha * d1 * Xi(1,i);
            dw3 = alpha * d2 * Xi(1,i);
            dw4 = alpha * d1 * Xi(2,i);
            dw5 = alpha * d2 * Xi(2,i);
            
            dw6 = alpha*d2;
            
            dw = [dw1 dw2 dw3 dw4 dw5 dw6 dw7 dw8 dw9];
                
            for k=1:1:9
                Wi(k) = Wi(k)+dw(k)+dwant(k)*beta; %momentum
            end
            
            dwant=dw;
            
        end
        
        e(i) = error;
        
    end
    ec = (1/2)*sum(e.^2);
    ec
    counter = counter + 1;
end

Wi

for i=1:1:4
    S1 = (Xi(1,i)*Wi(2) + Xi(2,i)*Wi(4) + Wi(1));
    O1 = 1/ (1+exp(-S1));
    
    S2 = (Xi(1,i)*Wi(3) + Xi(2,i)*Wi(5) + Wi(6));
    O2 = (1/(1+exp(-S2)));
    
    S3 = (O1*Wi(7) + O2*Wi(8) + Wi(9));
    O3 = 1/(1+exp(-S3));

    [Xi(1,i) Xi(2,i) O3]
end

return

if counter >= 40000
        b = 1;
        
    else
        b = 0;
    end

%% Algoritmo backpropagation

Y = zeros(1,4);

e = zeros(1,4);

aux = 1;

dwant = zeros(1,9);

counter = 0;

ec = 1;



while ec > E

ec = 0;

for i = 1:1:4

S1 = (x1(i)*w2 + x2(i)*w4 + w1);

S2 = (x1(i)*w3 + x2(i)*w5 + w6);

O1 = (1/(1+exp(-S1)));

O2 = (1/(1+exp(-S2)));

S3 = (O1*w7+O2*w8+w9);

O = (1/(1+exp(-S3)));

Y(i) = O;

error = Yd(i)-O;



if error ~= 0

d0 = error * (1/(1+exp(-S3))^2*exp(-S3));

dw7 = alpha*d0*O1;

dw8 = alpha*d0*O2;

dw9 = alpha*d0;

dS1 = d0*w7;

dS2 = d0*w8;

d1 = dS1* (1/(1+exp(-S1))^2*exp(-S1));

d2 = dS2* (1/(1+exp(-S2))^2*exp(-S2));

dw1 = alpha*d1;

dw2 = alpha*d1*x1(i);

dw3 = alpha*d2*x1(i);

dw4 = alpha*d1*x2(i);

dw5 = alpha*d2*x2(i);

dw6 = alpha*d2;

for k=1:1:9

dw = [dw1 dw2 dw3 dw4 dw5 dw6 dw7 dw8 dw9];

w(k) = w(k)+dw(k)+dwant(k)*beta; %momentum

end

dwant = dw;

REDES NEURONALES

9

w1 = w(1);

w2 = w(2);

w3 = w(3);

w4 = w(4);

w5 = w(5);

w6 = w(6);

w7 = w(7);

w8 = w(8);

w9 = w(9);

end

e(i) = error;

end

ec = (1/2)*sum(e.^2);

counter = counter + 1;



if counter >= 40000

b = 1;

break

else

b = 0;

end

end

%% Resultados

if b ~= 1

disp('-----------------------------------------------------------')

disp('Los Pesos sinapticos iniciales para la RNA son:')

disp(['w1: ',num2str(wi1)])

disp(['w2: ',num2str(wi2)])

disp(['w3: ',num2str(wi3)])

disp(['w4: ',num2str(wi4)])

disp(['w5: ',num2str(wi5)])

disp(['w6: ',num2str(wi6)])

disp(['w7: ',num2str(wi7)])

disp(['w8: ',num2str(wi8)])

disp(['w9: ',num2str(wi9)])

disp('-----------------------------------------------------------')

disp('-----------------------------------------------------------')

disp('Los Pesos sinapticos finales para la RNA son:')

disp(['w1: ',num2str(w1)])

disp(['w2: ',num2str(w2)])

disp(['w3: ',num2str(w3)])

disp(['w4: ',num2str(w4)])

disp(['w5: ',num2str(w5)])

disp(['w6: ',num2str(w6)])

disp(['w7: ',num2str(w7)])

disp(['w8: ',num2str(w8)])

disp(['w9: ',num2str(w9)])

disp('-----------------------------------------------------------')

disp(['El numero de iteraciones para el entrenamiento de la XOR es: ',num2str(counter)])

disp('-----------------------------------------------------------')

REDES NEURONALES

2007

10

disp('-----------------------------------------------------------')

disp(['La Salida deseada es: ',num2str(Yd)])

disp(['La Salida obtenida es: ',num2str(Y)])

disp('-----------------------------------------------------------')

else

disp('-----------------------------------------------------------')

disp('La red no pudo ser entrenada satisfactoriamente')

disp(['para un alpha = ',num2str(alpha)])

disp('Modifique el valor de alpha o los pesos iniciales')

disp('-----------------------------------------------------------')

end

Ahora procedemos a hacer la grafica de alpha Vs. Número de iteraciones, tomando unos

pesos constantes, variando alpha de 0.1 hasta 2, incrementandose en pasos de 0.1, un valor

de Beta fijo igual a cero y un error de 0.01. El programa que nos permite lograr tal objetivo

se muestra a continuación:

%% RED NEURONAL BACKPROPAGATION PARA UNA COMPUERTA XOR VARIANDO LOS

VALORES DE ALPHA

%*********************************************************************************************************************************************

close all

clear all

clc

%Definimos variables

%Entradas X0, X1, X2

x0 = 1;

x1 = [0 0 1 1];

x2 = [0 1 0 1];

Yd = xor(x1,x2);

%Inicializamos los pesos

wi = [0.0844 0.3998 0.2599 0.8001 0.4314 0.9106

0.1818 0.2638 0.1455];

w = wi;

beta = 0;

E = 0.01;

%% Algoritmo backpropagation

REDES NEURONALES

2007

11

contador = 0;

ciclos = zeros(1,20);

for alpha = 0.1:0.1:2

contador =contador+1;

w = wi;

Y = zeros(1,4);

e = zeros(1,4);

aux = 1;

dwant = zeros(1,9);

counter = 0;

ec = 1;

for z=1:1:9

A = num2str(z);

eval(['wi' A '=w(z)']);

eval(['w' A '=w(z)']);

clc

end



while ec > E

ec = 0;

%counter = counter + 1;

for i = 1:1:4

S1 = (x1(i)*w2 + x2(i)*w4 + w1);

S2 = (x1(i)*w3 + x2(i)*w5 + w6);

O1 = (1/(1+exp(-S1)));

O2 = (1/(1+exp(-S2)));

S3 = (O1*w7+O2*w8+w9);

O = (1/(1+exp(-S3)));

Y(i) = O;

error = Yd(i)-O;



if error ~= 0

d0 = error * (1/(1+exp(-S3))^2*exp(-S3));

dw7 = alpha*d0*O1;

dw8 = alpha*d0*O2;

dw9 = alpha*d0;

dS1 = d0*w7;

dS2 = d0*w8;

d1 = dS1* (1/(1+exp(-S1))^2*exp(-S1));

d2 = dS2* (1/(1+exp(-S2))^2*exp(-S2));

dw1 = alpha*d1;

dw2 = alpha*d1*x1(i);

dw3 = alpha*d2*x1(i);

dw4 = alpha*d1*x2(i);

dw5 = alpha*d2*x2(i);

dw6 = alpha*d2;

for k=1:1:9

dw = [dw1 dw2 dw3 dw4 dw5 dw6 dw7 dw8 dw9];

w(k) = w(k)+dw(k)+dwant(k)*beta; %momentum

end

dwant = dw;

w1 = w(1);

w2 = w(2);

w3 = w(3);

w4 = w(4);

REDES NEURONALES

2007

12

w5 = w(5);

w6 = w(6);

w7 = w(7);

w8 = w(8);

w9 = w(9);

end

e(i) = error;

end

ec = (1/2)*sum(e.^2);

counter = counter + 1;



if counter >= 15000

b = 1;

break

else

b = 0;

end

end

ciclos(contador)=counter;

end

alpha = 0.1:0.1:2;

plot(alpha,ciclos);

grid on;

title('GRÁFICA DE LA RED BACKPROPAGATION VARIANDO LOS VALORES DE ALPHA');

xlabel('alpha');

ylabel('Numero de iteraciones');

Luego realizamos la grafica de beta Vs. Número de iteraciones, tomando unos pesos

constantes, variando beta de 0 hasta 1, incrementandose en pasos de 0.1, un valor de alpha

fijo igual a 0.5 y un error de 0.01. El programa que nos permite lograr tal objetivo se muestra

a continuación:

%% RED NEURONAL BACKPROPAGATION PARA UNA COMPUERTA XOR VARIANDO BETA

%*********************************************************************************************************************************************

close all

clear all

clc

%Definimos variables

%Entradas X0, X1, X2

x0 = 1;

x1 = [0 0 1 1];

x2 = [0 1 0 1];

Yd = xor(x1,x2);

REDES NEURONALES

2007

13

%Inicializamos los pesos

wi = [0.0844 0.3998 0.2599 0.8001 0.4314 0.9106

0.1818 0.2638 0.1455];

w = wi;

alpha = 0.5

E = 0.01;

%% Algoritmo backpropagation

contador = 0;

ciclos = zeros(1,10);

for beta = 0:0.1:1

contador =contador+1;

w = wi;

Y = zeros(1,4);

e = zeros(1,4);

aux = 1;

dwant = zeros(1,9);

counter = 0;

ec = 1;

for z=1:1:9

A = num2str(z);

eval(['wi' A '=w(z)']);

eval(['w' A '=w(z)']);

clc

end



while ec > E

ec = 0;

%counter = counter + 1;

for i = 1:1:4

S1 = (x1(i)*w2 + x2(i)*w4 + w1);

S2 = (x1(i)*w3 + x2(i)*w5 + w6);

O1 = (1/(1+exp(-S1)));

O2 = (1/(1+exp(-S2)));

S3 = (O1*w7+O2*w8+w9);

O = (1/(1+exp(-S3)));

Y(i) = O;

error = Yd(i)-O;



if error ~= 0

d0 = error * (1/(1+exp(-S3))^2*exp(-S3));

dw7 = alpha*d0*O1;

dw8 = alpha*d0*O2;

dw9 = alpha*d0;

dS1 = d0*w7;

dS2 = d0*w8;

d1 = dS1* (1/(1+exp(-S1))^2*exp(-S1));

d2 = dS2* (1/(1+exp(-S2))^2*exp(-S2));

dw1 = alpha*d1;

dw2 = alpha*d1*x1(i);

dw3 = alpha*d2*x1(i);

dw4 = alpha*d1*x2(i);

dw5 = alpha*d2*x2(i);

REDES NEURONALES

14

dw6 = alpha*d2;

for k=1:1:9

dw = [dw1 dw2 dw3 dw4 dw5 dw6 dw7 dw8 dw9];

w(k) = w(k)+dw(k)+dwant(k)*beta; %momentum

end

dwant = dw;

w1 = w(1);

w2 = w(2);

w3 = w(3);

w4 = w(4);

w5 = w(5);

w6 = w(6);

w7 = w(7);

w8 = w(8);

w9 = w(9);

end

e(i) = error;

end

ec = (1/2)*sum(e.^2);

counter = counter + 1;



if counter >= 15000

b = 1;

break

else

b = 0;

end

end

ciclos(contador)=counter;

end

beta = 0:0.1:1;

plot(beta,ciclos);

grid on;

title('GRÁFICA DE LA RED BACKPROPAGATION VARIANDO LOS VALORES DE BETA');

xlabel('beta');

ylabel('Numero de iteraciones');

Finalmente realizamos un grafica en 3D variando los valores de alpha y Beta con respecto al

numero de iteraciones, el programa que cumple este objetivo se muestra a continuación:

%% RED NEURONAL BACKPROPAGATION PARA UNA COMPUERTA XOR VARIANDO ALPHA Y BETA

%*********************************************************************************************************************************************

clear all

clc

REDES NEURONALES

2007

%Definimos variables

%Entradas X0, X1, X2

x0 = 1;

x1 = [0 0 1 1];

x2 = [0 1 0 1];

Yd = xor(x1,x2);

%Inicializamos los pesos

wi = [0.0844 0.3998 0.2599 0.8001 0.4314 0.9106

0.1818 0.2638 0.1455];

w = wi;

%E = 0.01;

%% Seleccion del error deseado

C = inputdlg ('Ingrese el error deseado','Error: ');

E = eval(C{1});

clc

%% Algoritmo backpropagation

ALPHA =[];

BETA =[];

ITERACIONES =[];

CONT1=0;

CONT2=0;

for alpha = 0.1:0.1:2

CONT1 =CONT1+1;

CONT2 = 0;



for beta = 0:0.1:1

CONT2 = CONT2+1;

w = wi;

Y = zeros(1,4);

e = zeros(1,4);

dwant = zeros(1,9);

counter = 0;

ec = 1;

for z=1:1:9

A = num2str(z);

eval(['wi' A '=w(z)']);

eval(['w' A '=w(z)']);

clc

end



while ec > E

ec = 0;

for i = 1:1:4

S1 = (x1(i)*w2 + x2(i)*w4 + w1);

S2 = (x1(i)*w3 + x2(i)*w5 + w6);

O1 = (1/(1+exp(-S1)));

O2 = (1/(1+exp(-S2)));

S3 = (O1*w7+O2*w8+w9);

O = (1/(1+exp(-S3)));

Y(i) = O;

error = Yd(i)-O;



REDES NEURONALES

2007

16

if error ~= 0

d0 = error * (1/(1+exp(-S3))^2*exp(-S3));

dw7 = alpha*d0*O1;

dw8 = alpha*d0*O2;

dw9 = alpha*d0;

dS1 = d0*w7;

dS2 = d0*w8;

d1 = dS1* (1/(1+exp(-S1))^2*exp(-S1));

d2 = dS2* (1/(1+exp(-S2))^2*exp(-S2));

dw1 = alpha*d1;

dw2 = alpha*d1*x1(i);

dw3 = alpha*d2*x1(i);

dw4 = alpha*d1*x2(i);

dw5 = alpha*d2*x2(i);

dw6 = alpha*d2;

for k=1:1:9

dw = [dw1 dw2 dw3 dw4 dw5 dw6 dw7 dw8 dw9];

w(k) = w(k)+dw(k)+dwant(k)*beta; %momentum

end

dwant = dw;

w1 = w(1);

w2 = w(2);

w3 = w(3);

w4 = w(4);

w5 = w(5);

w6 = w(6);

w7 = w(7);

w8 = w(8);

w9 = w(9);

end

e(i) = error;

end

ec = (1/2)*sum(e.^2);

counter = counter + 1;



if counter >= 1000

b = 1;

break

else

b = 0;

end

end



ALPHA(CONT1,CONT2) = alpha;

BETA(CONT1,CONT2) = beta;

ITERACIONES(CONT1,CONT2) = counter;

end

end

plot3(ALPHA,BETA,ITERACIONES);

grid on;

title('GRÁFICA DE LA RED BACKPROPAGATION VARIANDO LOS VALORES DE ALPHA Y BETA');

xlabel('alpha');

ylabel('beta');

zlabel ('Número de iteraciones');