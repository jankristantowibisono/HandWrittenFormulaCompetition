function [dEdx] = Rectified_BackProp(dEdy,x)
%%%%%%%%%% Let's do it!!! %%%%%%%%%%%
%                                   %
%                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

E = (x > 0);
dEdx = dEdy .* E;

end