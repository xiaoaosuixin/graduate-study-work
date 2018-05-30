function[y]=pre_fun(data,m,tau,P,jiaoyan);
%fch=0;add=0;fch2=0;fch3=0;
whsl=length(data);
N=jiaoyan;
pre=ones(1,N);
whl=[data,pre];
for i=1:whsl;
    whlsj(i)=whl(i);
end
[lmd_m,min_d,idx]=lyapunov_wolf(data,whsl,m,tau,P);
for i=(whsl+1):(whsl+N)
    [yc1,yc2]=pre_by_lya(m,lmd_m,whlsj,i-1,idx,min_d);
    whlsj(i)=yc1;y(i)=yc1;
    [lmd_m,min_d,idx]=lyapunov_wolf(whlsj,i,m,tau,P);i
end  
%yyy=[whlsj,y]
