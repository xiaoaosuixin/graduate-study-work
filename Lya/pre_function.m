function [fch,y]= pre_function( data,m,tau,P,jiaoyan);
%data�������У�mά����tau��ʱ���ӳ٣�P����ƽ�����ڣ�jiaoyan��У�鲽��

whl=data;
[whsl,lll]=size(whl);  
N=jiaoyan;  %���У�鲽��

for i=1:whsl
    whlsj(i)=whl(i);
end

[lmd_m,min_d,idx1]=lyapunov_wolf(whlsj,whsl,m,tau,P);%����ԭʼ���ݵ����lyaָ��
t_m=fix(1/lmd_m);       %���Ԥ�ⲽ��

%��ʼԤ��
for i=(whsl-N+2-t_m):(whsl-N+1)         %Ԥ���t_m��
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,whsl-N+2-t_m-1,m,tau,P);  
    [yc,z(i)]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);%Ԥ���i+1����  
yc=z(i);
    whlsj(i)=yc;  %����i��Ԥ��ֵ��Ϊ��������ݵĵ�i��ֵ������һ��Ԥ��
end

y(whsl-N+1)=yc;

%������������
fch=(y(whsl-N+1)-whl(whsl-N+1))*(y(whsl-N+1)-whl(whsl-N+1));
shuliang=1;
for i=(whsl-N+2):(whsl)
    whlsj(i-t_m)=whl(i-t_m);  %��Ϊʵ��ֵm,
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,i-t_m,m,tau,P);  
    [y(i),z(i)]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);%Ԥ���i+1����  
y(i)=z(i);
    whlsj(i)=y(i);           %��ΪԤ��ֵ
    fch=fch+(y(i)-whl(i))*(y(i)-whl(i))
    shuliang=shuliang+1
end

fch=sqrt(fch)/shuliang
yyy=[whl,y'];

kk=1:whsl;
plot(kk,whl,'b',kk,y,'r'); %��ͼ


end

