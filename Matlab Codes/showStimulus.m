function showStimulus(x,winsize,NFrames)

figure
for k=1:NFrames
    x1=reshape(x((k-1)*winsize^2+1: k*winsize^2),winsize,winsize);
    subplot(1,NFrames,k)
    imagesc(x1);
    axis image 
  colormap('gray')
end
end
