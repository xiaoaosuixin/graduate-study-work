function [tau,m]=C_CMethod(data)
%X为重构的相空间
%this function calculate time delay and embedding demension with C-C
%Method,which proved by H.S.Kim
%skyhawk&flyinghawk
% %****************调试程序段****************************
% clear all;
% data=load('f:/sunpot/year sunpot number.txt');
% %************************************************

N=length(data);
max_d=40;%the maximum value of the time delay

sigma=std(data);%calcute standard deviation s_d

for t=1:max_d
    t
    s_t=0;
    delt_s_s=0;
    for m=2:5
        s_t1=0;
        for j=1:4
            r=sigma*j/2;
            data_d=disjoint(data,N,t);%将时间序列分解成t个不相交的时间序列
            [ll,N_d]=size(data_d);
            s_t3=0;
            for i=1:t
                i
                Y=data_d(i,:);
                C_1(i)=correlation_integral(Y,N_d,r);%计算C(1,N_d,r,t)
                X=reconstitution(Y,N_d,m,t);%相空间重构
                N_r=N_d-(m-1)*t;
                C_I(i)=correlation_integral(X,N_r,r);%计算C(m,N_r,r,t)
                s_t3=s_t3+(C_I(i)-C_1(i)^m);%对t个不相关的时间序列求和
            end
            s_t2(j)=s_t3/t;
            s_t1=s_t1+s_t2(j);%对rj求和
        end
        delt_s_m(m)=max(s_t2)-min(s_t2);%求delt S(m,t)
        delt_s_s=delt_s_s+delt_s_m(m);%delt S(m,t)对m求和
        s_t0(m)=s_t1;
        s_t=s_t+s_t0(m);%S对m求和
    end
    s(t)=s_t/16;
    delt_s(t)=delt_s_s/4;
    s_cor(t)=delt_s(t)+abs(s(t));
   
end
%寻找时间延迟tau：即delt_s(t)的第一个极小值点对应的t
for i=2:length(delt_s)-1
    if delt_s(i)<delt_s(i-1)&&delt_s(i)<delt_s(i+1)
        tau=i;
        break;
    end
end
%寻找时间延迟tw：即s_cor(t)的最小值对应的t
for i=1:length(s_cor)
    if s_cor(i)==min(s_cor)
        tw=i;
        break; 
    end
end
%求嵌入维数m：依tw=(m-1)*tau,显示tau，m
m=round(1+tw/tau);
tau
m
%fid=fopen('result.txt','w');
%fprintf(fid,'%f %f %f\n',t,delt_s(t),s_cor(t));
%fclose(fid);
%绘制曲线图形

%subplot(2,2,1);
%t=1:max_d;
%plot(t,delt_s,'.');
%xlabel('t');
%ylabel('delt_s');
%grid on;
%    %fid=fopen('result.txt','w');
%    %fprintf(fid,'%f %f %f %f/n',t,s(t),delt_s(t),s_cor(t));
%    %fclose(fid);
%subplot(2,2,2);
%t=1:max_d;
%plot(t,s,t,delt_s,'.',t,s_cor,'*');
        
            
            
                
            