function y = fnsigma(str,awal,akhir)
%str = '(5sigmam--2m)';
    y=0;
         
        en = str2num(akhir);
        st = str2num(awal);
        if(st>en)
            temp = st;
            st = en;
            en = temp;
        end
        stop = false;
        ii=1;
        ak = 1;
        while (ii<length(str) & ~stop)
            
            ii=ii+1;
            if (strcmp(str(ii),'+') | strcmp(str(ii),'*') )
                stop = true;
            end
            ak = ii;
        end
        y = mysigma(str(1:ak),st,en);
    
end