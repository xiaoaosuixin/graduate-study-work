function X=reconstitution(data,N,m,tau)
%该函数用来重构相空间
% m为嵌入空间维数
% tau为时间延迟
% data为输入时间序列
% N为时间序列长度
% X为输出,是m*n维矩阵

M=N-(m-1)*tau;%相空间中点的个数
X=zeros(m,M);
for j=1:M           %相空间重构
    for i=1:m
        X(i,j)=data((i-1)*tau+j);
    end
end
%X=X';
%y1=X(:,1)
%y2=X(:,2)
%y3=X(:,3)
%figure(1);
%plot3(y1,y2,y3);
%view(2)
%xlabel('x'),ylabel('y');
%title('重构吸引子图');
%X=X';