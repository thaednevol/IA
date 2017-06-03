clear all;
%numero_variables=input('Digite el numero de variables');
numero_variables=2;
%precision=input('Digite la precision');
precision=5;
%numero_poblacion_inicial=input('Digite la poblacion inicial');
numero_poblacion_inicial=100;
%pc==input('Ingrese la rata de cruce');
pc=0.5;
%pm==input('Ingrese la rata de mutación');
pm=0.01;

%tamano_cromosomas=0;
% for i=1:numero_variables
%     variables(i,1)=input('Digite el l�mite inferior');
%     variables(i,2)=input('Digite el l�mite superior');
%     variables(i,3)=floor(log2((variables(i,2)-variables(i,1))*10^precision)+1);
%     tamano_cromosomas=tamano_cromosomas+variables(i,3);
% end

variables(1,1)=-3;
variables(1,2)=12.1;
%El resultado del siguiente procedimiento es 21
variables(1,3)=floor(log2(( variables(1,2) - variables(1,1) )*10^precision)+1);

variables(2,1)=4.1;
variables(2,2)=5.8;
%El resultado del siguiente procedimiento es 18
variables(2,3)=floor(log2((variables(2,2)-variables(2,1))*10^precision)+1);

%El resultado del siguiente procedimiento es 39
tamano_cromosomas=variables(1,3)+variables(2,3);

%Se crea la poblacion inicial, aleatoriamente entre 0 y 1
poblacion_inicial=round(rand(numero_poblacion_inicial,tamano_cromosomas));

%Se seleccionan las dos porciones para la generacion de los dos X 
X1=poblacion_inicial(:,1:variables(1,3));
X2=poblacion_inicial(:,variables(1,3)+1:tamano_cromosomas);

%Se generan las palabras para cada fila: X transformado fila binaria a celda decimal
%Fila binaria a celda binaria
X1b=FilBin2CelBin(X1);
X2b=FilBin2CelBin(X2);

%Fila binaria a celda decimal
X1t=FilBin2CelDec(X1);
X2t=FilBin2CelDec(X2);

%X real
%Celda decimal a numero real
X1r=CelDec2NumRea(variables(1,1), variables(1,2), variables(1,3) , X1t);
X2r=CelDec2NumRea(variables(2,1), variables(2,2), variables(2,3) , X2t);

%Geracion de V binario
Vb=GenVb(X1b,X2b);
%Generacion de V real
V=GenVr(X1r,X2r);

%Se evalúa la función objetivo
E=funcionObjetivo(V);

%Se calcula la aptitud total de la población
ATP=0;
for i=1:length(E)
    ATP=E(i) + ATP;
end

%Se calculan las probabilidades de cada cromosoma
p=zeros(length(E),1);
for i=1:length(E)
    p(i,:)=E(i)/ATP;
end
    
%Se calculan las probabilidades acumuladas
qa=0;
q=zeros(length(p),1);

for i=1:length(p)
    qa=qa+p(i);
    q(i,:)=qa;
end

%Procedimiento de seleccion
%1. Se genera r numeros aleatorios
r=rand(numero_poblacion_inicial,1);
%2. Seleccion de cromosomas
Vn=zeros(length(q),1);
for i=1:length(q)
    if r(i)<=q(i)
        Vn(i,:)=V(1);
    else
        Vn(i,:)=V(i);
    end
end

%Procedimiento de cruce
%1. Se seleccionan los padres.
k=1;
padre_temp=Vb;

for i=1:length(Vn)
    %Es una de las formas que se encontró para generar números aleatrorios en el rango
    %r = min(p) + (max(p)-min(p)).*rand;
    r=rand;
    if r<pc
        padre_temp(k,:)=Vb(i,:);
        k=k+1;
    end
end

padre=padre_temp(1:k-1,:);

%2. Se genera una matriz de números aleatorios enteros entre [2 , No de bits -1]
r=randi([2 tamano_cromosomas-1],numero_poblacion_inicial,1);

i=1;
j=1;
Vh=zeros(numero_poblacion_inicial,tamano_cromosomas);

while i<numero_poblacion_inicial
    rl=r(i);
    [padre1,padre2]=traerPareja(padre);
    p1=padre1(1:rl);
    p2=padre2(rl+1:end);
    Vh(i,:)=[p1 p2];
    p3=padre1(rl+1:end);
    p4=padre2(1:rl);
    Vh(i+1,:)=[p3 p4];
    i=i+1;
end

%Para la mutación, se vuelve a generar una matriz de números aleatorios, que serviran para evaluar
%la probabilidad
r=rand(tamano_cromosomas*length(Vh),1);
contador=0;
A=Vh;
for k=1:length(r)
    if r(k)<pm
        Vh=mutar(Vh,k);
    end
end
B=Vh;
C=A==B;

% 1 Numero de variables
% 2 Limites inferior y superior
% 3 Precision
% 4 Numero de individuos
% 5 Probabilidad de cruce
% 6. Probabilidad de mutacion
% 8 Numero de generaciones