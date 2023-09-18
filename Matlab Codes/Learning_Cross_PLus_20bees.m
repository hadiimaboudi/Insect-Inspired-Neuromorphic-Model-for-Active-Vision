clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')
 
x=Corss_stim{1,1};
y=Corss_stim{2,1};

x = imresize(x,1.35);
y = imresize(y,1.35);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=115;posy=1;


MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);

[MBON_NormalSpeed_before_p,MBON_NormalSpeed_after_p, MBONxx_normalSpeed_p, MBONyy_normalSpeed_p]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Plus_NormalSpeed=calculate_performance(MBON_NormalSpeed_after_p,MBON_NormalSpeed_before_p);

save('Peformance_Plus_normalSpeed','performance_Plus_NormalSpeed','MBON_NormalSpeed_after_p','MBON_NormalSpeed_before_p',...
    'MBONxx_normalSpeed_p','MBONyy_normalSpeed_p')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_normalSpeed_p,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar( MBONxx_normalSpeed_p,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% Normal Speed Cross

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

y=Corss_stim{1,1};
x=Corss_stim{2,1};


x = imresize(x,1.35);
y = imresize(y,1.35);


winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=115;posy=1;


MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);


%showStimulus(MyImagex,winsize,NFrames)
%showStimulus(MyImagey,winsize,NFrames)

[MBON_NormalSpeed_before_c, MBON_NormalSpeed_after_c, MBONxx_normalSpeed_c, MBONyy_normalSpeed_c]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Corss_NormalSpeed=calculate_performance(MBON_NormalSpeed_after_c,MBON_NormalSpeed_before_c);
% 
 save('Peformance_Corss_normalSpeed','performance_Corss_NormalSpeed','MBON_NormalSpeed_after_c','MBON_NormalSpeed_before_c',...
     'MBONxx_normalSpeed_c','MBONyy_normalSpeed_c')

figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'sem';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_normalSpeed_c,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'sem';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_normalSpeed_c,options2)

%xlim([0 101])
box off
set(gca,'linewidth',1)
%% No Movement  PLUS

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

x=Corss_stim{1,1};
y=Corss_stim{2,1};

x = imresize(x,1.2);
y = imresize(y,1.2);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=100;posy=1;

% MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,0);
% showStimulus(MyImagex,winsize,NFrames);
% 
% MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,0);
% showStimulus(MyImagey,winsize,NFrames);
% 
% 
% MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
% showStimulus(MyImagex,winsize,NFrames);
% 
% MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
% showStimulus(MyImagey,winsize,NFrames);

MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,0);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,0);

[MBON_NoMovement_before_p, MBON_NoMovement_after_p, MBONxx_NoMovement_p, MBONyy_NoMovement_p]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_PLUS_NoMovement=calculate_performance(MBON_NoMovement_after_p,MBON_NoMovement_before_p);

save('Peformance_Plus_NoMovement','performance_PLUS_NoMovement','MBON_NoMovement_after_p','MBON_NoMovement_before_p',...
    'MBONxx_NoMovement_p','MBONyy_NoMovement_p')

figure

options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONxx_NoMovement_p,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONyy_NoMovement_p,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% No Movment Cross

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

y=Corss_stim{1,1};
x=Corss_stim{2,1};

x = imresize(x,1.2);
y = imresize(y,1.2);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=100;posy=1;

% 
% MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
% showStimulus(MyImagex,winsize,NFrames);
% 
% MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
% showStimulus(MyImagey,winsize,NFrames);

MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,0);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,0);


[MBON_NoMovement_before_c, MBON_NoMovement_after_c, MBONxx_NoMovement_c, MBONyy_NoMovement_c]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Corss_NoMovement=calculate_performance(MBON_NoMovement_after_c,MBON_NoMovement_before_c);

save('Peformance_Cross_NoMovement','performance_Corss_NoMovement','MBON_NoMovement_after_c','MBON_NoMovement_before_c',...
   'MBONxx_NoMovement_c','MBONyy_NoMovement_c')

figure

options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_NoMovement_c,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_NoMovement_c,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)
%% Faster movment PLUS

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

x=Corss_stim{1,1};
y=Corss_stim{2,1};
x = imresize(x,1.45);
y = imresize(y,1.45);

Ylarge=[];Xlarge=[];
for cd=1:3
addx=255*ones(size(x,1),150);
Xlarge(:,:,cd)=[addx,x(:,:,cd),addx];
Ylarge(:,:,cd)=[addx,y(:,:,cd),addx];
end

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=90;posy=20;

% showStimulus(MyImagey,winsize,NFrames);
posx=130;posy=100;
MyImagex=take_patch_stimuli(Xlarge,winsize,NFrames,45,posx,posy,1);
MyImagey=take_patch_stimuli(Ylarge,winsize,NFrames,45,posx,posy,1);

[MBON_Fast_before_P, MBON_Fast_after_P, MBONxx_Fast_p, MBONyy_Fast_p]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Plus_Fast=calculate_performance(MBON_Fast_after_P,MBON_Fast_before_P);

