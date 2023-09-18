function MyImage=take_patch_stimuli(I,winsize,NFrames,PixelShift,posx,posy,state)

if state==1
MyImage=[];
 for f=1:NFrames
                myimage= reshape( I(posx:posx+winsize-1,posy+(f-1)*PixelShift:posy+(f-1)*PixelShift+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
 end
           
elseif state==0
    MyImage=[];
 for f=1:NFrames
     ff=randi([1 5]);
                myimage= reshape( I(posx:posx+winsize-1,posy+(ff-1)*PixelShift:posy+(ff-1)*PixelShift+winsize-1),[winsize^2 1]);
                MyImage=[MyImage; myimage];
 end

end

