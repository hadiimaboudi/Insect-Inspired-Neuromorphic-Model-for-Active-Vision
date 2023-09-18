function [MBON_before,TEST1,TEST2,TEST3,MBONxx,MBONyy]=Learning_ActiveVision_Generalisation(Training_stimuli,Test_stimuli1,Test_stimuli2,Test_stimuli3,Q,W,winsize,Laminafiltersize,NFrames,PixelShift)

MBON_after_test2=[];

        
% indstimuli=randi([1 6]); 
% indstimulj=randi([1 6]);
% 
% x=Training_stimuli{1,indstimuli};
% x=x(:,:,1);
% y=Training_stimuli{2,indstimulj};      
% y=y(:,:,1);   

x=Test_stimuli1{1,1};
x=x(:,:,1);
y=Test_stimuli2{1,1};
y=y(:,:,1);

x = imresize(x,.9);
y = imresize(y,.9);

posx=40;posy=10;
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);

for beeind=1:20
           
n_lobula=size(Q,1);
n_KC=10*n_lobula;
V=rand(n_KC,n_lobula);
V=V>.95;
%V=.0001*V.*rand(size(V));
V=.7*V.*ones(size(V));

TauE=10;
gEx=@(x) exp(-x./TauE);
tspike=1:10;
gE=gEx(tspike);

O=.2*rand(1,n_KC);
O=.3*ones(1,n_KC);
O1=O;
%[VspikeKCx VspikeKCy VspikeMBONx VspikeMBONy]=MB_Learning(Q,W,V,O,x,y,winsize,Laminafiltersize,NFrames,PixelShift,posx,posy,gE);


Lobulaspikex=Lobula_response(double(MyImagex),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);
Lobulaspikey=Lobula_response(double(MyImagey),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

%VspikeKCx=KCacitivty(lobula_FiringRatex,V);
%VspikeKCy=KCacitivty(lobula_FiringRatey,V);

VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);

VspikeMBONx0=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy0=MBON_activity(VspikeKCy,O,gE);


for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_before(beeind,sampletest)=MBONx-MBONy;
end



for k=1:50 
% VspikeKCx=KCacitivty(lobula_FiringRatex,V);
% VspikeKCy=KCacitivty(lobula_FiringRatey,V);

VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);
 
VspikeMBONx=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy=MBON_activity(VspikeKCy,O,gE);

%O=STDPrule(O,VspikeKCx,VspikeMBONx,0);
%O=STDPrule(O,VspikeKCy,VspikeMBONy,0);

O=STDPrule_Laurent(O,VspikeKCx,VspikeMBONx,1);
O=STDPrule_Laurent(O,VspikeKCy,VspikeMBONy,0);

MBONxx(beeind,k)=sum(VspikeMBONx);
MBONyy(beeind,k)=sum(VspikeMBONy);
[beeind k]
end


for sampletest=1:10  
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test0_1(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:10  
x=Test_stimuli1{1,1};
x=x(:,:,1);
y=Test_stimuli1{2,1};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test1_1(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:10  
x=Test_stimuli1{1,2};
x=x(:,:,1);
y=Test_stimuli1{2,2};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test1_2(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:10  
x=Test_stimuli1{1,3};
x=x(:,:,1);
y=Test_stimuli1{2,3};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test1_3(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:10  
x=Test_stimuli1{1,4};
x=x(:,:,1);
y=Test_stimuli1{2,4};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test1_4(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:10  
x=Test_stimuli2{2,1};
x=x(:,:,1);
y=Test_stimuli2{1,1};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test2_1(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:10  
x=Test_stimuli2{2,2};
x=x(:,:,1);
y=Test_stimuli2{1,2};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test2_2(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:10  
x=Test_stimuli2{2,3};
x=x(:,:,1);
y=Test_stimuli2{1,3};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test2_3(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:10  
x=Test_stimuli2{2,4};
x=x(:,:,1);
y=Test_stimuli2{1,4};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test2_4(beeind,sampletest)=MBONx-MBONy;
end



for sampletest=1:10  
x=Test_stimuli3{1,1};
x=x(:,:,1);
y=Test_stimuli3{2,1};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test3_1(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:10  
x=Test_stimuli3{1,2};
x=x(:,:,1);
y=Test_stimuli3{2,2};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test3_2(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:10  
x=Test_stimuli3{1,3};
x=x(:,:,1);
y=Test_stimuli3{2,3};
y=y(:,:,1);
x = imresize(x,.9);
y = imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_Test3_3(beeind,sampletest)=MBONx-MBONy;
end

% for sampletest=1:20
% 
% indstimuli=1;
% x=bar45{indstimuli,1};
% y=bar45{indstimuli,2};
% 
% x = imresize(x,1.1);
% y = imresize(y,1.1);
% 
% posx=90;posy=20;
% 
% MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
% MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);
% 
% [MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
% MBON_after_test2(beeind,sampletest)=MBONx-MBONy;
% end

end

TEST1{1}=MBON_Test1_1;
TEST1{2}=MBON_Test1_2;
TEST1{3}=MBON_Test1_3;
TEST1{4}=MBON_Test1_4;
TEST1{5}=MBON_Test0_1;


TEST2{1}=MBON_Test2_1;
TEST2{2}=MBON_Test2_2;
TEST2{3}=MBON_Test2_3;
TEST2{4}=MBON_Test2_4;

TEST3{1}=MBON_Test3_1;
TEST3{2}=MBON_Test3_2;
TEST3{3}=MBON_Test3_3;
