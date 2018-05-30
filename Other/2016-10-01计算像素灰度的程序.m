clc
clear all
srcDir=uigetdir('......\JPEG');
cd(srcDir);
allnames=struct2cell(dir('*.jpg'))
xlswrite('F:\matlab',allnames);
[k,len]=size(allnames);
SH=[];
for i=1:len
    name=allnames{1,i};
    A=imread(name);
    temp={name};

    I=rgb2gray(A);
    [m,n]=size(I);
    sm=sum(I(:));
    ave=sm/(m*n);
    SH(1,i)=ave;
    SH(2,i)=i;

    i
 
end
     xlswrite('E:\matlab\Result\huidu',SH,'A');

