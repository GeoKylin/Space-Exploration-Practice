clear
close all
clc

% 导入三幅全球TEC地图数据
load igsg1.mat; load igsg2.mat; load igsg3.mat;
% 导入全球海岸线数据
load coast;       
% 生成经纬度坐标
x=-180:2.5:180; y=-87.5:2.5:87.5;
% 分别绘制三幅全球TEC地图
for j=1:3
    igsg=['igsg',num2str(j)];   % 生成字符串
    n=length(eval(igsg))/5;     % 计算纬度个数
    for i=0:n-1                 % 将数据重新整理为标准矩阵
        data(i+1,:)=eval(['[',igsg,'(5*i+1,1:16) ',igsg,'(5*i+2,1:16) ',...
            igsg,'(5*i+3,1:16) ',igsg,'(5*i+4,1:16) ',igsg,'(5*i+5,1:9)',']']);
    end
    data=data/10;   % 换算为标准单位
    % 绘制TEC地图
    figure; imagesc(x,y,data); hold on; plot(long,lat,'w');
    set(gca,'ydir','normal'); set(gca,'position',[0.13 0.2 0.778 0.8]);
    set(gca,'XTick',-180:45:180, 'YTick',-60:30:60);
    axis equal; axis([-180 180 -87.5 87.5]);
    % 设置标题和横纵坐标
    if 8*(j-1)<10   %统一时间格式
        t=['0',num2str(8*(j-1))];
    else
        t=num2str(8*(j-1));
    end
    title(['GLOBAL IONOSPHERE MAPS FOR DAY 001, 2017 - ',t,':00 UT']);
    xlabel('Geographic longitude(\circ)');
    ylabel('Geographic latitude(\circ)');    
    % 设置色标
    hcb=colorbar('southoutside','position',[0.13 0.2 0.778 0.02]);
    set(get(hcb,'Xlabel'),'String','TEC(TECU)');
end