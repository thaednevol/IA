%%  Perceptrón
%
%  Análisis y desarrollo de los algoritmos del Perceptrón, método de
%  aprendizaje de clasificación supervisado. Bajo las correctas
%  suposiciones, el procedimiento de aprendizaje iterativo converge a los
%  pesos correctos, es decir, a los pesos que permiten que la red produzca
%  la salida deseada. Se analiza los diferentes métodos variando los pesos
%  iniciales y la tasa de aprendizaje.

%% Definición del algoritmo base
%
%  El algoritmo usado es el siguiente:
%
% # Se ingresan las entradas
% # Se ingresan las salidas
% # Se definen los pesos (se ingresan o se generan aleatoriamente)
% # Se define el umbral y la tasa de aprendizaje, si es necesario
% # Se calcula la salida a partir de la ecuación lineal para la fila
%   seleccionada
% # Se compara esa salida con el umbral para la definción de la salida
%   para comparar
% # Se compara la salida del punto 6 con la salida que se ingresó en el
%   punto 2. Si no son iguales, se ajustan los pesos de acuerdo al método.
%   Si son iguales, se acepta ese peso
% # Se continúa con la siguiente fila y se dirige al paso 5
%
%% Desarrollo del algoritmo
%
%  El primer paso opcional es borrar todas las variables anteriores y
%  limpiar el espacio de trabajo

clear all;
close all;
clc;

%%
%  Se definen los pesos. Para evaluar el algoritmo se debe usar en
%  principio pesos conocidos y luego, cuando se asegura que este funcione,
%  se asignan valores aleatorios.
%%
w0=rand;
w1=rand;
w2=rand;

Wi=[w0 w1 w2];

%%
%  A continuación se definen las entradas
%%

x0=[1 1 1 1];
x1=[0 0 1 1];
x2=[0 1 0 1];

Xi = [x0;x1;x2];

%%
%  Se definen las salidas
%%

Yi=[-1 -1 -1 1];

%%
% Por último, se define un umbral, que es el que define qué valor es
% considerado como cero o como uno
%%

umbral=2;

%%
%  Y luego se evalúa mediante las funciones del perceptron:
%%

[Wf,Yf,N]=perceptron_metodo2(Wi,Xi,Yi,umbral); 

