function [MBON_before, MBON_after, MBONxx, MBONyy]=Learning_ActiveVision_36lobula(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift)


%        
% % indstimuli=randi([2 7]);
% % indstimuli=7;
% % x=bar45{indstimuli,1};
% % y=bar45{indstimuli,2};
% x=Pattern1{1,1};
% y=Pattern1{1,2};
% %y= imrotate(Pattern1,90);
% 
% x = imresize(x,1.1);
% y = imresize(y,1.1);
% 
% posx=40;posy=10;
% posx=80;posy=10;
% MyImagex=take_patch_stimuli(x,winsize,NFrames,PixelShift,posx,posy,1);
% MyImagey=take_patch_stimuli(y,winsize,NFrames,PixelShift,posx,posy,1);

for beeind=1:20
    
n_lobula=size(Q,1);
n_KC=10*n_lobula;
V=rand(n_KC,n_lobula);
V=V>.95;
%V=.0001*V.*rand(size(V));
V=1.2*V.*ones(size(V));

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
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_after(beeind,sampletest)=MBONx-MBONy;
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