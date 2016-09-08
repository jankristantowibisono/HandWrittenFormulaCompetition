function [ imo,bwo,imc,bwc ] = extract_first( im,bw )
        CC = bwconncomp(bw);
        %numPixels = cellfun(@numel,CC.PixelIdxList);
        %[biggest,idx] = max(numPixels);
        imc = im;
        bwc = bw;
        imc(CC.PixelIdxList{1}) = 0;
        bwc(CC.PixelIdxList{1}) = 0;
        [ rr cc] = size(im);
        imo = zeros(rr,cc);
        bwo = zeros(rr,cc);
        imo(CC.PixelIdxList{1}) = 255;
        bwo(CC.PixelIdxList{1}) = 1;
        se = strel('disk',1);
        bwc = imclose(bwc,se);
        imc = imclose(imc,se);
        %figure, imshow(closeBW)  
        %imo = imsubtract(im,imc);
        %bwo = imsubtract(bw,bwc);
end

