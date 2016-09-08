function [ subImgs_l ] = cut4cols( inp1 )
    im = inp1;
    [r c] = size(im);
    subImgs_l{1} = im;
    % remove edge
    marginR = 0.01 * r;
    marginC = 0.01 * c;
    im = im(marginR:r-marginR,marginC:c-marginC);
    % convert to BW
    bw = im2bw(im,0.4);
   
    [rows cols] = size(im); 
    verticalProjection = sum(bw, 1);
    % threshold
    tr1 = 0.02 * rows;
    %figure; plot(verticalProjection);
    [rows cols] = size(im);
    i=1;
    ind =1;
    while( i < cols )
        if verticalProjection(i) > tr1
            c1 = i;
            while(verticalProjection(i) > tr1 & i< cols)
                i=i+1;
            end
            c2 = i;
            subImgs_l{ind} = im(:,c1:c2);
            ind =  ind +1;
        end
        i = i+1;
    end
end

