function [ X_test,T_test] = preprocessing_formulas( formula_path,level,r,c)
%PREPROCESSING_FORMULAS 
%   Transform image formulas to matrix
level_path = strcat('level_',num2str(level));
% 240*1030
features = zeros(1,r*c);
    for j=1:30
        RGB = imread(strcat(formula_path,level_path,'/valid_',num2str(j),'.png'));
        im = rgb2gray(RGB);
        im = imresize(im,[r,c]);
        %im = imresize(im,0.5);
        f = reshape(im,[1,r*c]);
        features = [features;f];
    end
    T_path = strcat(formula_path,level_path,'/T_valid.mat');
    load(T_path);
    X_test = features(2:end,:);
    T_test = T_valid;
end

