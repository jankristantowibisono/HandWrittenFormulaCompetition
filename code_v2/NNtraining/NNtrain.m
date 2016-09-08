clear all
close all
clc
load training_data_NN.mat;
%% settings
eta = 0.0001;
X_train = Phi_train;
train = size(X_train, 1);
%test = size(X_test, 1);
size_0 = size(X_train,2);
size_1 = 45;
size_2 = size(T_train,2);
MaxIter = 1000;
%% init W
W_01 = 0.1*randn(size_0,size_1);
W_12 = 0.1*randn(size_1,size_2);
b_01 = 0.1*randn(size_1,1);
b_12 = 0.1*randn(size_2,1);
Y_train = zeros(train, size_2);
%Y_test = zeros(test, size_2);
%T_test = zeros(test, size_2);
acc = zeros(MaxIter, 1);
err = zeros(MaxIter, 1);

for iter = 1:MaxIter;
    disp(iter);
    dEdW_12 = 0;
    dEdb_12 = 0;
    dEdW_01 = 0;
    dEdb_01 = 0;
    
    for i = 1:train;
		%forProp
        x = X_train(i, :)';
        a_1 = InnerProduct_ForProp(x, W_01, b_01);
        z_1 = Sigmoid_ForProp(a_1);
        a_2 = InnerProduct_ForProp(z_1, W_12, b_12);
        yi = Softmax_ForProp(a_2);
        Y_train(i, :) = yi';
        %backProp
        ti = T_train(i, :)';
        [dEda_2] = Softmax_BackProp(yi, ti);
        [dEdz_1, temp1, temp2] = ...
            InnerProduct_BackProp(dEda_2, z_1, W_12, b_12);
        dEdW_12 = dEdW_12 + temp1;
        dEdb_12 = dEdb_12 + temp2;
        [dEda_1] = Sigmoid_BackProp(dEdz_1, a_1);
        [dEdz_0, temp1, temp2] = ...
            InnerProduct_BackProp(dEda_1, x, W_01, b_01);
        dEdW_01 = dEdW_01 + temp1;
        dEdb_01 = dEdb_01 + temp2;
    end
    [~, t] = max(T_train, [], 2);
    [~, y] = max(Y_train, [], 2);
	%calculate error and acc
    E_train = -sum(sum(T_train.*log(Y_train))); 
    err(iter) = E_train/train; 
    acc(iter) = length(y(t==y))/train;
    %update W
    W_01 = W_01-eta*dEdW_01;
    W_12 = W_12-eta*dEdW_12;
    b_01 = b_01-eta*dEdb_01;
    b_12 = b_12-eta*dEdb_12;
    
end

for i = 1:train;
    x = X_train(i, :)';
    a_1 = InnerProduct_ForProp(x, W_01, b_01);
    z_1 = Sigmoid_ForProp(a_1);
    a_2 = InnerProduct_ForProp(z_1, W_12, b_12);
    yi = Softmax_ForProp(a_2);
    Y_train(i, :) = yi';
end
%% plotting
figure,
plot(err(1:iter),'color','r');
xlabel('Iterations');
ylabel('Cross Error Entropy');
title({['Cross Error Entropy of Training Data '];['eta=', num2str(eta),...
    ', hidden size = ',num2str(size_1),...
    ', epoch=',int2str(MaxIter)]});
saveas(gcf,['Cross Eroor Entropy of Training Data ','eta=', num2str(eta),...
    ' hidden size = ',num2str(size_1),' epoch=',int2str(MaxIter),'.png']);
figure, 
plot(acc(1:iter),'color','b');
xlabel('Iterations');
ylabel('Accuracy');
title({['Accuracy of Training Data '];['eta=', num2str(eta),...
    ', hidden size = ',num2str(size_1),...
    ', epoch=',int2str(MaxIter)]});
saveas(gcf,['Accuracy of Training Data ','eta=', num2str(eta),...
    ' hidden size = ',num2str(size_1),' epoch=',int2str(MaxIter),'.png'])
NNmodel{1} = W_01;
NNmodel{2} = b_01;
NNmodel{3} = W_12;
NNmodel{4} = b_12;
save NNmodel.mat NNmodel;