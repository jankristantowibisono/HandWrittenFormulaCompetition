clear all;
close all;
clc;
%% init
init; % init path & notations
load testing_data_all.mat; %load testing formula
%load modelCRbf.mat;%load model 
load modelVRbf.mat;
load NNmodel.mat;
mode = 'SVM';
mod = modelVRbf;
% size of formula image
r = 240;
c = 1030;
%% start here
s = 1;
m = 150;
Y_test = zeros(m,1);
pr = zeros(m,1);
for i =s:m
    formula = reshape(X_test(i,:),[r c]);
    %figure; imshow(formula);
    [subimgs subfits] = interpreter(formula); % detection & segmentation
    str = to_formula(subimgs,subfits,mod,notations2,mode); % evaluation formula
    Y_test(i) = evaluate(str); % eval 
    pr(i) = (Y_test(i)==T_test(i));
end
length(Y_test(T_test==Y_test))
acc = length(Y_test(T_test==Y_test))/m
save Y_test.mat Y_test;
%pr'



