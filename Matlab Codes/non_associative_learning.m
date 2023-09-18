% Model of Active vision: A neuromorphic model of active vision shows spatio-temporal
% encoding in lobula neurons can aid pattern recognition in bees
% HaDi MaBouDi,
% University of Sheffield
% maboudi@gmail.com
% November 2023
%*****************************************************
% for work stemming from use of this code, please cite
% XXXX
%****************************************************

clear all;close all;clc

init2

rho= .001*ones(size(theta));
rho= .00010*ones(size(theta));
theta= 2+1*rand(size(theta));

m=1;
b=0;

Retina_Activity = @(x)(20./(1+exp(-(m*x+b))));

%  x=-3:.1:3;
%  plot(myimage,Retina_Activity(myimage),'o')

TauE=10;
gEx=@(x) exp(-x./TauE);
tspike=1:40;
gE=gEx(tspike);
TauI=10;
gIn=@(x) 10*exp(-x./TauI);
gI=gIn(tspike);


for t = 1:num_trials


        
        myimage=Xall(:,randi([1 samplesize]));
        myimage = myimage-mean(myimage);
        myimage = myimage/std(myimage);
        X= myimage;
        X = Retina_Activity(myimage);

    Vspike=activities_Lobula(X,Q,W,gE,gI);
    Y=sum(Vspike,2);
   
    S = rand(size(Y));
    S=S>.9;
    Randomness=1*S.*rand(size(Y));
    %Randomness=.5*randi([0 1],size(Y));
    Y=Y+Randomness;
	% compute statistics for this batch
    muy=mean(Y,2);          %average neuron activities
     %muy=muy+1*rand(size(muy));
    Cyy=Y*Y'/batch_size;	%activity correlation between neurons
    
%   % update lateral weights with Foldiak's rule: inhibition to maintain decorrelation
   %alpha=.1;
% dW = alpha*(Cyy - p^2); 
%    W= W + dW; 
%    W=W-diag(diag(W));       % zero out diagonal
%    W(find(W<0))=0;          % require lateral connections to inhibit
	

% % update lateral weights with iSTDP: inhibition to maintain decorrelation
 etaW=1e-6;
dW=etaW*(Y*Y'-Y*rho'); 
%dW=etaW*(Y*Y'-rho*Y'); 
%dW = alpha*(Cyy - p^2); 
   W= W + dW; 
   W=W-diag(diag(W));       % zero out diagonal
   W(find(W<0))=0;          % require lateral connections to inhibit
	
   
	% update feedforward weights with Oja's rule
	beta=1e-6;
%     square_act = sum((Y.*Y)');
% 	mymat = diag(square_act);
% 	dQ =  beta*Y*X'/batch_size - beta*mymat*Q/batch_size; 
%     Q=Q + dQ;
    
    
    %dQ2=Y*(X'-Y'*Q);
    dQ=OjaRule(Q,X,Y);
    Q=Q +beta*dQ;

	% update thresholds with Foldiak's rule: keep each neuron firing near target
	dtheta =  gamma*(sum(Y')'/batch_size - p); 
	% theta=theta + dtheta;  % %%%%%%% inactive 
    
    % compute moving averages of muy and Cyy
    Y_ave=(1-eta_ave)*Y_ave + eta_ave*muy;
    Cyy_ave=(1-eta_ave)*Cyy_ave + eta_ave*Cyy;
    
    % display network state and activity statistics every so often
	if mod(t,100)==0,																	
        figure(1)
        clf
		show_network(Y,Y_ave,W,Cyy_ave,Q);
        figure(2)
        showrfs(Q)
		t		
       
    if mod(t,50000) ==0,
        save current_net
    end    
    end
end

save final_network
