clc;clear all;close all;
%data1=xlsread('3001-3.csv','C:C');%B:B   E:E   H:H    %data2=data1(1:120:324000);
load E:\matlab\Data\30cloud %E:\20180201
data1=data1(1:972000);%324000
jiange=60;
[data2]=pingjun(data1,jiange);

data=data2(1:length(data2)-160);
N=length(data);

%[tau,m]=C_CMethod(data);%����C-C��������ʱ���ӳ�tau��ά��m
m=3;tau=16;
                                                                                 
T_mean=period_mean_fft(data);%FFT��������ƽ������
T_mean=fix(T_mean);
lambda_1=lyapunov_wolf(data,N,m,tau,T_mean)%����lyaָ��
%lambda_1=0.0306;
aa=fix(1/lambda_1)  %���Ԥ�ⲽ��fix(1/lambda_1)

[y]=pre_fun(data,m,tau,T_mean,aa)%Ԥ�⺯��

[err,MAPE]=wucha(data2,y,aa);

