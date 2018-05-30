% set(AX,'FontSize',14,'FontName','Times New Roman')%设置x轴、左y轴、右y轴刻度字号和字型  
% set(AX(1),'Xcolor','k','Ycolor','k')%设置x轴、左y轴刻度字体为黑色；  
% set(AX(2),'Xcolor','k','Ycolor','k')%设置x轴、右y轴刻度字体为黑色；  
% set(AX,'Xlim',[207.5 217.1],'xtick',[208:1:217])%设置x轴数据范围（207.5到217.1），刻度显示（208，209,210...217）  
% set(AX(1),'ylim',[0,0.5],'ytick',[0:0.1:0.5])%设置左y轴数据范围（0到0.5），刻度显示（0,0.1,0.2...0.5）  
% set(AX(2),'ylim',[0,3],'ytick',[0:1:3])%设置右y轴数据范围（0到3），刻度显示（0,1,2,3）  
% set(H1,'Linestyle','-','color','r','Linewidth',2.5);%设置第一条曲线的线型、颜色、粗细  
% line(x,y,'linestyle','-','color','r','Linewidth',2.5,'parent',AX(1));%在第一条曲线上再画一条曲线。  
% set(H2,'Linestyle','-.','color','b','Linewidth',2.5);%设置第二条曲线的线型、颜色、粗细  
% set(get(AX(1),'Ylabel'),'string','Amplitude(a.u.)','FontSize',10,'FontName','Times New Roman','Position',[0 0 0 ]);%设置左y轴标题字号字型  
% set(get(AX(2),'Ylabel'),'string','Phase(rad)','FontSize',10,'FontName','Times New Roman');%设置右y轴标题字号字型  
% set(get(AX(1),'Xlabel'),'string','Optical frequency(THz)','FontSize',10,'FontName','Times New Roman');%设置x坐标标题字体大小，字型  

load gray-pv.mat
gray=gray/256*100;
aa=[1:4568]';
[AX,H1,H2]=plotyy(aa,pv,aa,gray);
set(AX,'FontSize',16);
set(AX(1),'Xcolor','k','Ycolor','k')%设置x轴、左y轴刻度字体为黑色；  
set(AX(2),'Xcolor','k','Ycolor','k')%设置x轴、右y轴刻度字体为黑色；  
set(AX,'Xlim',[1 4568])
set(AX(1),'ylim',[20000,100000],'ytick',[20000:20000:100000])
set(AX(2),'ylim',[20,50],'ytick',[20:10:50])
set(H1,'Linestyle','-','color','k','Linewidth',2);
line(aa,gray,'linestyle','-','color','k','Linewidth',2,'parent',AX(1));
set(H2,'Linestyle','-','color','b','Linewidth',2);
set(gca,'linewidth',2);%设置边框

