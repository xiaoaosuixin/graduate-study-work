
N=length(x);
m= ;
tau= ;
P=N-(m-1)*tau;
for ii=1:m
for jj=1:P
data(jj,ii)=x(jj+(ii-1)*tau);
end
end
y1=data(:,1);
y2=data(:,2);
y3=data(:,3);
figure(1);
plot3(y1,y2,y3);
view(2)
xlabel('x'),ylabel('y');
title('Lorenz重构吸引子图');