close all;

%%  APRENDIZAJE NEURO-ADAPTATIVO Y ANFIS
%
%  La estructura básica del sistema de inferencia fuzzy de Mamdani es un modelo que mapea características de entrada a funciones
%  de pertenencia de entrada a reglas, reglas a un conjunto de características de salida, y las funciones de pertenencia de salida
%  a valores con salida de 'valoración-única'o a una decisión asociada con  la salida. Tal sistema usa funciones de pertenencia
%  fijas que son escogidas arbitrariamente y una regla de estructura que es esencialmente predeterminada por la interpretación del
%  usuario de las características de las variables del modelo.
%
%  ANFIS y el diseñador neuro-difuso aplican técnicas de inferencia difusa al modelado de datos. La forma de las funciones de 
%  pertenencia depende de los parámetros y cambiar estos parámetros cambia la forma de la función de pertenencia. 
%  En lugar de simplemente mirar los datos para elegir los parámetros de la función de pertenencia, se eligen automáticamente los 
%  parámetros de la función de pertenencia utilizando estas aplicaciones de Fuzzy Logic Toolbox.
%
%  Por ejemplo, si se desea aplicar inferencia difusa a un sistema para el cual ya tiene una colección de datos de entrada/salida
%  que se desea utilizar para modelar, seguir el modelo o algún escenario similar. No necesariamente tiene una estructura de 
%  modelo predeterminada basada en las características de las variables en su sistema.
%
%  En algunas situaciones de modelado, no se puede discernir lo que las funciones de pertenencia deberían parecer simplemente
%  al mirar los datos. En lugar de elegir arbitrariamente los parámetros asociados a una función de pertenencia dada, 
%  estos parámetros se podrían elegir para adaptar las funciones de pertenencia a los datos de entrada/salida para tener en 
%  cuenta estos tipos de variaciones en los valores de datos. En tales casos, puede utilizar las técnicas de aprendizaje 
%  neuro-adaptativas de la Fuzzy Logic Toolbox incorporadas en el comando anfis.
%
%  El método de aprendizaje neuro-adaptativo funciona de manera similar al de las redes neuronales. Las técnicas de aprendizaje 
%  neuro-adaptativas proporcionan un método para el procedimiento de modelado difuso para aprender información sobre un conjunto
%  de datos. El software Fuzzy Logic Toolbox calcula los parámetros de la función de pertenencia que mejor permiten que el sistema
%  de inferencia difuso asociado rastree los datos de entrada/salida dados. La función Fuzzy Logic Toolbox que realiza este 
%  parámetro de función de pertenencia se llama anfis en MATLAB.
%
%  El acrónimo ANFIS deriva su nombre del sistema de inferencia neurodifuso adaptativo. Utilizando un conjunto de datos de 
%  entrada/salida dado, la función del toolbox anfis construye un sistema de inferencia difuso (FIS) cuyos parámetros de función 
%  de pertenencia se ajustan usando un algoritmo de propagación posterior solo o en combinación con un método de mínimos cuadrados 
%  Este ajuste permite que sus sistemas difusos aprendan de los datos que están modelando.
%
%  Una estructura de tipo red similar a la de una red neuronal, que mapea entradas a través de funciones de pertenencia de 
%  entrada y parámetros asociados, y luego a través de funciones de pertenencia de salida y parámetros asociados a salidas, puede 
%  usarse para interpretar el mapa de entrada/salida.
%
%  Los parámetros asociados con las funciones de pertenencia cambian a través del proceso de aprendizaje. El cálculo de estos 
%  parámetros (o su ajuste) es facilitado por un vector gradiente. Este vector gradiente proporciona una medida de lo bien que 
%  el sistema de inferencia difusa está modelando los datos de entrada/salida para un conjunto dado de parámetros. Cuando se 
%  obtiene el vector de gradiente, se puede aplicar cualquiera de varias rutinas de optimización para ajustar los parámetros para 
%  reducir en alguna medida de error. Esta medida de error se define normalmente por la suma de la diferencia cuadrática entre 
%  salidas reales y deseadas. Anfis utiliza backpropagation o una combinación de la estimación por mínimos cuadrados y 
%  backpropagation para la estimación de los parámetros de la función de pertenencia.
%
%  El enfoque de modelado utilizado por anfis es similar a muchas técnicas de identificación de sistemas. En primer lugar, se 
%  plantea la hipótesis de una estructura de modelo parametrizada (relacionar entradas a funciones de pertenencia a reglas a 
%  salidas a funciones de pertenencia, etc.). A continuación, recopila datos de entrada/salida en un formato que pueda ser 
%  utilizado por anfis para el entrenamiento. A continuación, puede utilizar anfis para entrenar el modelo FIS para emular los
%  datos de entrenamiento que se le presentan modificando los parámetros de la función de pertenencia de acuerdo con un criterio
%  de error elegido.
%
%  En general, este tipo de modelado funciona bien si los datos de entrenamiento presentados a anfis para entrenar los
%  parámetros de la función de pertenencia son totalmente representativos de las características de los datos que el FIS
%  entrenado pretende modelar. En algunos casos, sin embargo, los datos se recogen utilizando medidas ruidosas, y los datos de
%  entrenamiento no pueden ser representativos de todas las características de los datos que se presentarán al modelo. En tales
%  situaciones, la validación del modelo es útil.
%
%  La validación del modelo es el proceso por el cual los vectores de entrada de los conjuntos de datos de entrada/salida en los
%  cuales el FIS no fue entrenado, son presentados al modelo FIS entrenado para ver cómo el modelo FIS predice los valores de
%  salida del conjunto de datos correspondiente.
%  
%  Un problema con la validación de modelos para modelos construidos usando técnicas adaptativas es seleccionar un conjunto de
%  datos que sea representativo de los datos que el modelo entrenado pretende emular, pero suficientemente distintos del conjunto
%  de datos de entrenamiento para no hacer trivial el proceso de validación.
%
%  Si se ha recogido una gran cantidad de datos, esperamos que estos datos contengan todas las características representativas
%  necesarias, por lo que el proceso de selección de un conjunto de datos para verificar o probar los propósitos se hace más
%  fácil. Sin embargo, si espera presentar mediciones ruidosas en su modelo, es posible que el conjunto de datos de entrenamiento
%  no incluya todas las características representativas que desea modelar.
%
%  El conjunto de datos de prueba le permite comprobar la capacidad de generalización del sistema de inferencia difusa resultante.
%  La idea detrás del uso de un conjunto de datos de verificación para la validación del modelo es que después de cierto punto en
%  el entrenamiento, el modelo comienza a superponer el conjunto de datos de entrenamiento. En principio, el error del modelo
%  para el conjunto de datos de comprobación tiende a disminuir a medida que el entrenamiento se lleva a cabo hasta el punto en
%  que comienza el sobreentrenado y, a continuación, el error del modelo para los datos de comprobación aumenta repentinamente.
%  El ajuste excesivo se explica por la prueba del FIS entrenado en los datos de entrenamiento contra los datos de comprobación
%  y eligiendo los parámetros de la función de pertenencia como aquellos asociados con el error de comprobación mínimo si estos
%  errores indican que el modelo se sobreentrena.
%
%  Normalmente, estos conjuntos de datos de entrenamiento y comprobación se recogen sobre la base de observaciones del sistema
%  de destino y luego se almacenan en archivos separados.
%
%% 
%%  DESARROLLO DE UN EJEMPLO
%
% # Se definen los datos de entrada y salida
% # Se genera el FIS
% # Se define el entranamiento con el número de intentos y el error medio cuadrático
% # Se entrena el conjunto de datos
% # Se validan los resultados
% 
%  El problema en cuestión es hacer una aproximación difusa de la función y=0.6sin(πx) + 0.3sin(3πx) + 0.1sin(5πx), usando anfis
%  con datos de entrenamiento y de validaciónws
%%

