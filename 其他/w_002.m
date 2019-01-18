clear
close all
clc

% ��������ȫ��TEC��ͼ����
load igsg1.mat; load igsg2.mat; load igsg3.mat;
% ����ȫ�򺣰�������
load coast;       
% ���ɾ�γ������
x=-180:2.5:180; y=-87.5:2.5:87.5;
% �ֱ��������ȫ��TEC��ͼ
for j=1:3
    igsg=['igsg',num2str(j)];   % �����ַ���
    n=length(eval(igsg))/5;     % ����γ�ȸ���
    for i=0:n-1                 % ��������������Ϊ��׼����
        data(i+1,:)=eval(['[',igsg,'(5*i+1,1:16) ',igsg,'(5*i+2,1:16) ',...
            igsg,'(5*i+3,1:16) ',igsg,'(5*i+4,1:16) ',igsg,'(5*i+5,1:9)',']']);
    end
    data=data/10;   % ����Ϊ��׼��λ
    % ����TEC��ͼ
    figure; imagesc(x,y,data); hold on; plot(long,lat,'w');
    set(gca,'ydir','normal'); set(gca,'position',[0.13 0.2 0.778 0.8]);
    set(gca,'XTick',-180:45:180, 'YTick',-60:30:60);
    axis equal; axis([-180 180 -87.5 87.5]);
    % ���ñ���ͺ�������
    if 8*(j-1)<10   %ͳһʱ���ʽ
        t=['0',num2str(8*(j-1))];
    else
        t=num2str(8*(j-1));
    end
    title(['GLOBAL IONOSPHERE MAPS FOR DAY 001, 2017 - ',t,':00 UT']);
    xlabel('Geographic longitude(\circ)');
    ylabel('Geographic latitude(\circ)');    
    % ����ɫ��
    hcb=colorbar('southoutside','position',[0.13 0.2 0.778 0.02]);
    set(get(hcb,'Xlabel'),'String','TEC(TECU)');
end