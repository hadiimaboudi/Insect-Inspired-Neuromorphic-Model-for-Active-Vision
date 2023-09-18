function [MBON_before,Testface1,Testface2,Testface3,Testface4,Testface5, MBONxx, MBONyy]=Learning_ActiveVision_face(FACE,Q,W,winsize,Laminafiltersize,NFrames,PixelShift)

MBON_after_test2=[];
       
% indstimuli=randi([2 7]);
% indstimuli=7;
% x=bar45{indstimuli,1};
% y=bar45{indstimuli,2};
x1=FACE{1,1};
x2=FACE{1,2};
x3=FACE{1,3};
x4=FACE{1,4};
x5=FACE{1,5};
%x5=imresize(x5,1.05);
x6=FACE{1,6};
x7=FACE{1,7};

posx=124;posy=10;
MyImagex1=take_patch_stimuli(x1,winsize,NFrames,PixelShift,posx,posy,1);
MyImagex2=take_patch_stimuli(x2,winsize,NFrames,PixelShift,posx,posy,1);
MyImagex3=take_patch_stimuli(x3,winsize,NFrames,PixelShift,posx,posy,1);
MyImagex4=take_patch_stimuli(x4,winsize,NFrames,PixelShift,posx,posy,1);
MyImagex5=take_patch_stimuli(x5,winsize,NFrames,PixelShift,posx,posy,1);
MyImagex6=take_patch_stimuli(x6,winsize,NFrames,PixelShift,posx,posy,1);
MyImagex7=take_patch_stimuli(x7,winsize,NFrames,PixelShift,posx,posy,1);


MyImagex=MyImagex1;
MyImagey=MyImagex2;
    
   
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


for k=1:100 
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

for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex1,MyImagex5,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
Testface1(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex1,MyImagex2,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
Testface2(beeind,sampletest)=MBONx-MBONy;
end


for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex1,MyImagex3,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
Testface3(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex1,MyImagex4,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
Testface4(beeind,sampletest)=MBONx-MBONy;
end

for sampletest=1:20
[MBONx, MBONy]=ACModel_response(MyImagex6,MyImagex7,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
Testface5(beeind,sampletest)=MBONx-MBONy;
end


end