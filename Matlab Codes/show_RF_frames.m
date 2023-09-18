function show_RF_frames(Q,n,winsize,Laminafiltersize,NFrames)

windowsize=winsize/Laminafiltersize;
q=Q(n,:);

for k=1:NFrames
    
   rf1=reshape(q((k-1)*windowsize^2+1: k*windowsize^2),windowsize,windowsize);
    subplot(1,NFrames,k)
    imagesc(rf1);
    axis image
end
end





