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

%%
% 
%   for x = 1:10
%       disp(x)
%   end
% 



clear all;
close all;
clc;


