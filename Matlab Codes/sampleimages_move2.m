function X = sampleimages_move2(samples, winsize,PixelShift,NFrames);

% gathers patches from the grey-scale images, no preprocessing done yet
%
% INPUT variables:
% samples            total number of patches to take
% winsize            patch width in pixels
%
% OUTPUT variables:
% X                  the image patches as column vectors

%IMPORTANT: IMAGE DATA IS SUPPOSED TO BE IN DIRECTORY ./DATA/
%CHANGE THIS ON LINE 34 IF YOU HAVE MOVED THE DATA ELSEWHERE
  
%----------------------------------------------------------------------
% Gather rectangular image patches
%----------------------------------------------------------------------
BUFF=10;
% We have a total of 13 images.
dataNum = 100;
Shift=PixelShift*NFrames+1;
getsample = floor(samples/dataNum); %% This is how many patches to take per image

sampleNum=1; 

for i=(1:dataNum)
    
    % Even things out (take enough from last image)
    if i==dataNum, getsample = samples-sampleNum+1; end
    
    if (i>3 && i<10)
         I = imread(['ImageFlowers/','image_' num2str(i) '.jpeg']);
    else
    %imageNumber=randi([1 dataNum]);
    I = imread(['ImageFlowers/','image_' num2str(i) '.jpg']);
    end
    
    % Transform to double precision
    %I = double(I);
    I=I(:,:,2);
    %I = imresize(I,2);
    I = double(I);
    
    % Normalize to zero mean and unit variance (optional)
    I = I-mean(mean(I));
    I = I/sqrt(mean(mean(I.^2)));
    
    sizex = size(I,1);
    sizey = size(I,2);
    
    for k=1:getsample
        
        %posx=BUFF+ceil((sizex-winsize-Shift-2*BUFF)*rand);
        %posy=BUFF+ceil((sizey-winsize-Shift-2*BUFF)*rand);
        
        RandMovi=randi([1 6]);
        
         MyImage=[];
        if RandMovi==1
            
        posx=BUFF+ceil((sizex-winsize-2*BUFF)*rand);
        posy=BUFF+ceil((sizey-winsize-Shift-2*BUFF)*rand);
        
            for f=1:NFrames
                myimage= reshape( I(posx:posx+winsize-1,posy+(f-1)*PixelShift:posy+(f-1)*PixelShift+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
            end
            
        elseif RandMovi==2
            
        posx=BUFF+ceil((sizex-winsize-Shift-2*BUFF)*rand);
        posy=BUFF+ceil((sizey-winsize-2*BUFF)*rand);
        
            for f=1:NFrames
                myimage= reshape( I(posx+(f-1)*PixelShift:posx+(f-1)*PixelShift+winsize-1,posy:posy+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
            end
            
        elseif RandMovi==3
            
        posx=BUFF+ceil((sizex-winsize-Shift-2*BUFF)*rand);
        posy=BUFF+ceil((sizey-winsize-Shift-2*BUFF)*rand);
        
            for f=1:NFrames
                myimage= reshape( I(posx+(f-1)*PixelShift:posx+(f-1)*PixelShift+winsize-1,...
                    posy+(f-1)*PixelShift:posy+(f-1)*PixelShift+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
            end
            
        elseif RandMovi==4
            
        posx=BUFF+ceil((sizex-winsize-2*BUFF)*rand);
        posy=BUFF+Shift+ceil((sizey-winsize-2*Shift-2*BUFF)*rand);
        
            for f=1:NFrames
                myimage= reshape( I(posx:posx+winsize-1,...
                                    posy-(f-1)*PixelShift:posy-(f-1)*PixelShift+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
            end
            
            
        elseif RandMovi==5
            
            posx=BUFF+Shift+ceil((sizex-winsize-2*Shift-2*BUFF)*rand);
            posy=BUFF+ceil((sizey-winsize-2*BUFF)*rand);
        
            for f=1:NFrames
                myimage= reshape( I(posx-(f-1)*PixelShift:posx-(f-1)*PixelShift+winsize-1,...
                                    posy:posy+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
            end
            
        elseif RandMovi==6
              posx=BUFF+Shift+ceil((sizex-winsize-2*Shift-2*BUFF)*rand);
              posy=BUFF+Shift+ceil((sizey-winsize-2*Shift-2*BUFF)*rand);
        
            for f=1:NFrames
                myimage= reshape( I(posx-(f-1)*PixelShift:posx-(f-1)*PixelShift+winsize-1,...
                                    posy-(f-1)*PixelShift:posy-(f-1)*PixelShift+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
            end
            
            
        end
    X(:,sampleNum)= MyImage;
    sampleNum=sampleNum+1;
    end
    
end
end


        
    
