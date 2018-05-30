clc; close all;clear all;
load 60-rain;  %60-sun ���죻60-cloud ���ƣ�60-rain����;
M=16020;   %M-training data 
N=11 ;  %N-validation data 
data2=data2';
%get the data
Y1=data2(1:M);    %training data 
Y2=data2(M+1:M+N);%validation data 

%prepare training data 
T=Y1';
T=con2seq(T(1:M));%m=1*ones(1,M);T=mat2cell(T,1,m);
%prepare validation data 
T2=Y2';
T2=con2seq(T2(1:N));%m2=1*ones(1,N);T2=mat2cell(T2,1,m2);

%%define nolinear autoregressive neural network
%%inputDelays=1;
%%hiddenSizes=10;
%%net=narnet(inputDelays,hiddenSizes); 

%%prepare target time series data for network traning
%%[Xs,Xi,Ai,Ts]=preparets(net,{},{},T);
%[x,t]=maglev_dataset;
net=narxnet(10);
[Xs,Xi,Ai,Ts]=preparets(net,{},{},T);
%net=train(net,xo,to,xi);

%%traning net
net=train(net,Xs,Ts,Xi,Ai);
%view(net);
net=closeloop(net);   % view(net);       %�ջ�
%view(net);

%Y=net(Xs,Xi);
%perf=perform(net,Ts,Y)

%prepare validation data for network simulation
%yini=T(end-max(inputDelays)+1:end);%initial value from training data 
yini=T(end-1:end);%initial value from training data 
%combine initial value and validation data T2
tt=[yini T2];
[Xs,Xi,Ai,Ts]=preparets(net,{},{},tt);
%predict on validation data  
predict=net(Xs,Xi,Ai);

%calculate error and RMSE
Yp=cell2mat(predict)

[err,MAPE,RMSE,MBE]=wucha(Y2,Yp,N);

%add=0;fch=0;
%for i=1:N
%    error(i)=Y2(i)-Yp(i);
%    add=add+Y2(i)*Y2(i);
%    fch=fch+error(i)*error(i);;
%end
%MAPE=sqrt(fch/N)/sqrt(add/N)
%figure(hiddenSizes);
plot(Yp,'r');
hold on;
plot(Y2,'g');
%plot(err,'b');
hold off;
