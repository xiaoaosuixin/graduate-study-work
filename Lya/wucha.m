%clc;close all;load E:\matlab运行结果\lya\晴_上午1355.mat
function[err,MAPE,RMSE,MBE]=wucha(data2,y,aa);
    add=0;err=0;err1=0;err2=0;true=0;mre=0;
    l=length(y);
    for i=l-aa+1:l;
        err(i)=y(i)-data2(i);
        err1=err1+abs(err(i));
        err2=err2+err(i)*err(i);
        true=true+data2(i);
        add=add+abs(err(i)/data2(i));
        mre=mre+err(i)/data2(i);
    end
    true_ave=true/aa;
    MAPE=add/aa*100
    MSE=err2/aa;
    RMSE=sqrt(err2/aa)/true_ave*100
    MBE=err1/aa
    MRE=mre/aa*100;
plot(y,'r');hold on;plot(data2,'b');    


