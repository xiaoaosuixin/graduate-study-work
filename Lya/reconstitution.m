function X=reconstitution(data,N,m,tau)
%�ú��������ع���ռ�
% mΪǶ��ռ�ά��
% tauΪʱ���ӳ�
% dataΪ����ʱ������
% NΪʱ�����г���
% XΪ���,��m*nά����

M=N-(m-1)*tau;%��ռ��е�ĸ���
X=zeros(m,M);
for j=1:M           %��ռ��ع�
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
%title('�ع�������ͼ');
%X=X';