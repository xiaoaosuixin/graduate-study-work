function data = data_reshape( data1,jiange )
%DATA_RESHAPE Summary of this function goes here
% 重新构造时间序列，修改jiange  
  data1=data1';
  N=length(data1); 
  data1=data1(1:jiange*floor(N/jiange));
  x=reshape(data1,jiange,floor(N/jiange));
  x=x';%转置
  data=x(:);
end

