%% GRAFICA DE LA FUNCIÓN CÚBICA MEDIANTE UNA RNA
%
% Utilizar los comandos de MATLAB para realizar el entrenamiento y la posterior validación de la RNA que genere la respuesta de
% una función cúbica, mediante MATLAB, usando el comando newff
%%
%%  NEWFF
% El comndo newff de MATLAB crea una red con el algoritmo de backpropagtion con realimentación (feed-forward) el cual consiste en
% Nl capas, usando la función de peso DOTPROD, la función de entrada de red NETSUM y las funciones de transferencia especificadas
%
% La primera capa tiene pesos procedentes de la entrada. Cada capa posterior tiene un peso procedente de la capa anterior. Todas
% las capas tienen sesgos. La última capa es la salida de red. Los pesos y sesgos de cada capa se inicializan con INITNW.
%
% La adaptación se hace con TRAINS, que actualiza las ponderaciones con la función de aprendizaje especificada. El entrenamiento
% se realiza con la función de entrenamiento especificada. El rendimiento se mide de acuerdo con la función de rendimiento
% especificada.
%%
close all
clear all
clc
%%  Algoritmo usado
% 1) Definimos las entradas y salidas deseadas para el entrenamiento y la
% validación
%%
entradas =-5:1:5;
salidas = entradas.^3;

entradas_v=-5:0.1:5;
salidas_v = entradas_v.^3;
%%
% La gráfica de la función resultante se muestra a continuación:
%%
figure('units','normalized','outerposition',[0 0 1 1])
plot(entradas_v,salidas_v,'g');
title('Salida deseada')
xlabel('x')
ylabel('Y = x^3')
grid on
%%
% 2) Se crea la red con los valores establecidos y los parámetros por defecto {'tansig' 'purelin'}, el número de iteraciones a
% usar (epochs=1000) y el objetivo (goal=0.0001). Se asigna a la variable cubica y la función de transferencia generada a tr
%%
cubica = newff(minmax(entradas),[5 1],{'tansig' 'purelin'});
cubica.trainParam.epochs = 1000;
cubica.trainParam.goal = 0.0001;
[cubica,tr] = train(cubica,entradas,salidas);
%%
% 3) Se simulan las entradas de entrenamiento y validación.
%%
Y = sim(cubica,entradas);
V = sim(cubica,entradas_v);
%%
% Se grafican las salidas
%%
figure('units','normalized','outerposition',[0 0 1 1])
plot(entradas,salidas,'g');
grid on;
hold on;
plot(entradas,Y,'ro');
hold on;
plot(entradas_v,V,'bx');
title('Comportamiento de la RNA')
xlabel('x')
ylabel('Y = x^3')
grid on
hold on
%%
% Gráfica del desempeño de la red
%%
figure('units','normalized','outerposition',[0 0 1 1])
plotperform(tr);
grid on
hold on
%%
% Gráfica de los parámetros Gradiente, Mu y las validaciones
%%
figure('units','normalized','outerposition',[0 0 1 1])
plottrainstate(tr);
grid on
hold on
%%
% Gráfica de la regresión de los datos
%%
figure('units','normalized','outerposition',[0 0 1 1])
y=cubica(entradas);
pr=plotregression(salidas,y,'Regression');
grid on
hold on
%% Función feedforwardnet
% La función newff quedó obsoleta a partir de la versión de 2010b. A partir de ese momento, se recomienda la función
% feedforwardnet.
%
% Esta función toma como argumentos el número de capas ocultas y opcionalmente la función de entrenamiento, por defecto 'trainlm'.
% Así, para desarrollar el algoritmo se hace:
%%
perf=zeros();
for i=1:1:5
    cubica = feedforwardnet(i);
    cubica.trainParam.epochs=1000;
    cubica.trainParam.goal=0.0001;
    [cubica,tr] = train(cubica,entradas,salidas);
    y=cubica(entradas);
    Y = sim(cubica,entradas);
    V = sim(cubica,entradas_v);

    figure('units','normalized','outerposition',[0 0 1 1])
    plot(entradas,salidas,'g');
    grid on;
    hold on;
    plot(entradas,Y,'ro');
    hold on;
    plot(entradas_v,V,'bx');
    title(['Comportamiento de la RNA con feedforwardnet, numero de capas= ', num2str(i)])
    xlabel('x')
    ylabel('Y = x^3')
    perf(i) = perform(cubica,y,salidas);
    %%
% Gráfica del desempeño de la red
%%
figure('units','normalized','outerposition',[0 0 1 1])
plotperform(tr);
grid on
hold on
%%
% Gráfica de los parámetros Gradiente, Mu y las validaciones
%%
figure('units','normalized','outerposition',[0 0 1 1])
plottrainstate(tr);
grid on
hold on
%%
% Gráfica de la regresión de los datos
%%
figure('units','normalized','outerposition',[0 0 1 1])
y=cubica(entradas);
pr=plotregression(salidas,y,'Regression');
grid on
hold on

    cubica=zeros();
end

%% Conclusiones
% # Se hicieron variaciones con las entradas para determinar cual da el mejor entrenamiento. Entre más pasos tengan las entradas y
% las salidas, una mejor correspondencia se tiene de la red.
% # Con los valores iniciales de entrada y salida, no se puede concluir con cuantas capas la red es óptima. Si se introducen
% más pasos, a partir de 2 capas la red tiene buenos resultados
% # Es necesario evaluar más funciones de transferencia, número de iteraciones, funciones de entrenamiento, entre otros parámetros