save('Peformance_Plus_Fast','performance_Plus_Fast','MBON_Fast_before_P','MBON_Fast_after_P',...
    'MBONxx_Fast_p','MBONyy_Fast_p')

figure

options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_Fast_p,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_Fast_p,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% Faster movment Cross

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

y=Corss_stim{1,1};
x=Corss_stim{2,1};
x = imresize(x,1.45);
y = imresize(y,1.45);

Ylarge=[];Xlarge=[];
for cd=1:3
addx=255*ones(size(x,1),150);
Xlarge(:,:,cd)=[addx,x(:,:,cd),addx];
Ylarge(:,:,cd)=[addx,y(:,:,cd),addx];
end

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=90;posy=20;

% showStimulus(MyImagey,winsize,NFrames);
posx=130;posy=100;
MyImagex=take_patch_stimuli(Xlarge,winsize,NFrames,45,posx,posy,1);
MyImagey=take_patch_stimuli(Ylarge,winsize,NFrames,45,posx,posy,1);


[MBON_Fast_before_C, MBON_Fast_after_C, MBONxx_Fast_C, MBONyy_Fast_C]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Cross_Fast=calculate_performance(MBON_Fast_after_C,MBON_Fast_before_C);

save('Peformance_Cross_Fast','performance_Cross_Fast','MBON_Fast_after_C','MBON_Fast_before_C',...
    'MBONxx_Fast_C','MBONyy_Fast_C')

figure

options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_Fast_C,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_Fast_C,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%% Scanning Whole regions of patterns_Plus

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

x=Corss_stim{1,1};
y=Corss_stim{2,1};
x = imresize(x,.65);
y = imresize(y,.65);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=15;posy=35;


Ylarge=[];Xlarge=[];
for cd=1:3

addx=255*ones(size(x,1),50);
Xlarge(:,:,cd)=[addx,x(:,:,cd),addx];
Ylarge(:,:,cd)=[addx,y(:,:,cd),addx];
end

% 
MyImagex=take_patch_stimuli(Xlarge,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(Ylarge,winsize,NFrames,PixelShift,posx,posy,1);

showStimulus(MyImagex,winsize,NFrames);
showStimulus(MyImagey,winsize,NFrames);
 

[MBON_Whole_before_p,MBON_Whole_after_p, MBONxx_Whole_p, MBONyy_Whole_p]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Plus_Whole=calculate_performance(MBON_Whole_after_p,MBON_Whole_before_p);

save('Performance_Plus_Whole','performance_Plus_Whole',...
    'MBON_Whole_before_p','MBON_Whole_after_p', 'MBONxx_Whole_p', 'MBONyy_Whole_p')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONxx_Whole_p,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONyy_Whole_p,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)


%% Scanning Whole regions of patterns_cross

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

x=Corss_stim{1,1};
y=Corss_stim{2,1};
x = imresize(x,.65);
y = imresize(y,.65);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 
PixelShift=15;
posx=15;posy=35;


Ylarge=[];Xlarge=[];
for cd=1:3

addx=255*ones(size(x,1),50);
Xlarge(:,:,cd)=[addx,x(:,:,cd),addx];
Ylarge(:,:,cd)=[addx,y(:,:,cd),addx];
end
% 
MyImagex=take_patch_stimuli(Xlarge,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(Ylarge,winsize,NFrames,PixelShift,posx,posy,1);

showStimulus(MyImagex,winsize,NFrames);
showStimulus(MyImagey,winsize,NFrames);
 
[MBON_Whole_before_c,MBON_Whole_after_c, MBONxx_Whole_c, MBONyy_Whole_c]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Cross_Whole=calculate_performance(MBON_Whole_after_c,MBON_Whole_before_c);

save('Performance_Cross_Whole','performance_Cross_Whole',...
    'MBON_Whole_before_c','MBON_Whole_after_c', 'MBONxx_Whole_c', 'MBONyy_Whole_c')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONxx_Whole_c,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONyy_Whole_c,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)




%% Scanning from distance plus

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

x=Corss_stim{1,1};
y=Corss_stim{2,1};
x = imresize(x,.3);
y = imresize(y,.3);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 


Ylarge=[];Xlarge=[];
for cd=1:3
addx=255*ones(size(x,1),150);
Xlarge(:,:,cd)=[addx,x(:,:,cd),addx];
Ylarge(:,:,cd)=[addx,y(:,:,cd),addx];
end

for cd=1:3
addx=255*ones(100,size(Xlarge,2));
Xlarge2(:,:,cd)=[addx;Xlarge(:,:,cd);addx];
Ylarge2(:,:,cd)=[addx;Ylarge(:,:,cd);addx];
end

PixelShift=15;
posx=85;posy=100;
% 
MyImagex=take_patch_stimuli(Xlarge2,winsize,NFrames,20,posx,posy,1);
MyImagey=take_patch_stimuli(Ylarge2,winsize,NFrames,20,posx,posy,1);

showStimulus(MyImagex,winsize,NFrames);
showStimulus(MyImagey,winsize,NFrames);

 
[MBON_dist_before_p,MBON_dist_after_p, MBONxx_dist_p, MBONyy_dist_p]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Plus_Dist=calculate_performance(MBON_dist_after_p,MBON_dist_before_p);

