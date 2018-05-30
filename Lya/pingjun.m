function [data2]=pingjun(data1,n);
l=length(data1)/n;
for i=1:l       %计算平均值序列data1
    ave=0;
    for j=0:n-1
        ave=ave+data1(i*n-j);
   end
    ave=ave/n;i
    data2(i)=ave;
  end