%%
%  El primer paso es generar los datos
%%
numPts=200;
x=linspace(-2,2,numPts)'; 
y=0.6*sin(pi*x)+0.3*sin(3*pi*x)+0.1*sin(5*pi*x);
data=[x y];
%%
%  Se genera los datos de entrenamiento y los datos de validación
%%
trndata=data(1:2:numPts,:); 
chkdata=data(2:2:numPts,:);  

%%
%  La gráfica de a ecuación que se va a entrenar se muestra a continuación:
%%
figure
plot(trndata(:,1),trndata(:,2),'o',chkdata(:,1),chkdata(:,2),'x') 
title('Gráfica de ecuación a estimar');

%%
%  Se configura el entorno de entrenamiento. Primero, se establece el número y tipo de funciones de pertenencia. Para el tipo de
%  función, se establece la función por defecto para mostrar el desarrollo básico. Posteriormente, se evaluará cada función
%%

numMFs=5; 
mfType='gbellmf';

%%
%  Se genera la matriz FIS y se visualizan las funciones de pertenencia generadas
%%
fismat=genfis1(trndata,numMFs,mfType); 

figure
[x,mf]=plotmf(fismat,'input',1);
plot(x,mf);
title('Funciones de pertenenecia');

%%
%  A continuación, se establece el número de intentos para entrenar la red, así como su tolerancia al error.
%%

