function [ im ] = add_padding( im )
    %% add padding 
    [r c] = size(im);
    %widther
    if (c > r)
        dif = c-r; 
        additional = zeros(dif / 2,c); 
        im = [additional;im;additional];  
    end
    if (r > c)
        dif = r-c; 
        additional = zeros(r,dif / 2); 
        im = [additional im additional];
    end

end

