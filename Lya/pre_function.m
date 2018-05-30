function [fch,y]= pre_function( data,m,tau,P,jiaoyan);
%data数据序列；m维数；tau：时间延迟；P序列平均周期；jiaoyan：校验步数

whl=data;
[whsl,lll]=size(whl);  
N=jiaoyan;  %最多校验步数

for i=1:whsl
    whlsj(i)=whl(i);
end

[lmd_m,min_d,idx1]=lyapunov_wolf(whlsj,whsl,m,tau,P);%计算原始数据的最大lya指数
t_m=fix(1/lmd_m);       %最大预测步数

%开始预测
for i=(whsl-N+2-t_m):(whsl-N+1)         %预测后t_m步
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,whsl-N+2-t_m-1,m,tau,P);  
    [yc,z(i)]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);%预测第i+1个点  
yc=z(i);
    whlsj(i)=yc;  %将第i步预测值作为完好率数据的第i个值进行下一步预测
end

y(whsl-N+1)=yc;

%计算均方根误差
fch=(y(whsl-N+1)-whl(whsl-N+1))*(y(whsl-N+1)-whl(whsl-N+1));
shuliang=1;
for i=(whsl-N+2):(whsl)
    whlsj(i-t_m)=whl(i-t_m);  %换为实际值m,
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,i-t_m,m,tau,P);  
    [y(i),z(i)]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);%预测第i+1个点  
y(i)=z(i);
    whlsj(i)=y(i);           %换为预测值
    fch=fch+(y(i)-whl(i))*(y(i)-whl(i))
    shuliang=shuliang+1
end

fch=sqrt(fch)/shuliang
yyy=[whl,y'];

kk=1:whsl;
plot(kk,whl,'b',kk,y,'r'); %绘图


end

