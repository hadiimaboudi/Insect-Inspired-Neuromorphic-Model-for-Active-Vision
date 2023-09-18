function [MBON_before,TEST1,TEST2,TEST3,MBONxx,MBONyy]=Learning_ActiveVision_TwoLocalFeature(Training_stimuli,Test_stimuli1,Test_stimuli2,Test_stimuli3,Q,W,winsize,Laminafiltersize,NFrames,PixelShift)
 
x=Test_stimuli3{1,2};
x=x(:,:,1);
y=Test_stimuli3{2,2};
y=y(:,:,1);
x32=imresize(x,.9);
y32=imresize(y,.9);
posx=65;posy=1;
MyImagex=take_patch_stimuli(x32,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey=take_patch_stimuli(y32,winsize,NFrames,PixelShift,posx,posy,1);

%%testStimuli 1
x=Test_stimuli1{1,1};
x=x(:,:,1);
y=Test_stimuli1{2,1};
y=y(:,:,1);
xt1=imresize(x,.9);
yt1=imresize(y,.9);
posx=65;posy=1;

MyImagex11=take_patch_stimuli(xt1,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey11=take_patch_stimuli(yt1,winsize,NFrames,PixelShift,posx,posy,1);


%%testStimuli 1-2
x=Test_stimuli1{1,3};
x=x(:,:,1);
y=Test_stimuli1{2,3};
y=y(:,:,1);
xt1_2=imresize(x,.9);
yt1_2=imresize(y,.9);
posx=65;posy=1;
MyImagex12=take_patch_stimuli(xt1_2,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey12=take_patch_stimuli(yt1_2,winsize,NFrames,PixelShift,posx,posy,1);


%%test stimuli 1-3
x=Test_stimuli1{1,4};
x=x(:,:,1);
y=Test_stimuli1{2,4};
y=y(:,:,1);
xt13 = imresize(x,.9);
yt13 = imresize(y,.9);
posx=65;posy=1;
MyImagex13=take_patch_stimuli(xt13,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey13=take_patch_stimuli(yt13,winsize,NFrames,PixelShift,posx,posy,1);

%%testStimulo 2-1
x=Test_stimuli2{1,3};
x=x(:,:,1);
y=Test_stimuli2{2,3};
y=y(:,:,1);
x21 = imresize(x,.9);
y21 = imresize(y,.9);
posx=65;posy=1;
MyImagex21=take_patch_stimuli(x21,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey21=take_patch_stimuli(y21,winsize,NFrames,PixelShift,posx,posy,1);

%%testStimuli 2-2
x=Test_stimuli2{1,4};
x=x(:,:,1);
y=Test_stimuli2{2,4};
y=y(:,:,1);
x22 = imresize(x,.9);
y22 = imresize(y,.9);
posx=65;posy=1;
MyImagex22=take_patch_stimuli(x22,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey22=take_patch_stimuli(y22,winsize,NFrames,PixelShift,posx,posy,1);
%%testStimuli 3-1
x=Test_stimuli3{1,1};
x=x(:,:,1);
y=Test_stimuli3{2,1};
y=y(:,:,1);
x31 = imresize(x,.9);
y31 = imresize(y,.9);
posx=65;posy=1;
MyImagex31=take_patch_stimuli(x31,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey31=take_patch_stimuli(y31,winsize,NFrames,PixelShift,posx,posy,1);

%%testStimuli 3-2
x=Test_stimuli3{1,2};
x=x(:,:,1);
y=Test_stimuli3{2,2};
y=y(:,:,1);
x32=imresize(x,.9);
y32=imresize(y,.9);
posx=65;posy=1;
MyImagex32=take_patch_stimuli(x32,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey32=take_patch_stimuli(y32,winsize,NFrames,PixelShift,posx,posy,1);

%%testStimuli 3-3
x=Test_stimuli3{1,3};
x=x(:,:,1);
y=Test_stimuli3{2,3};
y=y(:,:,1);
x33 = imresize(x,.9);
y33 = imresize(y,.9);
posx=65;posy=1;
MyImagex33=take_patch_stimuli(x33,winsize,NFrames,PixelShift,posx,posy,1);
MyImagey33=take_patch_stimuli(y33,winsize,NFrames,PixelShift,posx,posy,1);


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


for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_before(beeind,sampletest)=MBONx-MBONy;
end

VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);
 
VspikeMBONx=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy=MBON_activity(VspikeKCy,O,gE);

for k=1:100

O=STDPrule_Laurent(O,VspikeKCx,VspikeMBONx,1);
O=STDPrule_Laurent(O,VspikeKCy,VspikeMBONy,0);

VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);
 
VspikeMBONx=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy=MBON_activity(VspikeKCy,O,gE);

MBONxx(beeind,k)=sum(VspikeMBONx);
MBONyy(beeind,k)=sum(VspikeMBONy);
[beeind k]
     
end

for sampletest=1:20  
[MBONx11, MBONy11]=ActiveVisionTest(MyImagex11,MyImagey11,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test1_1(beeind,sampletest)=MBONx11-MBONy11;
end


for sampletest=1:20  
    [MBONx, MBONy]=ActiveVisionTest(MyImagex12,MyImagey12,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test1_2(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:20  

    [MBONx, MBONy]=ActiveVisionTest(MyImagex13,MyImagey13,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test1_3(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:20  

   [MBONx, MBONy]=ActiveVisionTest(MyImagex21,MyImagey21,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test2_1(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:20  
[MBONx, MBONy]=ActiveVisionTest(MyImagex22,MyImagey22,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test2_2(beeind,sampletest)=MBONx-MBONy;
end



for sampletest=1:20  

[MBONx, MBONy]=ActiveVisionTest(MyImagex31,MyImagey31,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test3_1(beeind,sampletest)=MBONx-MBONy;
end

for sampletest1=1:20      
[MBONx32 MBONy32]=ActiveVisionTest(MyImagex32,MyImagey32,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test3_2(beeind,sampletest1)=MBONx32-MBONy32;
end


for sampletest=1:20  

    [MBONx33, MBONy33]=ActiveVisionTest(MyImagex,MyImagey,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
MBON_Test3_3(beeind,sampletest)=MBONx33-MBONy33;
end

end

TEST1{1}=MBON_Test1_1;
TEST1{2}=MBON_Test1_2;
TEST1{3}=MBON_Test1_3;

TEST2{1}=MBON_Test2_1;
TEST2{2}=MBON_Test2_2;

TEST3{1}=MBON_Test3_1;
TEST3{2}=MBON_Test3_2;
TEST3{3}=MBON_Test3_3;
