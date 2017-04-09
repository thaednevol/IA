function [Wf,Yf,N] = perceptron_metodo3(Wi,Xi,Yi,umbral,alpha);

if length(Wi)~=size(Xi,1)
    return;
end

if length(Wi)~=size(Xi,1)
    return;
end

%NUMERO DE ITERACIONES
N=0;
%NUMERO DE SALIDAS
k=length(Yi);

%NUMERO DE ENTRADAS O COEFICIENTES
coefIndex=length(Wi);

%VALIDADOR DEL ALGORITMO
validador=0;

    while validador<k 
    validador=0;
    N=N+1;
        for i=1:1:k
            %FUNCION DE SUMA
            f(i)=0;
            for j=1:1:coefIndex
                f(i)=f(i)+Wi(j)*Xi(j,i);
            end
            %SE COMPARA CON EL UMBRAL
            if f(i)<umbral
                Yd(i)=-1;
            else
                Yd(i)=1;
            end

            %FUNCION DELTA
            fd=1;
            if Yd(i)==Yi(i)
                validador=validador+1;   
            else
                %METODO 3
                fd=alpha*(Yi(i)-Yd(i));
                %AJUSTE DE COEFICIENTES
                for j=1:1:coefIndex
                    Wi(j)=Wi(j)+Xi(j,i)*fd;
                    Wf=Wi;
                end
            end
        end
    end
    %INGRESA LA SALIDA A LA SOLUCION
    for i=1:1:k
        Yf(i)=0;
        for j=1:1:coefIndex
            Yf(i)=Yf(i)+Wi(j)*Xi(j,i);
        end
    end
end
