% initialize parameters


fprintf('Here we go in define initial values _/) \n');

clear all

% the whitened image array
load IMAGES

%general params
batch_size =1;     % 100  
samplesize=50000;
num_trials =40000;   % 25000



%input data

BUFF=10;

% number of inputs\
resize_value=1;

winsize=16; %image size
Laminafiltersize=1;

NFrames=1; % number of frame sampling 
PixelShift=15; % Shift pixels between frames (it should be some common interval between selected frames). 

patchsize=winsize;

Movment_sign=0; % 0 for left to right; 1 for right to letf; 2 for both sides of horizontal scanning; 3 for top to below scaning; 4 for all horizontal and vertical scanning 

% check the defined parameters. 
% if (NFrames*PixelShift+winsize) > imsize
%     fprintf('ERROR: the sampling parameters is out of the image size');
% end

%Xall = sampleimages_move_olshausen(IMAGES,samplesize, winsize,PixelShift,NFrames);
Xall = sampleimages_move(samplesize, winsize,PixelShift,NFrames);
%nsamnples=10
%Xall =samplepatches_allDirec(IMAGES,num_trials,sz,Nframe,shift_pixel,Movment_sign);

N=NFrames*(winsize/Laminafiltersize)^2;

% number of outputs
OC =1 ;		%overcompleteness of neurons wrt pixels
M=OC*N;
M=50;

% target output firing rate; spikes per neuron per image
p=0.05;

% Initialize network parameters 
%feedforward weights Q
%horizontal connections W
%thresholds theta

Q=randn(M,N);
Q=diag(1./sqrt(sum(Q.*Q,2)))*Q;
W=zeros(M);
theta=2*ones(M,1);


% learning rates
alpha=1;
beta=0.01;
gamma=0.1;

% rate parameter for computing moving averages to get activity stats
eta_ave=0.3;

% initialize average activity stats
Y_ave=p;
Cyy_ave=p^2;

fprintf('Here we go to train the network _/) \n');