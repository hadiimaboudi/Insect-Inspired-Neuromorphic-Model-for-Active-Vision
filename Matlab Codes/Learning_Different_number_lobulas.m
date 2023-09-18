%% number of lobula neurons 

clear all; close all
%load('Result_ActiveVision_20Nov.mat')
%load('Result_ActiveVision_20Nov_32RFs.mat')
%load('Result_ActiveVision_20Nov_16RFs.mat')
load('Result_ActiveVision_20Nov_4RFs.mat')
load('Corss_stim.mat')
 
y=Corss_stim{1,1};
x=Corss_stim{2,1};

x = imresize(x,1.1);
y = imresize(y,1.1);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=83;posy=12;

MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);

[MBON_before, MBON_after, MBONxx, MBONyy]=Learning_ActiveVision_36lobula(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Plus_NormalSpeed=calculate_performance(MBON_after,MBON_before);

save('Peformance_Plus_normalSpeed_test','performance_Plus_NormalSpeed','MBON_NormalSpeed_after_p','MBON_NormalSpeed_before_p',...
    'MBONxx_normalSpeed_p','MBONyy_normalSpeed_p')

% save('Peform_36N_plus','Peform_36N_plus')
%save('Perform_plus_36','Perform_plus_36','Perform_plus_16','Perform_plus_4')
%%
load('Perform_plus_differentLobula.mat')

figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar( MBONxx)

xlim([0 101])
box off
set(gca,'linewidth',1)


%%
load('Perform_plus_differentLobula.mat')
TESTs=[Perform_plus_36; Perform_plus_16;Perform_plus_4];

figure 
hold on

cc=[0.4940 0.1840 0.5560];
bar([mean(Perform_plus_36),0,0],'FaceColor',.5*cc,'EdgeColor',.5*cc)
bar([0 mean(Perform_plus_16),0],'FaceColor',.9*cc,'EdgeColor',cc)
bar([0 0 mean(Perform_plus_4)],'FaceColor',1.3*cc,'EdgeColor',1.4*cc)

errorbar(mean(TESTs'),std(TESTs')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])
xlim([.5 3.5])
box off
set(gca,'linewidth',1)