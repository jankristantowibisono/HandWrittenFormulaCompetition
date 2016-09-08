function [ subimgs ] = transform_format( subimgs4 )

    n1 = length(subimgs4);
    ind = 1;
    for i=1:n1
        n2 = length(subimgs4{1,i});
        for j=1:n2 
            n3 = length(subimgs4{1,i}{1,j});
            for k=1:n3
                img = subimgs4{1,i}{1,j}{1,k}{1,1};
                [r c] = size(img);
                if (r*c) > 100
                    subimgs{ind} = img;
                    ind = ind +1;
                end
                
            end
        end
    end


end

