clear all;
close all;
clc;
%% init
init; % init path & notations
%level = 3; %level
load testing_data_level5.mat; %load testing formula
%load model 
load modelVRbf.mat;
load modelCRbf.mat;
load NNmodel.mat;
% mode 
mode = 'SVM'; % NN SVM
mod = modelVRbf; %modelVRbf %NNmodel %modelCRbf
% size of formula image
r = 240;
c = 1030;

%% start here
s = 1;
m = 30;
y = zeros(m,1);
pr = zeros(m,1);
for i =s:m
    formula = reshape(X_test(i,:),[r c]);
    %figure; imshow(formula);
    [subimgs subfits] = interpreter(formula); % detection & segmentation
    %save_sub_imgs(subimgs,level,i);
    str = to_formula(subimgs,subfits,mod,notations2,mode); % evaluation formula
    y(i) = evaluate(str); % eval 
    pr(i) = (y(i)==T_test(i));
end
length(y(T_test==y))
acc = length(y(T_test==y))/m
%pr'