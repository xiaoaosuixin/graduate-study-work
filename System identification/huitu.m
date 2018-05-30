% set(AX,'FontSize',14,'FontName','Times New Roman')%����x�ᡢ��y�ᡢ��y��̶��ֺź�����  
% set(AX(1),'Xcolor','k','Ycolor','k')%����x�ᡢ��y��̶�����Ϊ��ɫ��  
% set(AX(2),'Xcolor','k','Ycolor','k')%����x�ᡢ��y��̶�����Ϊ��ɫ��  
% set(AX,'Xlim',[207.5 217.1],'xtick',[208:1:217])%����x�����ݷ�Χ��207.5��217.1�����̶���ʾ��208��209,210...217��  
% set(AX(1),'ylim',[0,0.5],'ytick',[0:0.1:0.5])%������y�����ݷ�Χ��0��0.5�����̶���ʾ��0,0.1,0.2...0.5��  
% set(AX(2),'ylim',[0,3],'ytick',[0:1:3])%������y�����ݷ�Χ��0��3�����̶���ʾ��0,1,2,3��  
% set(H1,'Linestyle','-','color','r','Linewidth',2.5);%���õ�һ�����ߵ����͡���ɫ����ϸ  
% line(x,y,'linestyle','-','color','r','Linewidth',2.5,'parent',AX(1));%�ڵ�һ���������ٻ�һ�����ߡ�  
% set(H2,'Linestyle','-.','color','b','Linewidth',2.5);%���õڶ������ߵ����͡���ɫ����ϸ  
% set(get(AX(1),'Ylabel'),'string','Amplitude(a.u.)','FontSize',10,'FontName','Times New Roman','Position',[0 0 0 ]);%������y������ֺ�����  
% set(get(AX(2),'Ylabel'),'string','Phase(rad)','FontSize',10,'FontName','Times New Roman');%������y������ֺ�����  
% set(get(AX(1),'Xlabel'),'string','Optical frequency(THz)','FontSize',10,'FontName','Times New Roman');%����x������������С������  

load gray-pv.mat
gray=gray/256*100;
aa=[1:4568]';
[AX,H1,H2]=plotyy(aa,pv,aa,gray);
set(AX,'FontSize',16);
set(AX(1),'Xcolor','k','Ycolor','k')%����x�ᡢ��y��̶�����Ϊ��ɫ��  
set(AX(2),'Xcolor','k','Ycolor','k')%����x�ᡢ��y��̶�����Ϊ��ɫ��  
set(AX,'Xlim',[1 4568])
set(AX(1),'ylim',[20000,100000],'ytick',[20000:20000:100000])
set(AX(2),'ylim',[20,50],'ytick',[20:10:50])
set(H1,'Linestyle','-','color','k','Linewidth',2);
line(aa,gray,'linestyle','-','color','k','Linewidth',2,'parent',AX(1));
set(H2,'Linestyle','-','color','b','Linewidth',2);
set(gca,'linewidth',2);%���ñ߿�

