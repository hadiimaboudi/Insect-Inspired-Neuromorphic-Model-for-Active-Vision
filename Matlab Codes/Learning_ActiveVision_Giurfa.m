function [MBON_before,TEST1,TEST2,TEST3,MBONxx,MBONyy,MBONxx2,MBONyy2,O,O2]=Learning_ActiveVision_Giurfa(Stimulli_LocalFeature,Training_stimuli,Test_stimuli1,Test_stimuli2,Test_stimuli3,Q,W,winsize,Laminafiltersize,NFrames,PixelShift)
 
lobulaNoise=.9995; 
posx=73;posy=37;
posx2=1;posy2=37;
PixelShift=19;
for p=1:length(Stimulli_LocalFeature)
    x=Stimulli_LocalFeature{1,p};
    y=Stimulli_LocalFeature{2,p};   
    x=x(:,:,1);
    y=y(:,:,1);  
    
x=imresize(x,.78);
y=imresize(y,.78);

x=x(1:123,1:123);
y=y(1:123,1:123);

addx=255*ones(size(x,1),50);
X=[addx,x,addx];
Y=[addx,y,addx];

addx=255*ones(15,size(X,2));
X=[addx;X;addx];
Y=[addx;Y;addx];

TrainingP(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx,posy,1);
TrainingN(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx,posy,1);

TrainingP2(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx2,posy2,1);
TrainingN2(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx2,posy2,1);
end

for p=1:length(Test_stimuli1)
    x=Test_stimuli1{1,p};
    y=Test_stimuli1{2,p};  
    x=x(:,:,1);
    y=y(:,:,1); 
    
x=imresize(x,.78);
y=imresize(y,.78);

addx=255*ones(size(x,1),50);
X=[addx,x,addx];
Y=[addx,y,addx];

addx=255*ones(15,size(X,2));
X=[addx;X;addx];
Y=[addx;Y;addx];

TEST1P(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx,posy,1);
TEST1N(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx,posy,1);

TEST1P2(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx2,posy2,1);
TEST1N2(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx2,posy2,1);

end

for p=1:length(Test_stimuli2)
    x=Test_stimuli2{1,p};
    y=Test_stimuli2{2,p};  
    x=x(:,:,1);
    y=y(:,:,1); 
    
x=imresize(x,.78);
y=imresize(y,.78);

addx=255*ones(size(x,1),50);
X=[addx,x,addx];
Y=[addx,y,addx];

addx=255*ones(15,size(X,2));
X=[addx;X;addx];
Y=[addx;Y;addx];

TEST2P(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx,posy,1);
TEST2N(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx,posy,1);

TEST2P2(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx2,posy2,1);
TEST2N2(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx2,posy2,1);

end


for p=1:length(Test_stimuli3)
    x=Test_stimuli3{1,p};
    y=Test_stimuli3{2,p};  
    x=x(:,:,1);
    y=y(:,:,1); 
    
x=imresize(x,.78);
y=imresize(y,.78);

addx=255*ones(size(x,1),50);
X=[addx,x,addx];
Y=[addx,y,addx];

addx=255*ones(15,size(X,2));
X=[addx;X;addx];
Y=[addx;Y;addx];

TEST3P(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx,posy,1);
TEST3N(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx,posy,1);

TEST3P2(:,p)=take_patch_stimuli(X,winsize,NFrames,PixelShift,posx2,posy2,1);
TEST3N2(:,p)=take_patch_stimuli(Y,winsize,NFrames,PixelShift,posx2,posy2,1);

end



for beeind=1:2% bee index
    
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
O2=O;
%[VspikeKCx VspikeKCy VspikeMBONx VspikeMBONy]=MB_Learning(Q,W,V,O,x,y,winsize,Laminafiltersize,NFrames,PixelShift,posx,posy,gE);

for k=1:100
  
p=randi([1 length(Training_stimuli)]);
q=randi([1 length(Training_stimuli)]);  

MyImagex=TrainingP(:,p);
MyImagey=TrainingN(:,q);

MyImagex2=TrainingP2(:,p);
MyImagey2=TrainingN2(:,q);

    
Lobulaspikex=Lobula_response(double(MyImagex),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);
Lobulaspikey=Lobula_response(double(MyImagey),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

  S = rand(size(Lobulaspikex));Randomness1=S>lobulaNoise;
 Lobulaspikex=Lobulaspikex+Randomness1;
   S = rand(size(Lobulaspikey));Randomness2=S>lobulaNoise;
 Lobulaspikey=Lobulaspikey+Randomness2;
 
Lobulaspikex2=Lobula_response(double(MyImagex2),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);
Lobulaspikey2=Lobula_response(double(MyImagey2),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);


 Lobulaspikex2=Lobulaspikex2+Randomness1;
 Lobulaspikey2=Lobulaspikey2+Randomness2;
 
%VspikeKCx=KCacitivty(lobula_FiringRatex,V);
%VspikeKCy=KCacitivty(lobula_FiringRatey,V);

if k==1
for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_before(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex2,MyImagey2,V,O2,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_before2(beeind,sampletest)=MBONx-MBONy;
end
end


VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);

VspikeKCx2=KCacitivty_spike(Lobulaspikex2,V,gE);
VspikeKCy2=KCacitivty_spike(Lobulaspikey2,V,gE);

VspikeMBONx=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy=MBON_activity(VspikeKCy,O,gE);

VspikeMBONx2=MBON_activity(VspikeKCx2,O2,gE);
VspikeMBONy2=MBON_activity(VspikeKCy2,O2,gE);

O=STDPrule_Laurent_guirfa(O,VspikeKCx,VspikeMBONx,1);
O=STDPrule_Laurent_guirfa(O,VspikeKCy,VspikeMBONy,0);

O2=STDPrule_Laurent_guirfa(O2,VspikeKCx2,VspikeMBONx2,1);
O2=STDPrule_Laurent_guirfa(O2,VspikeKCy2,VspikeMBONy2,0);

MBONxx(beeind,k)=sum(VspikeMBONx);
MBONyy(beeind,k)=sum(VspikeMBONy);

MBONxx2(beeind,k)=sum(VspikeMBONx2);
MBONyy2(beeind,k)=sum(VspikeMBONy2);

[beeind k]

end


%%% TEST 
for sampletest=1:20  
test1=1:length(Test_stimuli1);
MyImagextestx=TEST1P(:,test1);
MyImagextesty=TEST1N(:,test1);

MyImagextestx2=TEST1P2(:,test1);
MyImagextesty2=TEST1N2(:,test1);


[MBONx11, MBONy11]=ActiveVisionTest(MyImagextestx,MyImagextesty,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
[MBONx11_2, MBONy11_2]=ActiveVisionTest(MyImagextestx2,MyImagextesty2,Q,W,V,O2,winsize,Laminafiltersize,NFrames,PixelShift,gE);

TEST1(beeind,test1,sampletest,1)=MBONx11-MBONy11;
TEST1(beeind,test1,sampletest,2)=MBONx11_2-MBONy11_2;
end



for sampletest=1:20  
test1=1:length(Test_stimuli2);
MyImagextestx=TEST2P(:,test1);
MyImagextesty=TEST2N(:,test1);

MyImagextestx2=TEST2P2(:,test1);
MyImagextesty2=TEST2N2(:,test1);


[MBONx11, MBONy11]=ActiveVisionTest(MyImagextestx,MyImagextesty,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
[MBONx11_2, MBONy11_2]=ActiveVisionTest(MyImagextestx2,MyImagextesty2,Q,W,V,O2,winsize,Laminafiltersize,NFrames,PixelShift,gE);

TEST2(beeind,test1,sampletest,1)=MBONx11-MBONy11;
TEST2(beeind,test1,sampletest,2)=MBONx11_2-MBONy11_2;
end


for sampletest=1:20  
test1=1:length(Test_stimuli3);
MyImagextestx=TEST3P(:,test1);
MyImagextesty=TEST3N(:,test1);

MyImagextestx2=TEST3P2(:,test1);
MyImagextesty2=TEST3N2(:,test1);


[MBONx11, MBONy11]=ActiveVisionTest(MyImagextestx,MyImagextesty,Q,W,V,O,winsize,Laminafiltersize,NFrames,PixelShift,gE);
[MBONx11_2, MBONy11_2]=ActiveVisionTest(MyImagextestx2,MyImagextesty2,Q,W,V,O2,winsize,Laminafiltersize,NFrames,PixelShift,gE);

TEST3(beeind,test1,sampletest,1)=MBONx11-MBONy11;
TEST3(beeind,test1,sampletest,2)=MBONx11_2-MBONy11_2;
end


end
end

    
