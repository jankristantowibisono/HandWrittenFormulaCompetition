function [ str ] = to_formula( sub_imgs,subfits,rmodel,notations2,mode )
    str = strcat('','');
    n = length(sub_imgs);
    size_sum = 0;
    counter = 0;
    % take size symbols average (might be needed)
    for i=1:n
        if(~isempty(sub_imgs{i}))
            [r c] = size(subfits{i});
            size_sum = size_sum + r*c;
            counter = counter +1;
        end
    end
    average_size = size_sum/counter;
    s = '';
    for i=1:n
        im1 = sub_imgs{i};
        if(~isempty(im1))
        
        im2 = imresize(im1,[100,100]); % resize same with training data
        %figure; imshow(im2);    
        %imwrite(im2,strcat(num2str(i),'.png'));
        X_testing = reshape(im2,[1 10000]);
        Phi_testing = generateNewFeatures(X_testing,100,100); %hog feature
        %t = libsvmpredict([0],Phi_testing, rmodel); % predict
        t = myprediction( Phi_testing,rmodel,mode);
        ss = notations2{t};
        if i>1
            % filter the prediction result
            ss = validate_symbol(notations2{t},s,subfits{i},subfits{i-1},average_size);
        end
        s = ss;
        str = strcat(str,ss);
        end
    end
    % interpret & exceptions
    str = validator_formula(str);
end

