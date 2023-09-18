function Vspike=MBON_activity(VspikeKC,O,gE)

TauM=10;
R=10;
Vth=0; % threshold
Vi=-80;

outKC=zeros(1,size(VspikeKC,2));
for kc=1:size(VspikeKC,1)
outKC=outKC+O(1,kc)*conv(VspikeKC(kc,:),gE,'same');
end

M=1;

spike_iterations=100;
Vspike=zeros(M,spike_iterations);

U=Vi*ones(M,spike_iterations);

for t=2:spike_iterations

   % Inp=inputLobula(:,t)-Inhinit(:,t); % input into  U
    %Inp=B-Inhinit(:,t-1); % input into  U
    U(:,t)=U(:,t-1)+(1/TauM)*(-U(:,t-1)+R*outKC(t)); % diffeq for U
    Vspike(:,t)=(U(:,t)> (Vth*ones(M,1))); % spike detection
    U(U(:,t)> Vth*ones(M,1),t)=Vi; 	%if you spiked, start back at resting potential
    U(U(:,t)< Vi,t)=Vi; 	%if you spiked, start back at resting potential
    %Inhinit(:,t:t+length(gI)-1)=Inhinit(:,t:t+length(gI)-1)+1*W*(Vspike(:,t))*gI;
end

noise=rand(size(Vspike));
noise=noise>.98;
Vspike=Vspike+noise;
Vspike=Vspike>0;
end




