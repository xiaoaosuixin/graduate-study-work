clc;clear all;
load gray-pv

l=length(pv);
gray2=gray/256;
for i=1:l
 gray2(i)=1/(1+exp(-gray2(i)));
end 
% Prepare the data;
Ts=1;
z1=iddata(pv,gray,Ts);
% z2=iddata(pv,gray2,Ts);
ze=z1(1:l-1000);
zv=z1(l-999:l);

opt=nlhwOptions;
opt.Display='on';
opt.SearchOption.MaxIter=50;

sys1=nlhw(z1,[2,3,1,],'sigmoidnet','deadzone',opt);
sys2=armax(z1,[2,3,1,1]);
sys3=nlhw(z1,[2,3,1],opt);
%sys4=nlhw(z,[5,6,1],'sigmoidnet','deadzone',opt);
for i=1:5
M1=nlhw(z1,sys1,opt);i  
%M2=armax(z1,sys2);
% M3=nlhw(z1,sys3,opt);   
%M4=nlhw(z,sys4,opt);
end
M1=pem(z1,M1);   
% M2=pem(z1,sys2);
% M3=pem(z1,M3);   %M3=pem(z,M3);
% present(M1);present(M2);present(M3);
compare(z1,M1);
%[yp, fit, xi]=compare(z,M1,M2);%比较
% set(gca,'linewidth',2)%边框粗细设置-2号线

%将图中辨识的结果导出到pic_ide和pic_pv
 lh=findall(gca,'type','line');
 xc=get(lh,'xdata');
 yc=get(lh,'ydata');

yc1=yc{2,1};
yc2=yc{3,1};
% yc3=yc{4,1};
% yc4=yc{5,1};
figure(2);plot(yc1);hold on;plot(yc2);%plot(yc3);plot(yc4);

