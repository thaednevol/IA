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
entradas =-20:1:20;
salidas = [0.0875 0.0002 0.0366 0.3178 0.8151 1.2631 1.1523 -0.4252 0.5477 1.2055 1.2309 0.7715 0.2621 0.0223 -0.0014 -0.1190 -0.5309 -1.0681 -1.2961 -0.9002  0 0.9002 -1.2961  1.0681  0.5309  0.1190  0.0014 -0.0223 -0.2621 -0.7715 -1.2309 -1.2055 -0.5477  0.4252  1.1523 1.2631  0.8151  0.3178  0.0366  0.0002  0.0875];

%% Función feedforwardnet
% La función newff quedó obsoleta a partir de la versión de 2010b. A partir de ese momento, se recomienda la función
% feedforwardnet.
%
% Esta función toma como argumentos el número de capas ocultas y opcionalmente la función de entrenamiento, por defecto 'trainlm'.
% Así, para desarrollar el algoritmo se hace:
%%
desc = feedforwardnet;
[desc,tr] = train(desc,entradas,salidas);
Y = sim(desc,entradas);
figure('units','normalized','outerposition',[0 0 1 1])
plot(entradas,salidas,'g');grid on;hold on;
plot(entradas,Y,'ro');
title(['Comportamiento de la RNA con feedforwardnet'])
xlabel('x');ylabel('Y = x^3')

FunTra=char('trainlm','trainbfg','trainrp','traingda');
%NumCap=100; -> Usado para feedforwardnet
NumIter=1000;
ParObj=0.001;
ParObjini=0.001;
MSEobj=0.05;
NumLy1=round(size(entradas,2)/3);
NumLy2=1;
NeuMod=char('tansig','purelin','logsig');
i=1;%Contador general
j=1;%Contador de respuestas 
ecm=zeros();
minEcm=0.25;

for ft=1:size(FunTra,1)
    for nl2=1:NumLy2
        for nl1=1+nl2:NumLy1
            for nml1=1:size(NeuMod,1)
                for nml2=1:size(NeuMod,1)
                    for ni=NumIter:NumIter
                        for po=ParObjini:0.0001:ParObj
                            %desc = myFF(minmax(entradas),[nl1 nl2],{strtrim(NeuMod(nml1,:)) strtrim(NeuMod(nml2,:))},strtrim(FunTra(ft,:)));
                            descNet=myFF(minmax(entradas),nl1,nl2,strtrim(NeuMod(nml1,:)),strtrim(NeuMod(nml2,:)),strtrim(FunTra(ft,:)));
                            descNet.trainParam.epochs = ni;
                            descNet.trainParam.goal = po;
                            descNet.trainParam.showWindow=0; 
                            [descOut,tr] = train(descNet,entradas,salidas);
                            Y = sim(descOut,entradas);
                            l=size(Y,2);
                            d=0;
                            for j=1:l
                                d=d+(Y(j)-salidas(j))^2;
                            end
                            ecm(i)=d/l;
                            if ecm(i)<minEcm
                                %AA(j,:)=[FunTra(ft,:),num2str(nl1),' ',num2str(nl2),' ',NeuMod(nml1,:),NeuMod(nml2,:)];
                                [FunTra(ft,:),NeuMod(nml1,:),NeuMod(nml2,:)]
                                [num2str(nl1),' ',num2str(nl2)]
                                minEcm=ecm(i);
                                figure('units','normalized','outerposition',[0 0 1 1])
                                plot(entradas,salidas,'g');
                                grid on;hold on;
                                plot(entradas,Y,'ro');
                                title(['Comportamiento de la RNA con feedforwardnet, numero de ca ', num2str(i)]);
                                xlabel('x');ylabel('Y = x^3');
                                j=j+1;
                            end
                            i=i+1;
                        end
                    end
                end
            end
        end
    end
end
return;
 





perf=zeros();
for i=1:1:50
    desc = feedforwardnet(i);
    desc.trainParam.epochs=10000;
    %desc.trainParam.goal=0.0001;
    [desc,tr] = train(desc,entradas,salidas);
    y=desc(entradas);
    Y = sim(desc,entradas);
    
    l=size(Y,2);
    d=0;
    for j=1:l
        d=d+(Y(j)-salidas(j))^2;
    end
    ecm(i)=d/l;
    if ecm(i)<0.06
        figure('units','normalized','outerposition',[0 0 1 1])
        plot(entradas,salidas,'g');
        grid on;
        hold on;
        plot(entradas,Y,'ro');
        title(['Comportamiento de la RNA con feedforwardnet, numero de capas= ', num2str(i)])
        xlabel('x')
        ylabel('Y = x^3')
        perf(i) = perform(desc,y,salidas);
    end
    %%

    desc=zeros();
end

%% Conclusiones
% # Se hicieron variaciones con las entradas para determinar cual da el mejor entrenamiento. Entre más pasos tengan las entradas y
% las salidas, una mejor correspondencia se tiene de la red.
% # Con los valores iniciales de entrada y salida, no se puede concluir con cuantas capas la red es óptima. Si se introducen
% más pasos, a partir de 2 capas la red tiene buenos resultados
% # Es necesario evaluar más funciones de transferencia, número de iteraciones, funciones de entrenamiento, entre otros parámetros