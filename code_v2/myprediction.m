function y = myprediction( Phi,rmodel,mode)
    y = 0;
    if strcmp( mode,'SVM')
        y = libsvmpredict([0],Phi, rmodel); % predict
    else
        if strcmp( mode,'NN')
            a_1 = InnerProduct_ForProp(Phi', rmodel{1}, rmodel{2});
            z_1 = Sigmoid_ForProp(a_1);
            a_2 = InnerProduct_ForProp(z_1, rmodel{3}, rmodel{4});
            y_t = Softmax_ForProp(a_2);
            y = find(y_t==max(y_t));
        end
    end
end