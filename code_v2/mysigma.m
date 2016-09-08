function [y] = mysigma(str,st,en)
    y = 0; 
    syms m
    fn = m;
    for i=1:length(str)
        if isstrprop(str(i), 'digit')
           num = str2num(str(i));
           fn = m^num;
        end
    end
    V = subs(fn, m, st:en);
    y = double(sum(V));
end
