function [ valid_str ] = validate_symbol( str,str_before,ori,ori_before,average_size )
    valid_str = str;
    % fraction vs subtract
    if strcmp(str,'/')
        [r c] = size(ori);
        if (r*c) < 800
           valid_str = '-' ;
        end
    end
    % power (ie: 9^2)
    if isstrprop(str, 'digit') == 1 & isstrprop(str_before, 'digit') == 1
        if str2num(str) ~= 1
            [r c] = size(ori);
            [rr cc] = size(ori_before);
            if (r*c) < 0.6*average_size | (r*c) < 0.6*(rr*cc)
               valid_str = strcat('^',str);
            end
        end
    end
    % remove =
    if strcmp(str,'=')
        valid_str = '';
    end

end

