function [ subImgs ] = cut4rows( inp1 )
    im = inp1;
    % convert to BW
    bw = im2bw(im,0.4);
   
    [rows cols] = size(im); 
    horizontalProjection = sum(bw, 2);
    % threshold
    tr2 = 0.02 * cols;
    %figure; plot(horizontalProjection);
    i=1;
    ind =1;
    while( i < rows )
        if horizontalProjection(i) > tr2
            r1 = i;
            while(horizontalProjection(i) > tr2 & i<rows)
                i=i+1;
            end
            r2 = i;
            subImgs{ind} = im(r1:r2,:);
            ind =  ind +1;
        end
        i = i+1;
    end
end

