clear
close all
clc

load M;
figure; set(gca,'position',[0 0 1 1]); axis off
movie(M,3,2);
% movie2avi(M,'igsg.avi','fps',2);