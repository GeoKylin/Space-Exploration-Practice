clear
close all
clc

% 导入三幅全球TEC地图数据
load igsg160507.mat;
% 导入全球海岸线数据
load coast;       
% 生成经纬度坐标
x=-180:2.5:180; y=-87.5:2.5:87.5;
% 分别绘制三幅全球TEC地图
filename = 'igsg160507.gif';
for j=1:13
    k=355*(j-1);
    for i=0:70                 % 将数据重新整理为标准矩阵
        data(i+1,:)=[igsg160507(5*i+k+1,1:16) igsg160507(5*i+k+2,1:16) ...
            igsg160507(5*i+k+3,1:16) igsg160507(5*i+k+4,1:16) ...
            igsg160507(5*i+k+5,1:9)];        
    end
    data=data/10;   % 换算为标准单位
    datamax(j)=data(36,37);
    % 绘制TEC地图
    figure; imagesc(x,y,data); hold on; plot(long,lat,'w');
    set(gca,'ydir','normal'); set(gca,'position',[0.13 0.2 0.778 0.8]);
    set(gca,'XTick',-180:45:180, 'YTick',-60:30:60);
    axis equal; axis([-180 180 -87.5 87.5]);
    % 设置标题和横纵坐标
    if 2*(j-1)<10   %统一时间格式
        t=['0',num2str(2*(j-1))];
    else
        t=num2str(2*(j-1));
    end
    title(['GLOBAL IONOSPHERE MAPS FOR DAY 128, 2016 - ',t,':00 UT']);
    xlabel('Geographic longitude(\circ)');
    ylabel('Geographic latitude(\circ)');    
    % 设置色标
    hcb=colorbar('southoutside','position',[0.13 0.2 0.778 0.02]);
    set(get(hcb,'Xlabel'),'String','TEC(TECU)');
    
    M(j) = getframe(gcf);
    im = frame2im(M(j));
    [imind,cm] = rgb2ind(im,256);
    if j == 1;
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.5);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.5);
    end
end
% figure; set(gca,'position',[0 0 0.778 0.8]); axis off
% movie(M,3,2);
figure; plot(datamax);