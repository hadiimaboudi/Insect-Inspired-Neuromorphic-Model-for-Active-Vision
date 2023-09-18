% HaDi MaBouDi, University of Sheffield 2020
% h.maboudi@sheffield.ac.uk
% activities.m - Simulate LIF neurons to get spike counts
% function Vspike=activities(X,Q,W,gE,gI)
% X:        input spike train 
% Q:        feedforward weights
% W:        horizontal weights
% gI&gE     synaptic conductance changes
% Y:        outputs
%*****************************************************
% for work stemming from use of this code, please cite
% MaBouDi el al., "Active vison model ",
%****************************************************

function Vspike=activities_Lobula(X,Q,W,gE,gI)

TauM=10;
R=10;
Vth=0; % threshold
Vi=-80;


% size of data array
[N batch_size]=size(X);
sz=sqrt(N);

% number of outputs
M=size(Q,1);

% number iterations
num_iterations=100;

% rate parameter for numerical integration
eta=0.1;

%Q=2*Q;

B=.1*Q*X;% B- W*as

% projections of lamina onto lobula using weights Q
inputLobula=[];
for lobul=1:size(Q,1)
    outLamina=zeros(1,size(X,2));
for lamin=1:size(X,1)
outLamina=outLamina+Q(lobul,lamin)*conv(X(lamin,:),gE,'same');
end
inputLobula(lobul,:)=outLamina;
end


spike_iterations=size(X,2);
spike_iterations=100;
Vspike=zeros(M,spike_iterations);
Inhinit=zeros(M,spike_iterations+length(gI)+1);

U=Vi*ones(M,spike_iterations);

for t=2:spike_iterations

   % Inp=inputLobula(:,t)-Inhinit(:,t); % input into  U
    Inp=B-Inhinit(:,t-1); % input into  U
    U(:,t)=U(:,t-1)+(1/TauM)*(-U(:,t-1)+R*Inp); % diffeq for U
    Vspike(:,t)=(U(:,t)> (Vth*ones(M,1))); % spike detection
    U(U(:,t)> Vth*ones(M,1),t)=Vi; 	%if you spiked, start back at resting potential
    U(U(:,t)< Vi,t)=Vi; 	%if you spiked, start back at resting potential
    Inhinit(:,t:t+length(gI)-1)=Inhinit(:,t:t+length(gI)-1)+1*W*(Vspike(:,t))*gI;
end

end

