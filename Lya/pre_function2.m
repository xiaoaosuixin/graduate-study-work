%����˼���MAPE��rRMSE�ĳ���

function [yyy,fch,fch2,fch3]= pre_function2(data,m,tau,P,jiaoyan);
%data�������У�mά����tau��ʱ���ӳ٣�P����ƽ�����ڣ�jiaoyan��У�鲽��
fch=0;add=0;fch2=0;fch3=0;
%whl=data;
whsl=length(data);  
N=jiaoyan;  %���У�鲽��
pre=ones(1,N);
%data=data';
whl=[data,pre];

for i=1:whsl
    whlsj(i)=whl(i);
end

[lmd_m,min_d,idx]=lyapunov_wolf(data,whsl,m,tau,P);%����ԭʼ���ݵ����lyaָ��
%t_m=fix(1/lmd_m);       %���Ԥ�ⲽ��

%
%whlsj=whlsj(1:whsl-N)
%��ʼԤ��
for i=(whsl+1):(whsl+2)         %Ԥ���t_m��                              %*
 %   [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,whsl+1,m,tau,P);                 %*
    [yc,z(i)]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);%Ԥ���i+1����  
    whlsj(i)=yc ; %����i��Ԥ��ֵ��Ϊ��������ݵĵ�i��ֵ������һ��Ԥ��
end
whlsj;
y(whsl+1)=yc;

%������������
fch=(y(whsl+1)-whl(whsl+1))*(y(whsl+1)-whl(whsl+1));
fch2=abs((y(whsl+1)-whl(whsl+1))/whl(whsl+1));
shuliang=1;
for i=(whsl+2):(whsl+N)                                                      %*  
%    whlsj(i)=whl(i);  %��Ϊʵ��ֵm,                                           %*            
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,i,m,tau,P);                          %*  
    [y(i),z(i)]=pre_by_lya(m,lmd_m,whlsj,i,idx,min_d);%Ԥ���i+1����             %*  
    whlsj(i)=y(i);          %׼����һ�ε�Ԥ�� 
    e=y(i)-whl(i)            %���ֵ��
    add=add+whl(i);
    fch=fch+(y(i)-whl(i))*(y(i)-whl(i));
    fch2=fch2+abs((y(i)-whl(i))/whl(i));
    shuliang=shuliang+1;
end

fch=sqrt(fch/shuliang)
fch2=fch2/shuliang*100
fch3=fch/(add/shuliang)
yyy=[whl,y]

kk=1:whsl+N;
plot(kk,whl,'b',kk,y,'r'); %��ͼ


end