%% Generalisation bar 45

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('bar45.mat')


winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before_bar45, MBON_after_bar45, MBONxx_bar45, MBONyy_bar45,MBON_after_test2_bar45]=Learning_ActiveVision_pattern(bar45,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_bar45_test1=calculate_performance(MBON_after_bar45,MBON_before_bar45);
performance_bar45_test2=calculate_performance(MBON_after_test2_bar45,MBON_before_bar45);

save('Performance_bar45','performance_bar45_test1','performance_bar45_test2',...
 'MBON_before_bar45', 'MBON_after_bar45', 'MBONxx_bar45', 'MBONyy_bar45','MBON_after_test2_bar45')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_bar45,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_bar45,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% barDiscrimination

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('bar45.mat')


winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before_bar45d, MBON_after_bar45d, MBONxx_bar45d, MBONyy_bar45d,MBON_after_test2_bar45d]=Learning_ActiveVision_pattern(bar45,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


performance_bar45_test1d=calculate_performance(MBON_after_bar45d,MBON_before_bar45d);
performance_bar45_test2d=[]
performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);

save('Performance_bar45d','performance_bar45_test1d','performance_bar45_test2d',...
 'MBON_before_bar45d', 'MBON_after_bar45d', 'MBONxx_bar45d', 'MBONyy_bar45d','MBON_after_test2_bar45d')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_bar45d,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_bar45d,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% pattern 1

clear all; close all
%load('Result_ActiveVision_20Nov.mat')
%load('Result_ActiveVision_20Nov_16RFs.mat')
%load('Result_ActiveVision_20Nov_4RFs.mat')
load('Result_ActiveVision_20Nov_32RFs.mat')
load('Pattern1.mat')


winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before_pattern1, MBON_after_pattern1, MBONxx_pattern1, MBONyy_pattern1,MBON_after_test2_pattern1]=Learning_ActiveVision_pattern(Pattern1,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


performance_pattern1=calculate_performance(MBON_after_pattern1,MBON_before_pattern1);
performance_bar45_test2d=[]
%performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);

save('Performance_pattern1','performance_pattern1',...
 'MBON_before_pattern1', 'MBON_after_pattern1', 'MBONxx_pattern1', 'MBONyy_pattern1','MBON_after_test2_pattern1')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_pattern1,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_pattern1,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%%


clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Pattern1.mat')


winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before_pattern1, MBON_after_pattern1, MBONxx_pattern1, MBONyy_pattern1,MBON_after_test2_pattern1]=Learning_ActiveVision_pattern(Pattern1,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


performance_pattern1=calculate_performance(MBON_after_pattern1,MBON_before_pattern1);
performance_bar45_test2d=[]
%performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);

save('Performance_pattern1','performance_pattern1',...
 'MBON_before_pattern1', 'MBON_after_pattern1', 'MBONxx_pattern1', 'MBONyy_pattern1','MBON_after_test2_pattern1')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_pattern1,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_pattern1,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)


%% Pattern2

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Pattern2.mat')

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before_pattern2, MBON_after_pattern2, MBONxx_pattern2, MBONyy_pattern2,MBON_after_test2_pattern2]=Learning_ActiveVision_pattern(P2_A,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


performance_pattern2=calculate_performance(MBON_after_pattern2,MBON_before_pattern2);

%performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);

save('Performance_pattern2','performance_pattern2',...
 'MBON_before_pattern2', 'MBON_after_pattern2', 'MBONxx_pattern2', 'MBONyy_pattern2','MBON_after_test2_pattern2')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_pattern2,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_pattern2,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% Pattern3

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Pattern3.mat')

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before_pattern3, MBON_after_pattern3, MBONxx_pattern3, MBONyy_pattern3,MBON_after_test2_pattern3]=Learning_ActiveVision_pattern(Pattern3,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


performance_pattern3=calculate_performance(MBON_after_pattern3,MBON_before_pattern3);

%performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);

save('Performance_pattern3','performance_pattern3',...
 'MBON_before_pattern3', 'MBON_after_pattern3', 'MBONxx_pattern3', 'MBONyy_pattern3','MBON_after_test2_pattern3')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_pattern3,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_pattern3,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)


%% generalisation 

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Stimuli_Generalization.mat')

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;

