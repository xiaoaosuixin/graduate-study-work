clc;clear;close all;
load fromfig;
%pic_pv=con2seq(pic_pv);pic_ide=con2seq(pic_ide);

lag=5;%自回归阶数
fn=60;%预测个数

iinput=pic_ide;
n=length(iinput);
%准备输入输出数据；
inputs=zeros(lag,n-lag);
for i=1:n-lag
    inputs(:,i)=iinput(i:i+lag-1);
end
targets=pic_ide(lag+1:end);
%创建网络
hiddenLayerSize=10;
net=fitnet(hiddenLayerSize);
%避免过拟合，划分训练，测试和验证数据的比例
net.divideParam.trainRatio=70/100;
net.divideParam.valRatio=15/100;
net.divideParam.testRatio=15/100;
%训练网络
[net,tr]=train(net,inputs,targets);

yn=net(inputs);
errors=targets-yn;
%根据图表判断拟合好坏
figure,ploterrcorr(errors)
figure,parcorr(errors)
figure,plotresponse(con2seq(targets),con2seq(yn))
figure,ploterrhist(errors)
figure,plotperform(tr)


f_in=iinput(n-lag+1:end)';
f_out=zeros(1,fn);

for i=1:fn
    f_out(i)=net(f_in);
    f_in=[f_in(2:end);f_out(i)];
end
figure,plot(1:n,iinput,'bo',n+1:n+fn,[f_out],'ro')

[err,MAPE,RMSE,MBE]=wucha(pv(n+1:n+fn),f_out,fn);