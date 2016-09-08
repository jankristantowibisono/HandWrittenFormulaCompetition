function [dEdx,dEdW,dEdb] = InnerProduct_BackProp(dEdy,x,W,b)
%%%%%%%%%% Let's do it!!! %%%%%%%%%%%
%                                   %
%                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = W;
B = x';
C = 1;
dEdx = A * dEdy;
dEdW = (dEdy * B)';
dEdb = (dEdy * C);

end