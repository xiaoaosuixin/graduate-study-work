clc; close all;clear all;
load 60-cloud;  %data1-«ÁÃÏ£ªdata2-∂‡‘∆£ªdata3-“ı”Í;
M=15780;   %M-training data 
N=2 ;  %N-validation data 
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

%define nolinear autoregressive neural network
inputDelays=1;
 hiddenSizes=10;
net=narnet(inputDelays,hiddenSizes); 

%prepare target time series data for network traning
[Xs,Xi,Ai,Ts]=preparets(net,{},{},T);

%traning net
net=train(net,Xs,Ts,Xi,Ai);
%view(net);
net=closeloop(net);   % view(net);       %±’ª∑

%Y=net(Xs,Xi);
%perf=perform(net,Ts,Y)

%prepare validation data for network simulation
yini=T(end-max(inputDelays)+1:end);%initial value from training data 
%combine initial value and validation data T2
[Xs,Xi,Ai]=preparets(net,{},{},[yini,T2]);
%predict on validation data  
predict=net(Xs,Xi,Ai);

%calculate error and RMSE
Yp=cell2mat(predict);

[err,MAPE,RMSE,MBE]=wucha(Y2,Yp,N);
%add=0;fch=0;
%for i=1:N
%    error(i)=Y2(i)-Yp(i);
%    add=add+Y2(i)*Y2(i);
%    fch=fch+error(i)*error(i);;
%end
%MAPE2=sqrt(fch/N)/sqrt(add/N)
%figure(hiddenSizes);
plot(Yp,'r');
hold on;
plot(Y2,'g');
%plot(error,'b');
hold off;
