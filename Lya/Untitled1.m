clc;clear all;close all;
%data1=xlsread('3001-3.csv','C:C');%B:B   E:E   H:H    %data2=data1(1:120:324000);
load E:\matlab\Data\30cloud %E:\20180201
data1=data1(1:972000);%324000
jiange=60;
[data2]=pingjun(data1,jiange);

data=data2(1:length(data2)-160);
N=length(data);

%[tau,m]=C_CMethod(data);%采用C-C方法计算时间延迟tau和维数m
m=3;tau=16;
                                                                                 
T_mean=period_mean_fft(data);%FFT计算序列平均周期
T_mean=fix(T_mean);
lambda_1=lyapunov_wolf(data,N,m,tau,T_mean)%计算lya指数
%lambda_1=0.0306;
aa=fix(1/lambda_1)  %最大预测步数fix(1/lambda_1)

[y]=pre_fun(data,m,tau,T_mean,aa)%预测函数

[err,MAPE]=wucha(data2,y,aa);

