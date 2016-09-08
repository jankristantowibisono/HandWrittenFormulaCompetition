function [ subImgs ] = cut2cll( inp1 )
    % convert to binary image
    im = inp1;
    bw = im2bw(im,0.4);
    % find connected component
    CC = bwconncomp(bw);
    
    %if CC.NumObjects == 1 
        subImgs{1} = im;
    %end
    
    % check if there are more than 2 objects 
    if CC.NumObjects > 1
        imc = im;
        bwc = bw;
        n = 1;
        while CC.NumObjects > 1
            [ imo,bwo,ims,bws ] = extract_first( imc,bwc );
            imc = ims;
            bwc = bws;
            subImgs{n} = imo;
            n = n+1;
            CC = bwconncomp(bws);
        end
        subImgs{n} = ims;
    end
end

