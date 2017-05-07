function resAnfis = anfis_trimf(trndata, numMFs,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);

mfType='trimf';

fismat=genfis1(trndata,numMFs,mfType); 

figure
[x,mf]=plotmf(fismat,'input',1);
plot(x,mf);
title('Funciones de pertenenecia');

trnOpt=[trnEpoNum trnErrGoa];

[fismat1,trnErr,ss]=anfis(trndata,fismat,trnOpt,dispOpt,trnDataM,optMethod);

trnOut=evalfis(trndata(:,1),fismat1);
trnRMSE=norm(trnOut-trndata(:,2))/sqrt(length(trnOut))

epoch=1:trnEpoNum;
figure
plot(epoch,trnErr,'o');
title('Error vs entrenamientos ');
hold on;

resAnfis=evalfis(x(:,1),fismat1);
figure
plot(trndata(:,1),trndata(:,2),'o',x,resAnfis,'-')
title('FIS resultante');

