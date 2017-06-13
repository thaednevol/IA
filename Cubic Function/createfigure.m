function createfigure(X1, YMatrix1, X2, Y1)
%CREATEFIGURE(X1, YMATRIX1, X2, Y1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%  X2:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 11-Jun-2017 16:46:07

% Create figure
figure1 = figure('Tag','TRAINING_PLOTREGRESSION','NumberTitle','off',...
    'Name','Neural Network Training Regression (plotregression), Epoch 50, Performance goal met.');

% Create subplot
subplot1 = subplot(1,1,1,'Parent',figure1);
hold(subplot1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1);
set(plot1(1),'DisplayName','Y = T','LineStyle',':','Color',[0 0 0]);
set(plot1(2),'DisplayName','Fit','LineWidth',2,'Color',[0 0 1]);

% Create plot
plot(X2,Y1,'DisplayName','Data','Marker','o','LineStyle','none','Color',[0 0 0]);

% Create xlabel
xlabel('Target','FontWeight','bold','FontSize',12);

% Create title
title('Training: R=1','FontWeight','bold','FontSize',12);

% Create ylabel
ylabel('Output ~= 1*Target + -0.0031','FontWeight','bold','FontSize',12);

% Uncomment the following line to preserve the X-limits of the axes
% xlim(subplot1,[-125 125]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(subplot1,[-125 125]);
box(subplot1,'on');
axis(subplot1,'square');
% Create legend
legend1 = legend(subplot1,'show');
set(legend1,'Location','northwest');

% uicontrol currently does not support code generation, enter 'doc uicontrol' for correct input syntax
% In order to generate code for uicontrol, you may use GUIDE. Enter 'doc guide' for more information
% uicontrol(...);

