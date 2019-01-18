clear
close all
clc

% ��������ȫ��TEC��ͼ����
load igsg160507.mat;
% ����ȫ�򺣰�������
load coast;       
% ���ɾ�γ������
x=-180:2.5:180; y=-87.5:2.5:87.5;
% �ֱ��������ȫ��TEC��ͼ
filename = 'igsg160507.gif';
for j=1:13
    k=355*(j-1);
    for i=0:70                 % ��������������Ϊ��׼����
        data(i+1,:)=[igsg160507(5*i+k+1,1:16) igsg160507(5*i+k+2,1:16) ...
            igsg160507(5*i+k+3,1:16) igsg160507(5*i+k+4,1:16) ...
            igsg160507(5*i+k+5,1:9)];        
    end
    data=data/10;   % ����Ϊ��׼��λ
    datamax(j)=data(36,37);
    % ����TEC��ͼ
    figure; imagesc(x,y,data); hold on; plot(long,lat,'w');
    set(gca,'ydir','normal'); set(gca,'position',[0.13 0.2 0.778 0.8]);
    set(gca,'XTick',-180:45:180, 'YTick',-60:30:60);
    axis equal; axis([-180 180 -87.5 87.5]);
    % ���ñ���ͺ�������
    if 2*(j-1)<10   %ͳһʱ���ʽ
        t=['0',num2str(2*(j-1))];
    else
        t=num2str(2*(j-1));
    end
    title(['GLOBAL IONOSPHERE MAPS FOR DAY 128, 2016 - ',t,':00 UT']);
    xlabel('Geographic longitude(\circ)');
    ylabel('Geographic latitude(\circ)');    
    % ����ɫ��
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