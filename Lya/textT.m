clc;
clear all;
data1=xlsread('E:\ԭʼ����\000000.xlsx','B:B');%B:B   E:E   H:H
data=data1(1:60:108000);
N=length(data1);
[tau,m]=C_CMethod(data);%����C-C��������ʱ���ӳ�tau��ά��m

% jiange=1:120     %����Ƶ�ʼ��
%    data=data_reshape(data1,jiange);%���¹�������
    T_mean=period_mean_fft(data);%FFT��������ƽ������
    T_mean=fix(T_mean);
    lambda_1=lyapunov_wolf(data,N,m,tau,T_mean);%����lyaָ��
    aa=fix(1/lambda_1) ; %���Ԥ�ⲽ��fix(1/lambda_1)
 %   jiange

%aa=aa'
%lambda_1=lambda_1'
%plot(aa)