function resAnfis = anfis_t(trndata, numMFs,mfType,outmftype,trnEpoNum, trnErrGoa, dispOpt, trnDataM, optMethod);
figure

fismat=genfis1(trndata,numMFs,mfType,outmftype); 

[x,mf]=plotmf(fismat,'input',1);
subplot(2,2,1);
plot(x,mf);
title('Funciones de pertenenecia','fontsize',10);

trnOpt=[trnEpoNum trnErrGoa];

[fismat1,trnErr,ss]=anfis(trndata,fismat,trnOpt,dispOpt,trnDataM,optMethod);

trnOut=evalfis(trndata(:,1),fismat1);
trnRMSE=norm(trnOut-trndata(:,2))/sqrt(length(trnOut));
trnRMSE

epoch=1:trnEpoNum;
subplot(2,2,2);
plot(epoch,trnErr,'o');
title('Error vs entrenamientos','fontsize',10);

subplot(2,2,3);
[x,mf]=plotmf(fismat1,'input',1);
plot(x,mf);
title('Funciones de pertenencia despues del entrenamiento','fontsize',7);

resAnfis=evalfis(x(:,1),fismat1);
subplot(2,2,4);
plot(trndata(:,1),trndata(:,2),'-b',x,resAnfis,'-r');
title('FIS resultante','fontsize',10);
h_legend=legend('Real','Entrenada');
set(h_legend,'FontSize',6);

h_legend.Box='off';
h_legend.Location='southeast';