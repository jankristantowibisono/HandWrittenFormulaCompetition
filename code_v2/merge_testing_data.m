clear all;
close all;
clc;
load testing_data_level1.mat;
X_Test_all = X_test;
T_Test_all = T_test;
load testing_data_level2.mat;
X_Test_all = [X_Test_all;X_test];
T_Test_all = [T_Test_all;T_test];
load testing_data_level3.mat;
X_Test_all = [X_Test_all;X_test];
T_Test_all = [T_Test_all;T_test];
load testing_data_level4.mat;
X_Test_all = [X_Test_all;X_test];
T_Test_all = [T_Test_all;T_test];
load testing_data_level5.mat;
X_Test_all = [X_Test_all;X_test];
T_Test_all = [T_Test_all;T_test];

X_test = X_Test_all;
T_test = T_Test_all;
save testing_data_all.mat X_test T_test;



