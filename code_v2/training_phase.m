close all;
clc;

% loading the data
load training_data.mat;
% Generate new features.
Phi_train = generateNewFeatures(X_train,100,100);
%% SVM LIB Training. Radial basis function V-SVM 
% options = '-s 1 -t 2 -nu 0.06';
% modelVRbf = libsvmtrain(T_train, Phi_train, options);
% libsvmpredict(T_train, Phi_train, modelVRbf);
% save modelVRbf.mat modelVRbf;

%% C-SVMRadial basis function
options = '-s 0 -t 2 -c 10';
modelCRbf = libsvmtrain(T_train, Phi_train, options);
libsvmpredict(T_train, Phi_train, modelCRbf);
save training_data_phi.mat X_train Phi_train T_train;
save modelCRbf.mat modelCRbf;