[MBON_before,TEST1,TEST2,TEST3,MBONxx,MBONyy]=Learning_ActiveVision_Generalisation(Training_stimuli,Test_stimuli1,Test_stimuli2,Test_stimuli3,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


 Test1_1=calculate_performance_gen(TEST1{1,1},MBON_before);
 Test1_2=calculate_performance_gen(TEST1{1,2},MBON_before);
 Test1_3=calculate_performance_gen(TEST1{1,3},MBON_before);
 Test1_4=calculate_performance_gen(TEST1{1,4},MBON_before);
 Test1_5=calculate_performance_gen(TEST1{1,5},MBON_before);
 
 Test2_1=calculate_performance_gen(TEST2{1,1},MBON_before);
 Test2_2=calculate_performance_gen(TEST2{1,2},MBON_before);
 Test2_3=calculate_performance_gen(TEST2{1,3},MBON_before);
 Test2_4=calculate_performance_gen(TEST2{1,4},MBON_before);
 
 Test3_1=calculate_performance_gen(TEST3{1,1},MBON_before);
 Test3_2=calculate_performance_gen(TEST3{1,2},MBON_before);
 Test3_3=calculate_performance_gen(TEST3{1,3},MBON_before);
 
 TESTT1=[Test1_1;Test1_2;Test1_3;Test1_4];
 TESTT2=[Test2_1;Test2_2;Test2_3;Test2_4];
 TESTT3=[Test3_1;Test3_2;Test3_3];
 
 figure
 bar(mean(Test1_5'),'FaceColor',.5*[0.4660 0.6740 0.1880],'EdgeColor',.81*[0.4660 0.6740 0.1880])
 hold on
 errorbar(mean(Test1_5'),std(Test1_5')/sqrt(20),'.k','Linewidth',2.5)
ylim([0 100])
xlim([.5 1.5])
box off
set(gca,'linewidth',1)

 
figure
 bar(mean(TESTT1'),'FaceColor',.81*[0.4660 0.6740 0.1880],'EdgeColor',.81*[0.4660 0.6740 0.1880])
 hold on
 errorbar(mean(TESTT1'),std(TESTT1')/sqrt(20),'.k','Linewidth',2.5)
ylim([0 100])
xlim([.5 4.5])
box off
set(gca,'linewidth',1)

figure
 bar(mean(TESTT2'),'FaceColor',1*[0.4660 0.6740 0.1880],'EdgeColor',1*[0.4660 0.6740 0.1880])
 hold on
 errorbar(mean(TESTT2'),std(TESTT2')/sqrt(20),'.k','Linewidth',2.5)
ylim([0 100])
xlim([.5 4.5])
box off
set(gca,'linewidth',1)

figure
 bar(mean(TESTT3'),'FaceColor',1.2*[0.4660 0.6740 0.1880],'EdgeColor',1.2*[0.4660 0.6740 0.1880])
 hold on
 errorbar(mean(TESTT3'),std(TESTT3')/sqrt(20),'.k','Linewidth',2.5)
ylim([0 100])
xlim([.5 3.5])
box off
set(gca,'linewidth',1)

%save('Performance_Generalisation',...
%'MBON_before','TEST1','TEST2','TEST3','MBONxx','MBONyy')
% performance_generalisation_Test2=calculate_performance_gen(MBON_Test2,MBON_before);
% performance_generalisation_Test3=calculate_performance_gen(MBON_Test3,MBON_before);
% 
% %performance_bar45_test2d=calculate_performance(MBON_after_test2_bar45d,MBON_before_bar45d);
% 
% save('Performance_Generalisation',...
%     'performance_generalisation_Test1','performance_generalisation_Test2','performance_generalisation_Test3',...
%     'MBON_before', 'MBON_Test1','MBON_Test2','MBON_Test3', 'MBONxx', 'MBONyy')


figure
options1.color_area = [128 193 114]./255;
options1.color_line = [52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% Figure Generalisation 

TESTs=[performance_generalisation_Test1; performance_generalisation_Test2; performance_generalisation_Test3];

figure 
hold on

bar([mean(performance_generalisation_Test1),0,0],'FaceColor',.5*[0.4660 0.6740 0.1880],'EdgeColor',.5*[0.4660 0.6740 0.1880])
bar([0 mean(performance_generalisation_Test2),0],'FaceColor',[0.4660 0.6740 0.1880],'EdgeColor',[0.4660 0.6740 0.1880])
bar([0 0 mean(performance_generalisation_Test3)],'FaceColor',1.2*[0.4660 0.6740 0.1880],'EdgeColor',1.4*[0.4660 0.6740 0.1880])

errorbar(mean(TESTs'),std(TESTs')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])
xlim([.5 3.5])
box off
set(gca,'linewidth',1)

%% Patterns 
ccolour=[0.6350 0.0780 0.1840];
load('Performance_bar45d.mat')

figure(1)
Per_normal=[performance_bar45_test1d];
bar(mean(Per_normal'),'FaceColor',.6*ccolour,'EdgeColor',.6*ccolour)
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])

box off
set(gca,'linewidth',1)

load('Performance_pattern1.mat')

load('Performance_pattern3.mat')

figure(2)
Per_normal=[performance_pattern3];
bar(mean(Per_normal'),'FaceColor',ccolour,'EdgeColor',ccolour)
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(10),'.k','Linewidth',2)
ylim([0 100])
box off
set(gca,'linewidth',1)

figure(3)
Per_normal=[performance_pattern1];
bar(mean(Per_normal'),'FaceColor',1.25*ccolour,'EdgeColor',1.1*ccolour)
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])
box off
set(gca,'linewidth',1)



load('Performance_pattern2.mat')
figure(4)
Per_normal=[performance_pattern2];
bar(mean(Per_normal'),'FaceColor',1.5*ccolour,'EdgeColor',1.3*ccolour)
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(10),'.k','Linewidth',2)
ylim([0 100])
box off
set(gca,'linewidth',1)


%% Number of neurons 

load('performance_pattern36.mat')
load('Pattern_4neuron.mat')
load('Pattern_16neuron.mat')


TESTs=[performance_pattern36; performance_pattern1;performance_pattern_4noeuron];

figure 
hold on

cc=[0.4940 0.1840 0.5560];
bar([mean(performance_pattern36),0,0],'FaceColor',.5*cc,'EdgeColor',.5*cc)
bar([0 mean(performance_pattern1),0],'FaceColor',.9*cc,'EdgeColor',cc)
bar([0 0 mean(performance_pattern_4noeuron)],'FaceColor',1.3*cc,'EdgeColor',1.4*cc)

errorbar(mean(TESTs'),std(TESTs')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])
xlim([.5 3.5])
box off
set(gca,'linewidth',1)
