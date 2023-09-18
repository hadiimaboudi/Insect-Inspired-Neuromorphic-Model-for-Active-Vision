function [MBON_before, MBON_after, MBONxx, MBONyy]=Learning_ActiveVision(MyImagex,MyImagey,Q,W,winsize,Laminafiltersize,NFrames,PixelShift)

for beeind=1:20

n_lobula=size(Q,1);
n_KC=10*n_lobula;
V=rand(n_KC,n_lobula);
V=V>.95;
%V=.0001*V.*rand(size(V));
V=1*V.*ones(size(V)); % .7
%V=3*V.*rand(size(V));

TauE=10;
gEx=@(x) exp(-x./TauE);
tspike=1:10;
gE=gEx(tspike);

O=.2*rand(1,n_KC);
O=.75*ones(1,n_KC); % .3
%O=1*rand(1,n_KC);
O1=O;

lobulaNoise=.9975;
lobulaNoise=.9995;
%[VspikeKCx VspikeKCy VspikeMBONx VspikeMBONy]=MB_Learning(Q,W,V,O,x,y,winsize,Laminafiltersize,NFrames,PixelShift,posx,posy,gE);

Lobulaspikex=Lobula_response(double(MyImagex),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);
Lobulaspikey=Lobula_response(double(MyImagey),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

  S = rand(size(Lobulaspikex));Randomness=S>lobulaNoise;
 Lobulaspikex=Lobulaspikex+Randomness;
 
   S = rand(size(Lobulaspikey));Randomness=S>lobulaNoise;
 Lobulaspikey=Lobulaspikey+Randomness;
%VspikeKCx=KCacitivty(lobula_FiringRatex,V);
%VspikeKCy=KCacitivty(lobula_FiringRatey,V);

VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);

VspikeMBONx0=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy0=MBON_activity(VspikeKCy,O,gE);

for sampletest=1:10
[MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift);
MBON_before(beeind,sampletest)=MBONx-MBONy;
MBONx1(sampletest)=MBONx;
MBONy1(sampletest)=MBONy;
end

for k=1:100

  S = rand(size(Lobulaspikex));Randomness=S>lobulaNoise;
 Lobulaspikex=Lobulaspikex+Randomness;
 
   S = rand(size(Lobulaspikey));Randomness=S>lobulaNoise;
 Lobulaspikey=Lobulaspikey+Randomness; 
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

end