function H=hog(Im)
c_win=3;
r_win=3;
B=9;
[L,C]=size(Im); 
H=zeros(c_win*r_win*B,1); 
m=sqrt(L/2);
if C==1 
    Im=im_recover(Im,m,2*m);
    L=2*m;
    C=m;
end
Im=double(Im);
step_x=floor(C/(c_win+1));
step_y=floor(L/(r_win+1));
cont=0;
hx = [-1,0,1];
hy = -hx';
grad_xr = imfilter(double(Im),hx);
grad_yu = imfilter(double(Im),hy);
angles=atan2(grad_yu,grad_xr);
magnit=((grad_yu.^2)+(grad_xr.^2)).^.5;
for n=0:r_win-1
    for m=0:c_win-1
        cont=cont+1;
        angles2=angles(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x); 
        magnit2=magnit(n*step_y+1:(n+2)*step_y,m*step_x+1:(m+2)*step_x);
        a_g=angles2(:);    
        v_m=magnit2(:);
        K=max(size(a_g));
        
        bin=0;
        H2=zeros(B,1);
        for ang_lim=-pi+2*pi/B:2*pi/B:pi
            bin=bin+1;
            for k=1:K
                if a_g(k)<ang_lim
                    a_g(k)=100;
                    H2(bin)=H2(bin)+v_m(k);
                end
            end
        end
                
        H2=H2/(norm(H2)+0.01);        
        H((cont-1)*B+1:cont*B,1)=H2;
    end
end
H = H';
