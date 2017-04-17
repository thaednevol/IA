function [Yf,Wf,error] = bp_metodo1(Xi,Wi,Yi,alpha,beta,j,Yf);

H1 = beta*Wi(1,1) + Xi(1,j)*Wi(1,2) + Xi(2,j)*Wi(1,3);
O1=sigma(H1);
H2 = beta*Wi(2,1) + Xi(1,j)*Wi(2,2) + Xi(2,j)*Wi(2,3);
O2=sigma(H2);

H3 = beta*Wi(3,1) + O1*Wi(3,2) + O2*Wi(3,3);

Yf(j)=sigma(H3);

error(j)=Yi(j) - Yf(j);

d3_1= Yf(j) * (1 - Yf(j)) * error(j);

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

Wf=Wi;