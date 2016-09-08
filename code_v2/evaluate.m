function [ y ] = evaluate( str )
    nstr = myexception(str);
    try
        y = eval(nstr);
    catch
        warning('Problem using function.');
        y = 0;
    end
end

