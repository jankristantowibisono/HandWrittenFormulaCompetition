function [subImg,subImg_bw] = fit_size(im)
    bw = im2bw(im,0.4);
    %figure; imshow(bw);
    [rows cols]= size(im);
    
    
    subImg = im;
    subImg_bw = bw;
    i=1;
    ind =1;
    tr1 = 0.01 * rows;
    horizontalProjection = sum(bw, 1);
    %figure; plot(horizontalProjection);
    while( i < cols )
        if horizontalProjection(i) > tr1
            c1 = i;
            while(horizontalProjection(i) > tr1 & i < cols)
                i=i+1;
            end
            c2 = i;
            %c1 = max(c1,1);
            subImg = im(:,c1:c2);
            subImg_bw = bw(:,c1:c2);
        end
        i = i+1;
    end
%     
    verticalProjection = sum(subImg_bw, 2);
    %figure;plot(verticalProjection);
    [rows2 cols2]= size(subImg);
    tr2 = 0.01 * cols2;
    j=1;
    while( j < rows2 )
        if verticalProjection(j) > tr2
            r1 = j;
            while(verticalProjection(j) > tr2 & j < rows2)
                j=j+1;
            end
            r2 = j;
            %r1 = max(r1-1,1);
            %r2 = min(r2+1,rows2);
            subImg = subImg(r1:r2,:);      
            subImg_bw = subImg_bw(r1:r2,:);
 
        end
        j = j+1;
    end
end
    %figure;imshow(subImg);


