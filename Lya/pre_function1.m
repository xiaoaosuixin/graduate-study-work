function [fch,y]= pre_function1( data,m,tau,P,jiaoyan);
%data�������У�mά����tau��ʱ���ӳ٣�P����ƽ�����ڣ�jiaoyan��У�鲽��
fch=0;
whl=data;
[whsl,lll]=size(whl);  
N=jiaoyan;  %���У�鲽��

for i=1:whsl
    whlsj(i)=whl(i);
end

[lmd_m,min_d,idx1]=lyapunov_wolf(whlsj,whsl,m,tau,P);%����ԭʼ���ݵ����lyaָ��
t_m=fix(1/lmd_m);       %���Ԥ�ⲽ��

%
%whlsj=whlsj(1:whsl-N)
%��ʼԤ��
for i=(whsl-N+1):(whsl-N+2)         %Ԥ���t_m��                              %*
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,whsl-N+1,m,tau,P);                 %*
    [yc,z(i)]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);%Ԥ���i+1����  
    whlsj(i)=yc;  %����i��Ԥ��ֵ��Ϊ��������ݵĵ�i��ֵ������һ��Ԥ��
end
whlsj;
y(whsl-N+1)=yc;

%������������
fch=(y(whsl-N+1)-whl(whsl-N+1))*(y(whsl-N+1)-whl(whsl-N+1));
shuliang=1
for i=(whsl-N+2):(whsl)                                                      %*  
    whlsj(i)=whl(i);  %��Ϊʵ��ֵm,                                           %*            
i
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,i,m,tau,P);                          %*  
    [y(i),z(i)]=pre_by_lya(m,lmd_m,whlsj,i,idx,min_d);%Ԥ���i+1����             %*  
y(i);

    whlsj(i)=y(i);          %׼����һ�ε�Ԥ�� 
    e=y(i)-whl(i)            %���ֵ��
    fch=fch+(y(i)-whl(i))*(y(i)-whl(i));
    shuliang=shuliang+1;
end
fch=sqrt(fch/shuliang)
yyy=[whl,y']

kk=1:whsl;
plot(kk,whl,'b',kk,y,'r'); %��ͼ


end