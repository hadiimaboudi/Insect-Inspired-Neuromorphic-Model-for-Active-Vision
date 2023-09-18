function Vspike=KCacitivty_spike(Lobula_Spike,V,gE)

TauM=10;
R=10;
Vth=0; % threshold
Vi=-80;


inputKC=[];
for lobul=1:size(V,1)
    outLob=zeros(1,size(Lobula_Spike,2));
for la=1:size(Lobula_Spike,1)
outLob=outLob+V(lobul,la)*conv(Lobula_Spike(la,:),gE,'same');
end
inputLobula(lobul,:)=outLob;
end


M=size(inputLobula,1);

spike_iterations=100;
Vspike=zeros(M,spike_iterations);

U=Vi*ones(M,spike_iterations);

for t=2:spike_iterations

   % Inp=inputLobula(:,t)-Inhinit(:,t); % input into  U
    %Inp=B-Inhinit(:,t-1); % input into  U
    U(:,t)=U(:,t-1)+(1/TauM)*(-U(:,t-1)+R*inputLobula(:,t-1)); % diffeq for U
    Vspike(:,t)=(U(:,t)> (Vth*ones(M,1))); % spike detection
    U(U(:,t)> Vth*ones(M,1),t)=Vi; 	%if you spiked, start back at resting potential
    U(U(:,t)< Vi,t)=Vi; 	%if you spiked, start back at resting potential
    %Inhinit(:,t:t+length(gI)-1)=Inhinit(:,t:t+length(gI)-1)+1*W*(Vspike(:,t))*gI;
end

noise=rand(size(Vspike));
noise=noise>.99; %new
Vspike=Vspike+noise;
Vspike=Vspike>0;


end