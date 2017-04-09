clear all;
close all;
clc;

%ANALISIS
%1. POR METODOS (PESOS FIJOS IGUALES PARA LOS TRES MODELOS)
%Cual tiene mas iteraciones
%Cual se demora mas
%Cual tiene mas variacion de peso
%2. METODO 3 (VARIAR ALFA)
%Seleccionar alfa mas optimo
%   Mas rápido
%   Cual tiene mas variacion de peso
%   Cual tiene mas iteraciones
%3 Implementar alfa adaptativo

w0=rand;
w1=rand;
w2=rand;

Wi=[w0 w1 w2];
Yi=[-1 -1 -1 1];
x0=[1 1 1 1];
x1=[0 0 1 1];
x2=[0 1 0 1];

Xi = [x0;x1;x2];

umbral=2;

Wi
Xi
Yi
[Wf,Yf,N]=perceptron_metodo4(Wi,Xi,Yi,umbral);
Wf
Yf
N

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

return;






for conjunto=1:1:3

% Definicion de los pesos iniciales
w0=rand;
w1=rand;
w2=rand;

% Se guardan los pesos iniciales
w0i=w0;
w1i=w1;
w2i=w2;

%Se define la tabla de verdad
x0=1;
x1=[0 0 1 1];
x2=[0 1 0 1];
Sd=[-1 -1 -1 1];

%Imprime la tabla de verdad
disp('----------------------------------------------------------')
disp('Tabla de verdad para AND:') 
disp(['x1 x2 sd']);
for i=1:1:4
    disp([num2str(x1(i)),' ',num2str(x2(i)),' ',num2str(Sd(i))]);
end

intentos=0;
validador=0;

%Se valida que los 4 valores estén correctos
while validador < 4
validador=0;
intentos=intentos+1;
    for i=1:1:4
      f(i)=x0*w0+x1(i)*w1+x2(i)*w2;
      disp(['f(',num2str(i),')=',num2str(w0),'*',num2str(x0),' + ',num2str(w1),'*',num2str(x1(i)),' + ',num2str(w2),'*',num2str(x2(i)),'=',num2str(f(i)),'=',num2str(f(i))]);
      
        d=2;
        if f(i)<d
          Sr(i)=-1;
        else
          Sr(i)=1;
        end
    
        if Sr(i)==Sd(i)
          %Si la salida resultante es igual a la deseada, se le suma uno al validador
          validador=validador+1;
        else
          %En caso contrario, se ajustan los pesos
          %METODO 1
          fd=Sd(i);
          %METODO 2
          fd=(Sd(i)-Sr(i));
          %METODO 3
          fd=0.1*(Sd(i)-Sr(i));
          
          
          Aw0=x0*fd
          Aw1=x1(i)*fd;
          Aw2=x2(i)*fd;
        
          w0=w0+Aw0;
          w1=w1+Aw1;
          w2=w2+Aw2;
    end
end
end

disp('----------------------------------------------------------')
disp('Los pesos iniciales son:') 
disp(['w0: ',num2str(w0i)]) 
disp(['w1: ',num2str(w1i)]) 
disp(['w2: ',num2str(w2i)])
disp('----------------------------------------------------------')
disp('Los pesos finales son:') 
disp(['w0: ',num2str(w0)]) 
disp(['w1: ',num2str(w1)]) 
disp(['w2: ',num2str(w2)]) 
disp('----------------------------------------------------------')
disp('----------------------------------------------------------')
disp(['El numero de Interacciones necesarias son:',num2str(intentos)]) 
disp('----------------------------------------------------------')

X1=0:0.01:3;
X2=(-w1/w2)*X1-(w0/w2)+(d/w2);
plot(X1,X2)
hold on
grid on


for j=1:1:4
if Sd(j)==1
    plot(x1(j),x2(j),'--gs')
else
    plot(x1(j),x2(j),'--rs')
end
end    

indice=conjunto+1;

simulacion(indice,1)=conjunto;
simulacion(indice,2)=w0i;
simulacion(indice,3)=w1i;
simulacion(indice,4)=w2i;

simulacion(indice,5)=w0;
simulacion(indice,6)=w1;
simulacion(indice,7)=w2;

simulacion(indice,8)=intentos;

end

colNames={'Experimento','Peso inicial w0','Peso inicial w1','Peso inicial w2','Peso final w0','Peso final w1','Peso final w2','No intentos'};

for i=1:size(simulacion,1)
    row{i} = [''];
end

%dispmat(simulacion,'AND',row,colNames)



