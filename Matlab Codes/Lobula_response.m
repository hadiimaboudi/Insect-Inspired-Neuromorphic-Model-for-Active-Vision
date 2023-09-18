function  Lobulaspike=Lobula_response(myimage,Q,W,winsize,Laminafiltersize,NFrames,PixelShif)


Retina_Activity = @(x)(2./(1+exp(-(m*x+b)))-1);

%  x=-3:.1:3; 

%  plot(myimage,Retina_Activity(myimage),'o')

TauE=10;
gEx=@(x) exp(-x./TauE);
tspike=1:20;
gE=gEx(tspike);
TauI=10;
gIn=@(x) 10*exp(-x./TauI);
gI=gIn(tspike);

        myimage = myimage-mean(myimage);
        myimage = myimage/std(myimage);
            
         % X_retina=Retina_Activity(myimage);
%X(:,i)=Retina_Activity(myimage);
  X=Lamina_Activity_nonSpike(myimage,winsize,NFrames,Laminafiltersize);
      Vspike=activities_Lobula(30*X,Q,W,gE,gI);

%    S = rand(size(Vspike));
%     Randomness=S>.985;
% %  
%  Lobulaspike=Vspike+Randomness;
%  Lobulaspike=Lobulaspike>0;
%   

   Lobulaspike=Vspike;
    
   % lobula_FiringRate=sum(Lobulaspike,2);
end
