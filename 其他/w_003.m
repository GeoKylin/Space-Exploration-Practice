clear
close all
clc

load igsg99.mat;
n=length(igsg99)/5;
for i=0:n-1
    d=[igsg99(5*i+1,1:16) igsg99(5*i+2,1:16) igsg99(5*i+3,1:16) ...
        igsg99(5*i+4,1:16) igsg99(5*i+5,1:9)];
    data(i+1,:)=interp(d,2);
end
data=data/10;
load coast;
x=-180:2.5:180; y=-87.5:2.5:87.5;
figure;
imagesc(x,y,data(:,1:145));hold on;
set(gca,'ydir','normal')
plot(long,lat,'w');
set(gca,'position',[0.13 0.2 0.778 0.8])
xlabel('Geographic longitude(\circ)'); ylabel('Geographic latitude(\circ)');
title('GLOBAL IONOSPHERE MAPS FOR DAY 001, 2017 - 12:00 UT');
set(gca,'XTick',-180:45:180, 'YTick',-60:30:60);
axis equal; axis([-180 180 -87.5 87.5]);
hcb=colorbar('southoutside','position',[0.13 0.2 0.778 0.02]);
set(get(hcb,'Xlabel'),'String','TEC(TECU)')