trnEpoNum=100;
trnErrGoa=0;

trnOpt=[trnEpoNum trnErrGoa];

%%
%  Luego, se configuran las opciones que se van a visualizar. Con la opción 1 se muestran las opciones por defecto.
%%

dispOpt=1;

%%
%  Se genera una matriz de validación. Debe ser una muestra aleatoria de los datos de entrada, pero para el ejemplo básico, se
%  dejará por defecto
%%

trnDataM = []; 

%%
%  Por último, se genera el tipo de optimización que se va a usar: 0: backpropagation y 1 (defecto): método híbrido
%%
optMethod=0;

%%
%  Por último, se entrena el sistema con los parámetros anteriormente configurados.
%%
[fismat1,trnErr,ss]=anfis(trndata,fismat,trnOpt,dispOpt,trnDataM,optMethod);


%%
%  Se evalúa el sistema resultante, encontrando el error cuadrático medio
%%
trnOut=evalfis(trndata(:,1),fismat1);
trnRMSE=norm(trnOut-trndata(:,2))/sqrt(length(trnOut))

%%
%  Se grafica el error vs los intentos.
%%

epoch=1:trnEpoNum;
figure
plot(epoch,trnErr,'o');
title('Error vs entrenamientos');
hold on;

%%
%  Por último, se visualiza el resultado del sistema entrenado
%%

anfis_y=evalfis(x(:,1),fismat1);
figure
plot(trndata(:,1),trndata(:,2),'o',x,anfis_y,'-')
title('FIS resultante');

dispOpt=[1 0 0 1];

%%  Función de pertenencia Triangular
%  Tiene la estructura
%%

a = 0:0.1:6;b = trimf(a,[2 3 4]);figure;plot(a,b);

%%
%  Se establece mediante mfType='trimf';
%%

mfType='trimf';
outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);
outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);
outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

%%  Función de pertenencia Trapezoidal
%  Tiene la estructura
%%
a = 0:0.1:6;b = trapmf(a,[2 3 4 5]);figure;plot(a,b);
%%
%  Se establece mediante mfType='trapmf';
%%

mfType='trapmf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

%%
%DA ERROR!
%mfType='trapmf';
%outmftype='constant';
%optMethod=1;
%anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);
%
%outmftype='constant';
%optMethod=0;
%anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);
%%

%%  Función de pertenencia Campana de Bell general
%  Tiene la estructura
%%
a = 0:0.1:6;b = gbellmf(a,[1 2 3]);figure;plot(a,b);
%%
%  Se establece mediante mfType='gbellmf';
%%

mfType='gbellmf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

mfType='gaussmf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

mfType='gauss2mf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

mfType='pimf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

mfType='dsigmf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

mfType='psigmf';

outmftype='linear';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='linear';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=1;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

outmftype='constant';
optMethod=0;
anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

https://www.mathworks.com/help/fuzzy/trimf.html