%%
% _perceptron_metodo1_ es uno de los métodos usados para calcular una
% ecuación basada en el perceptrón. Otros métodos usados son el _perceptron_metodo2_
% y _perceptron_metodo3_, mostrados al final. Por motivos prácticos, se
% mostrará la salida de este algoritmo, para luego hacer un análisis de cada uno de ellos.
%
% Entonces, al ejecutar el algoritmo, la salida se muestra en la figura.
%%

 X1=0:0.01:3;
 X2=(-Wf(2)/Wf(3))*X1-(Wf(1)/Wf(3))+(umbral/Wf(3));
 plot(X1,X2)
 hold on
 grid on
 
 for j=1:1:4
 if Yi(j)==1
     plot(Xi(2,j),Xi(3,j),'--gs')
 else
     plot(Xi(2,j),Xi(3,j),'--rs')
 end
 end
 %% Primer método
 %
 % En este primer método la función delta de ajuste de los pesos es igual a
 % las salidas
 % <include>perceptron_metodo1.m</include>
 %%
 %% Segundo método
 %
 % En este segundo método la función delta de ajuste de los pesos es igual a
 % la diferencia de las salidas y las entradas
 %%
 % <include>perceptron_metodo2.m</include>
 %%
 %% Tercer método
 %
 % En este tercer método la función delta de ajuste de los pesos es igual a
 % la diferencia de las salidas y las entradas, multiplicadas por una
 % coeficiente de aprendizaje alfa
 %%
 % <include>perceptron_metodo3.m</include>
 %%
 %% Análisis de los métodos
 %
 % Para hacer una comparativa de los algoritmos, el enfoque usado es
 % analizar el tercer algoritmo en búsqueda de ciertas variables adecuadas
 % con determinados coeficientes de aprendizaje para obtener con cual alfa
 % se tiene una respuesta más rápida, cual tiene más variación de peso y
 % cual tiene mas iteraciones.
 % 
 % El primer enfoque será medir el tiempo promedio de diferentes
 % coeficientes
 %%
 
 j=1;
 for alpha=0.1:0.1:10
     t=0;
     for i=1:1:100
        w0=rand;
        w1=rand;
        w2=rand;

        Wi=[w0 w1 w2];
        tic
        [Wf,Yf,N]=perceptron_metodo3(Wi,Xi,Yi,umbral,alpha);
        t=t+toc;
     end
     alphas(j)=t;
     j=j+1;
 end
 
 figure
 alpha=0.1:0.1:10;
 plot(alpha,alphas)
 title('Tiempo usado por el método 3')
 xlabel('alpha') % x-axis label
 ylabel('Tiempo en ms') 
 hold on
 grid on
 
 %%
 % Como se puede ver, no se aprecia una diferencia significativa. El
 % siguiente método contempla el número de iteraciones.
 %%
 
 j=1;
 for alpha=0.1:0.1:10
     n_iter=0;
     for i=1:1:100
        w0=rand;
        w1=rand;
        w2=rand;

        Wi=[w0 w1 w2];
        [Wf,Yf,N]=perceptron_metodo3(Wi,Xi,Yi,umbral,alpha);
        n_iter=n_iter+N;
     end
     alphas(j)=n_iter;
     j=j+1;
 end
 
 figure
 alpha=0.1:0.1:10;
 plot(alpha,alphas)
 title('Numero de iteraciones promedio por el método 3')
 xlabel('alpha') % x-axis label
 ylabel('Iteraciones') 
 hold on
 grid on
 
 %%
 % Como se puede apreciar, no hay una diferencia significativa antes de 1,
 % por lo que se vuelve a analizar, esta vez de 0 a 1.
 %%
 
 j=1;
 maxIter=500;
 for alpha=0.01:0.01:1
     n_iter=0;
     for i=1:1:100
        w0=rand;
        w1=rand;
        w2=rand;

        Wi=[w0 w1 w2];
        [Wf,Yf,N]=perceptron_metodo3(Wi,Xi,Yi,umbral,alpha);
        n_iter=n_iter+N;
     end
     alphas(j)=n_iter;
     
     %Para encontrar el valor de alpha con el menor número de iteraciones
     if alphas(j)<maxIter
         alphaMin=alpha;
         maxIter=alphas(j);
     end
     j=j+1;
 end
 
 figure
 alpha=0.01:0.01:1;
 plot(alpha,alphas)
 title('Numero de iteraciones promedio por el método 3')
 xlabel('alpha') % x-axis label
 ylabel('Iteraciones') 
 hold on
 grid on
 
 %%
 % Usando este análisis, se encuentra un alpha que entrega un número de
 % iteraciones muy pequeño entre 0.14 y 0.18. 
 %
 % Por último, se hará el análisis con la diferencia de pesos mas pequeña y más grande 
 %%
 
 j=1;
 for alpha=0.01:0.01:1
     for i=1:1:100
        w0=rand;
        w1=rand;
        w2=rand;

        Wi=[w0 w1 w2];
        [Wf,Yf,N]=perceptron_metodo3(Wi,Xi,Yi,umbral,alpha);
        dW=Wf(1)-Wi(1);
     end
     alphas(j)=dW;
     j=j+1;
 end
 
 figure
 alpha=0.01:0.01:1;
 plot(alpha,alphas)
 title('Numero de iteraciones promedio por el método 3')
 xlabel('alpha') % x-axis label
 ylabel('Iteraciones') 
 hold on
 grid on
 
 return;
 
 el enfoque usado es el promedio
 % de cada uno de las variables a evaluar sobre 100 muestras. Las variables
 % que se van a comparar son el número de iteraciones, la duración de cada
 % algoritmo y la variación de cada peso.
 
 NiM1=0; %Numero de iteraciones del método 1
 NiM2=0; %Numero de iteraciones del método 3
 NiM3=0; %Numero de iteraciones del método 4
 
 for i=1:1:100
    w0=rand;
    w1=rand;
    w2=rand;

    Wi=[w0 w1 w2];
    [Wf,Yf,N]=perceptron_metodo2(Wi,Xi,Yi,umbral);
    NiM2=NiM2+N;
    [Wf,Yf,N]=perceptron_metodo1(Wi,Xi,Yi,umbral);
    NiM1=NiM1+N;
 end
 
 