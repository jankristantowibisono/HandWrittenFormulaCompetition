function [y] = Softmax_ForProp(x)
%%%%%%%%%% Let's do it!!! %%%%%%%%%%%
%                                   %
%                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = exp(x);
y = y / sum(y);

end