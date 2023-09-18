%% Face disctimination 
clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('FACE.mat')


winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before,Testface1,Testface2,Testface3,Testface4,Testface5, MBONxxfae, MBONyyface]=Learning_ActiveVision_face(FACE,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

%%

face_test1=calculate_performance(Testface1,MBON_before);
face_test2=calculate_performance(Testface2,MBON_before);
face_test3=calculate_performance(Testface3,MBON_before);
face_test4=calculate_performance(Testface4,MBON_before);
face_test5=calculate_performance(Testface5,MBON_before);


%performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);

save('Performance_FaceRecognision',...
    'face_test1','face_test2','face_test3','face_test4','face_test4',...
 'MBON_before','Testface1','Testface2','Testface3','Testface4','Testface5', 'MBONxxfae', 'MBONyyface')

%%
figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyyface,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxxfae,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

figure
TESTFACE=[face_test1;face_test2;face_test3;face_test4;face_test5];
bar(mean(TESTFACE,2))
hold on
errorbar(mean(TESTFACE,2),std(TESTFACE')/sqrt(20))



TESTFACE=[face_test2;face_test1;face_test3;face_test4;face_test5];

figure 
hold on
cc=[0.4660 0.6740 0.1880];
bar([mean(face_test2'),0,0,0,0],'FaceColor',.5*cc,'EdgeColor',.5*cc)
bar([0 mean(face_test1'),0,0,0],'FaceColor',.75*cc,'EdgeColor',.75*cc)
bar([0 0 mean(face_test3'),0,0],'FaceColor',1*cc,'EdgeColor',1*cc)
bar([0 0 0 mean(face_test4'),0],'FaceColor',1.15*cc,'EdgeColor',1.15*cc)
bar([0 0 0 0 mean(face_test5')],'FaceColor',1.4*cc,'EdgeColor',1.4*cc)

hold on
errorbar(mean(TESTFACE'),std(TESTFACE')/sqrt(20),'.k','Linewidth',2.5)
ylim([0 100])
xlim([.5 5.5])
box off
set(gca,'linewidth',1.3)

