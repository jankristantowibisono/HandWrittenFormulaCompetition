function [newstr] = myexception(str)
    newstr = str;
    if strfind(str,'^')
        p =  strfind(str,'^');
        n = length(p);
        e = length(str);
        for i=1:n
            if (p(i)-3)>0 & (p(i)+2)<=e 
                if strcmp(str(p(i)-2),'/') & strcmp(str(p(i)+2),'*')
                    awal = max(1,i-3);
                    str = strcat('(',str(awal:p(i)+1),')',str(p(i)+2:end));
                end
            end
        end
    end
    newstr = str;
end