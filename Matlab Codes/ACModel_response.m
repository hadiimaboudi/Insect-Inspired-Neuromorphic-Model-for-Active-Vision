function [MBONx, MBONy]=ACModel_response(MyImagex,MyImagey,V,O,Q,W,gE,winsize,Laminafiltersize,NFrames,PixelShift)

% The response of the model to two stimli Myimagex and MyImage y

lobulaNoise=.9975;
lobulaNoise=.9995;

Lobulaspikex=Lobula_response(double(MyImagex),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);
Lobulaspikey=Lobula_response(double(MyImagey),Q,W,winsize,Laminafiltersize,NFrames,PixelShift);

  S = rand(size(Lobulaspikex));Randomness=S>lobulaNoise;
 Lobulaspikex=Lobulaspikex+Randomness;
 
   S = rand(size(Lobulaspikey));Randomness=S>lobulaNoise;
 Lobulaspikey=Lobulaspikey+Randomness;

VspikeKCx=KCacitivty_spike(Lobulaspikex,V,gE);
VspikeKCy=KCacitivty_spike(Lobulaspikey,V,gE);

 
VspikeMBONx=MBON_activity(VspikeKCx,O,gE);
VspikeMBONy=MBON_activity(VspikeKCy,O,gE);

MBONx=sum(VspikeMBONx);
MBONy=sum(VspikeMBONy);

end

 

