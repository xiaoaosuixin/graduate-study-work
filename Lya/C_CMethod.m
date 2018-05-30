function [tau,m]=C_CMethod(data)
%XΪ�ع�����ռ�
%this function calculate time delay and embedding demension with C-C
%Method,which proved by H.S.Kim
%skyhawk&flyinghawk
% %****************���Գ����****************************
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
            data_d=disjoint(data,N,t);%��ʱ�����зֽ��t�����ཻ��ʱ������
            [ll,N_d]=size(data_d);
            s_t3=0;
            for i=1:t
                i
                Y=data_d(i,:);
                C_1(i)=correlation_integral(Y,N_d,r);%����C(1,N_d,r,t)
                X=reconstitution(Y,N_d,m,t);%��ռ��ع�
                N_r=N_d-(m-1)*t;
                C_I(i)=correlation_integral(X,N_r,r);%����C(m,N_r,r,t)
                s_t3=s_t3+(C_I(i)-C_1(i)^m);%��t������ص�ʱ���������
            end
            s_t2(j)=s_t3/t;
            s_t1=s_t1+s_t2(j);%��rj���
        end
        delt_s_m(m)=max(s_t2)-min(s_t2);%��delt S(m,t)
        delt_s_s=delt_s_s+delt_s_m(m);%delt S(m,t)��m���
        s_t0(m)=s_t1;
        s_t=s_t+s_t0(m);%S��m���
    end
    s(t)=s_t/16;
    delt_s(t)=delt_s_s/4;
    s_cor(t)=delt_s(t)+abs(s(t));
   
end
%Ѱ��ʱ���ӳ�tau����delt_s(t)�ĵ�һ����Сֵ���Ӧ��t
for i=2:length(delt_s)-1
    if delt_s(i)<delt_s(i-1)&&delt_s(i)<delt_s(i+1)
        tau=i;
        break;
    end
end
%Ѱ��ʱ���ӳ�tw����s_cor(t)����Сֵ��Ӧ��t
for i=1:length(s_cor)
    if s_cor(i)==min(s_cor)
        tw=i;
        break; 
    end
end
%��Ƕ��ά��m����tw=(m-1)*tau,��ʾtau��m
m=round(1+tw/tau);
tau
m
%fid=fopen('result.txt','w');
%fprintf(fid,'%f %f %f\n',t,delt_s(t),s_cor(t));
%fclose(fid);
%��������ͼ��

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
        
            
            
                
            