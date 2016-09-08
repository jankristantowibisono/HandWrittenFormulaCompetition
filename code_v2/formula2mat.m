%% convert testing data to mat format
clear all;
close all;
clc;
%% init
init;
level = 5; 
% size of formula image
r = 240;
c = 1030;
[ X_test,T_test] = preprocessing_formulas( formula_path,level,r,c);
save testing_data_level5.mat X_test T_test;