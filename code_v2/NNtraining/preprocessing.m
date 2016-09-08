clear all;
load ../training_data_phi.mat;
[r c] = size(T_train);
TT_train = zeros(r,22);
for i=1:r
    TT_train(i,T_train(i,1))= 1;
end
T_train = TT_train;
save training_data_NN.mat X_train Phi_train T_train;