save('Pperformance_Plus_Dist','performance_Plus_Dist',...
    'MBON_dist_before_p','MBON_dist_after_p','MBONxx_dist_p','MBONyy_dist_p')


figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_dist_p,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_dist_p,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)

%%
%% Scanning from distance Cross

clear all; close all
load('Result_ActiveVision_20Nov.mat')
load('Corss_stim.mat')

y=Corss_stim{1,1};
x=Corss_stim{2,1};
x = imresize(x,.4);
y = imresize(y,.4);

winsize=75; %image size
Laminafiltersize=3;
NFrames=5; % number of frame sampling 


Ylarge=[];Xlarge=[];
for cd=1:3
addx=255*ones(size(x,1),150);
Xlarge(:,:,cd)=[addx,x(:,:,cd),addx];
Ylarge(:,:,cd)=[addx,y(:,:,cd),addx];
end

for cd=1:3
addx=255*ones(100,size(Xlarge,2));
Xlarge2(:,:,cd)=[addx;Xlarge(:,:,cd);addx];
Ylarge2(:,:,cd)=[addx;Ylarge(:,:,cd);addx];
end

PixelShift=15;
posx=95;posy=100;
% 
MyImagex=take_patch_stimuli(Xlarge2,winsize,NFrames,20,posx,posy,1);
MyImagey=take_patch_stimuli(Ylarge2,winsize,NFrames,20,posx,posy,1);

showStimulus(MyImagex,winsize,NFrames);
showStimulus(MyImagey,winsize,NFrames);

 
[MBON_dist_before_c,MBON_dist_after_c, MBONxx_dist_c, MBONyy_dist_c]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

performance_Cross_Dist=calculate_performance(MBON_dist_after_c,MBON_dist_before_c);

save('Pperformance_Cross_Dist','performance_Cross_Dist',...
    'MBON_dist_before_c','MBON_dist_after_c','MBONxx_dist_c','MBONyy_dist_c')

figure
options1.color_area = [128 193 219]./255;    % Blue theme
options1.color_line = [ 52 148 186]./255;
options1.alpha = 0.5;
options1.line_width = 2;
options1.error= 'std';
options1.handle = figure(1);

plot_areaerrorbar(MBONyy_dist_c,options1)

hold on
options2.color_area = [243 169 114]./255;    % Orange theme
options2.color_line = [236 112  22]./255;
options2.alpha = 0.5;
options2.line_width = 2;
options2.error= 'std';
options2.handle = figure(1);

plot_areaerrorbar(MBONxx_dist_c,options2)

xlim([0 101])
box off
set(gca,'linewidth',1)


%% learn other patterns 




%%

load('Peformance_Corss_normalSpeed.mat')
load('Peformance_Plus_normalSpeed.mat')
load('Peformance_Cross_Fast.mat')
load('Peformance_Plus_Fast.mat')
load('Peformance_Cross_NoMovement.mat')
load('Peformance_Plus_NoMovement.mat')
load('Performance_Cross_Whole.mat')
load('Performance_Plus_Whole.mat')
load('Pperformance_Cross_Dist.mat')
load('Pperformance_Plus_Dist.mat')


figure(1)
Per_normal=[performance_Corss_NormalSpeed; performance_Plus_NormalSpeed];
bar(mean(Per_normal'),'FaceColor',.3*[1 1 1],'EdgeColor',.3*[1 1 1])
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])

figure(2)
Per_normal=[performance_Cross_Fast; performance_Cross_Fast];
bar(mean(Per_normal'),'FaceColor',.45*[1 1 1],'EdgeColor',.45*[1 1 1])
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])

figure(3)
Per_normal=[performance_Corss_NoMovement; performance_PLUS_NoMovement];
bar(mean(Per_normal'),'FaceColor',.6*[1 1 1],'EdgeColor',.6*[1 1 1])
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])


figure(4)
Per_normal=[performance_Cross_Whole; performance_Plus_Whole];
bar(mean(Per_normal'),'FaceColor',.75*[1 1 1],'EdgeColor',.75*[1 1 1])
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])


figure(5)
Per_normal=[performance_Cross_Dist; performance_Plus_Dist];
bar(mean(Per_normal'),'FaceColor',.9*[1 1 1],'EdgeColor',.9*[1 1 1])
hold on 
errorbar(mean(Per_normal'),std(Per_normal')/sqrt(20),'.k','Linewidth',2)
ylim([0 100])


%%
close all
f=@(x) -1*exp(-x/20)

g=@(x) -1*exp(x/20)

xx=0:60
yy=-60:0
plot(xx,f(xx),'Linewidth',2)
hold on 
plot(yy,g(yy),'r','Linewidth',2)
ylim([-1 1])
axis off



f=@(x) 1*exp(-x/20)

g=@(x) -1*exp(x/20)

xx=0:60
yy=-60:0
figure
hold on
plot(xx,f(xx),'Linewidth',2)
plot(yy,g(yy),'r','Linewidth',2)
ylim([-1 1])
axis off