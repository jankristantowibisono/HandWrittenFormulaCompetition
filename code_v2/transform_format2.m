function [ subimgs ] = transform_format2( subs2 )

    n1 = length(subs2);
    ind = 1;
    for i=1:n1
        n2 = length(subs2{1,i});
        for j=1:n2     
            img = subs2{1,i}{1,j};
            [r c] = size(img);
            if (r*c) > 100
                subimgs{ind} = img;
                ind = ind +1;
            end
        end
    end
end

