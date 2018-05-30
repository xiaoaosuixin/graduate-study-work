clc;clear;close all;
load fromfig;
%pic_pv=con2seq(pic_pv);pic_ide=con2seq(pic_ide);

lag=5;%�Իع����
fn=60;%Ԥ�����

iinput=pic_ide;
n=length(iinput);
%׼������������ݣ�
inputs=zeros(lag,n-lag);
for i=1:n-lag
    inputs(:,i)=iinput(i:i+lag-1);
end
targets=pic_ide(lag+1:end);
%��������
hiddenLayerSize=10;
net=fitnet(hiddenLayerSize);
%�������ϣ�����ѵ�������Ժ���֤���ݵı���
net.divideParam.trainRatio=70/100;
net.divideParam.valRatio=15/100;
net.divideParam.testRatio=15/100;
%ѵ������
[net,tr]=train(net,inputs,targets);

yn=net(inputs);
errors=targets-yn;
%����ͼ���ж���Ϻû�
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