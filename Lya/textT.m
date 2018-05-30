clc;
clear all;
data1=xlsread('E:\原始数据\000000.xlsx','B:B');%B:B   E:E   H:H
data=data1(1:60:108000);
N=length(data1);
[tau,m]=C_CMethod(data);%采用C-C方法计算时间延迟tau和维数m

% jiange=1:120     %定义频率间隔
%    data=data_reshape(data1,jiange);%重新构造序列
    T_mean=period_mean_fft(data);%FFT计算序列平均周期
    T_mean=fix(T_mean);
    lambda_1=lyapunov_wolf(data,N,m,tau,T_mean);%计算lya指数
    aa=fix(1/lambda_1) ; %最大预测步数fix(1/lambda_1)
 %   jiange

%aa=aa'
%lambda_1=lambda_1'
%plot(aa)