function O=STDPrule_Laurent(O,VspikeKC,VspikeMBON,reward)


SynapThreshold=.65;
n_KC=size(VspikeKC,1);
n_MBON=1;

DT=20;

% d1=.006; % no reward
% d2=.006; % no reward
% 
% d3=0.005; % reward
% d4=0.005; % reward




%  d1=.0015; % no reward
%  d2=.0015; % no reward
% % 
%  d3=.001; % reward
%  d4=.001; % reward


 d1=.002; % no reward
 d2=.002; % no reward
 
 d3=0.0015; % reward
 d4=0.0015; % reward
 
 
%   d1=.0031; % no reward
%  d2=.0031; % no reward
%  
%  d3=0.0025; % reward
%  d4=0.0025; % reward
%  
%  
  d1=.002; % no reward
  d2=.002; % no reward
% % 
  d3=.0017; % reward
  d4=.0017; % reward

%   d1=.002; % no reward
%   d2=.002; % no reward
% % % 
%   d3=0.85*d1; % reward
%   d4=0.85*d1; % reward
%   %d3=1*d1; % reward
%   %d4=1*d1; % reward
%   
 
  
  d1=.003; % no reward   %%%%%%%%%%%%%%%
  d2=.003; % no reward
%  
  d3=0.003; % reward
  d4=0.003; % reward 


 

if reward==1
    
      for t=1:size(VspikeKC,2)-(DT+1)    %t>20 for STDP on, t>runtime for STDP off
      for j=1:n_MBON

        if VspikeMBON(j,t)==1   %neuron j fired at time t %  postneurons   

          for x=1:DT     %range of ms over which synaptic strengthening and weakening occur                           
              for k=1:n_KC       % neuron KC             
                if VspikeKC(k,t+x)==1  % find out which neurons fired in the previous 20 ms              
                  % synaptic weight of pair undergoes larger increment if dT is smaller and negative
                 % O(j,k)=O(j,k).*(1+(d2*0.9*exp(x/20.0))); 
                  % synaptic weight of pair undergoes larger decrement is dT is smaller and positive
                 % O(j,k)=O(j,k).*(1+d2*(-1*exp(-x/20.0))); 
                  O(j,k)=O(j,k)+d3*(-1*exp(x/20)); 
                  % set a maximum value for synaptic weights
                  if O(j,k)>SynapThreshold    
                      O(j,k)=SynapThreshold;
                  end
                  if O(j,k)<-SynapThreshold 
                     O(j,k)=-SynapThreshold ;
                  end
                end
              end
          end
        end
      end
      end

  
 for t=(DT+1):size(VspikeKC,2)     %t>20 for STDP on, t>runtime for STDP off
      for j=1:n_MBON
     
        if VspikeMBON(j,t)==1   %neuron j fired at time t %  postneurons   

          for x=1:DT     %range of ms over which synaptic strengthening and weakening occur                           
              for k=1:n_KC       % neuron KC             
                if VspikeKC(k,t-x)==1  % find out which neurons fired in the previous 20 ms              
                  % synaptic weight of pair undergoes larger increment if dT is smaller and negative
                 % O(j,k)=O(j,k).*(1+(d1*1*exp(x/20.0))); 
                  %O(j,k)=O(j,k)+(d1*exp(x/20.0)); 
                  O(j,k)=O(j,k)+d4*(-1*exp(-x/20)); 
                  % synaptic weight of pair undergoes larger decrement is dT is smaller and positive
                  %O(j,k)=O(j,k).*(1+d1*(-0.925*exp(-x/20.0))); 
                  % set a maximum value for synaptic weights
                  if O(j,k)>SynapThreshold     
                     O(j,k)=SynapThreshold ;
                  end
                  if O(j,k)<-SynapThreshold 
                      O(j,k)=-SynapThreshold;
                  end
                
                end
              end
          end
        end
      end
 end
 
 
else
     

  for t=1:size(VspikeKC,2)-(DT+1)    %t>20 for STDP on, t>runtime for STDP off
      for j=1:n_MBON

        if VspikeMBON(j,t)==1   %neuron j fired at time t %  postneurons   

          for x=1:DT     %range of ms over which synaptic strengthening and weakening occur                           
              for k=1:n_KC       % neuron KC             
                if VspikeKC(k,t+x)==1  % find out which neurons fired in the previous 20 ms              
                  % synaptic weight of pair undergoes larger increment if dT is smaller and negative
                 % O(j,k)=O(j,k).*(1+(d2*0.9*exp(x/20.0))); 
                  % synaptic weight of pair undergoes larger decrement is dT is smaller and positive
                 % O(j,k)=O(j,k).*(1+d2*(-1*exp(-x/20.0))); 
                  O(j,k)=O(j,k)+d2*(-1*exp(-x/20)); 
                  % set a maximum value for synaptic weights
                  if O(j,k)>SynapThreshold    
                      O(j,k)=SynapThreshold;
                  end
                  if O(j,k)<-SynapThreshold
                     O(j,k)=-SynapThreshold;
                  end
                end
              end
          end
        end
      end
  end
  
  
 for t=(DT+1):size(VspikeKC,2)     %t>20 for STDP on, t>runtime for STDP off
      for j=1:n_MBON
     
        if VspikeMBON(j,t)==1   %neuron j fired at time t %  postneurons   

          for x=1:DT     %range of ms over which synaptic strengthening and weakening occur                           
              for k=1:n_KC       % neuron KC             
                if VspikeKC(k,t-x)==1  % find out which neurons fired in the previous 20 ms              
                  % synaptic weight of pair undergoes larger increment if dT is smaller and negative
                 % O(j,k)=O(j,k).*(1+(d1*1*exp(x/20.0))); 
                  O(j,k)=O(j,k)+d1*(1*exp(x/20)); 
                  % synaptic weight of pair undergoes larger decrement is dT is smaller and positive
                  %O(j,k)=O(j,k).*(1+d1*(-0.925*exp(-x/20.0))); 
                  % set a maximum value for synaptic weights
                  if O(j,k)>SynapThreshold    
                     O(j,k)=SynapThreshold;
                  end
                  if O(j,k)<-SynapThreshold
                     O(j,k)=-SynapThreshold;
                  end
                
                end
              end
          end
        end
      end
 end
end
