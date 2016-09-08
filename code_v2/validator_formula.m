function [ stro ] = validator_formula( inp )
    str = inp;
    %remove operator in the end
    n = length(str);
    while(strcmp(str(n),'+') | strcmp(str(n),'-') | ...
            strcmp(str(n),'*') | strcmp(str(n),'=') | strcmp(str(n),'/'))
        str = str(1:n-1);
        n = length(str);
    end
    % sqrt
    if (strfind(str,'sqrt'))
        x = strfind(str,'sqrt');
        
        ii = x+3;
        angka = '';
        while (~(isstrprop(str(ii), 'digit')) & ii<length(str))
            
            ii=ii+1;
        end
        angka = strcat(angka,str(ii));
        en = min(length(str),ii+2);
        awal = max(x+3,1);
        
        newstr = strcat(str(1:awal),'(',angka,')',str(en:end));
        str = newstr;
    end
    % sigma 
    if (strfind(str,'sigma'))
        x = strfind(str,'sigma');
        after = false;
        %find prev digit before sigma
        ii = x-1;
        akhir = '';
        while ii>0 & (isstrprop(str(ii), 'digit'))
            akhir = strcat(akhir,str(ii));
            ii=ii-1;
        end
        a_i = ii-1;
        %find the next operat
        ii = x+4;
        awal = '';
        stop = false;
        while (ii<length(str) & ~stop)
            if isstrprop(str(ii), 'digit')
                awal = strcat(awal,str(ii));
            end
            ii=ii+1;
            if (strcmp(str(ii),'+') | strcmp(str(ii),'*')| length(awal) > 2 )
                stop = true;
            end
        end
        if isempty(awal)
            awal = '0';
        end
        if isempty(akhir)
            akhir = '3';
        end
        y = fnsigma(str(ii-1:end),awal,akhir);
        if( ii == length(str))
            newstr = strcat(str(1:a_i),num2str(y));
        else
            newstr = strcat(str(1:a_i),num2str(y),str(ii:end));
        end
        str = newstr;
    end
    % product
    if (strfind(str,'prod'))
        xx = strfind(str,'prod');
        for count=1:length(xx)
            xx = strfind(str,'prod');
        if(isempty(xx))
            x = xx(1);
        if x+5 < length(str) | x+4 < length(str)
            if strcmp(str(x+4),'m') | strcmp(str(x+4),'n') | ...
                strcmp(str(x+5),'m') | strcmp(str(x+5),'n') 
            after = false;
            %find prev digit before sigma
            ii = x-1;
            akhir = '';
            while ii>0 & (isstrprop(str(ii), 'digit'))
                akhir = strcat(akhir,str(ii));
                ii=ii-1;
            end
            a_i = ii-1;
            %find the next operat
            ii = x+4;
            awal = '';
            stop = false;
            while (ii<length(str) & ~stop)
                if isstrprop(str(ii), 'digit')
                    awal = strcat(awal,str(ii));
                end
                ii=ii+1;
                if (strcmp(str(ii),'+') | strcmp(str(ii),'*')| length(awal) > 2 )
                    stop = true;
                end
            end
            if ~isempty(awal)
                if(strcmp(awal(1),'0'))
                awal = awal(1);
                end
            end
            if isempty(awal)
                awal = '1';
            end
            if isempty(akhir)
                akhir = '3';
            end
            y = fnprod(str(ii-1:end),awal,akhir);
            if( ii == length(str))
                newstr = strcat(str(1:a_i),num2str(y));
            else
                newstr = strcat(str(1:a_i),num2str(y),str(ii:end));
            end
            else 
                newstr = str;
            
            end
        else 
            newstr = strcat(str(1:x-1),'^',str(x+4:end));
        end
        else
            newstr = str;
        end
        str = newstr;
        end
    end
    
    % exception
    n = length(str);
    for i=1:n-1
        if strcmp(str(i),'*') & strcmp(str(i+1),'^')
             str = strcat(str(1:i-1),str(i+1:n));
        end
    end
    
    % force remove ( and )
    if length(strfind(str,'(')) ~= length(strfind(str,')'))
        str=strrep(str,'(','');
        str=strrep(str,')','');
    end
    stro = str;
end

