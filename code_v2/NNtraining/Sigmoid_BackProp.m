function [dEdx] = Sigmoid_BackProp(dEdy,x)
%%%%%%%%%% Let's do it!!! %%%%%%%%%%%
%                                   %
%                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

d = Sigmoid_ForProp(x);
D = d.*(1-d);
dEdx = dEdy .* D;

end