function data = data_reshape( data1,jiange )
%DATA_RESHAPE Summary of this function goes here
% ���¹���ʱ�����У��޸�jiange  
  data1=data1';
  N=length(data1); 
  data1=data1(1:jiange*floor(N/jiange));
  x=reshape(data1,jiange,floor(N/jiange));
  x=x';%ת��
  data=x(:);
end

