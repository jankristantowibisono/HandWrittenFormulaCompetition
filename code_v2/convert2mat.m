%%convert all training data to mat format
clear all;
close all;
clc;
init;
level = 5; % upto level 5 symbols (all symbols)
% size of formula image (forc)
r = 240;
c = 1030;
[ X_train,T_train ] = preprocessing_training_data(notation_path,notations,level );
save training_data.mat X_train T_train;