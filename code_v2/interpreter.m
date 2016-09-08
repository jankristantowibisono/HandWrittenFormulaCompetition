function [ subs5 subs4] = interpreter( formula )
    [r c] = size(formula); 
    cleanR = 0.01*r;
    cleanC = 0.01*c;
    formula(1:cleanR,:) = 0;formula(r-4*cleanR:r,:) = 0;
    formula(:,1:cleanC) = 0;formula(:,c-cleanC:c) = 0;
    subImgs1 = cut4cols(formula); % cut vertically 1
    for i=1:length(subImgs1)
        subImgs2{i} = cut4rows(subImgs1{i}); % cut horizontally 1
        n1 = length(subImgs2{i});
        for j=1:n1
            %imwrite(subImgs2{i}{j},strcat(num2str(i),num2str(j),'.png'));
            %figure; imshow(subImgs2{i}{j});
            subImgs3{i}{j} = cut4cols(subImgs2{i}{j}); % cut vertically 2
            n2 = length(subImgs3{i}{j});
            for k=1:n2
                %figure; imshow(subImgs3{i}{j}{k});
                subImgs4{i}{j}{k} = cut4rows(subImgs3{i}{j}{k}); % cut horizontally 2
            end
        end
        %imwrite(subImgs1{i},strcat(num2str(i),'.png'));
        %figure; imshow(subImgs1{i});
    end
    subs1 = transform_format(subImgs4);
    for x=1:length(subs1)
        %figure; imshow(subs1{x});
        %imwrite(subs1{x},strcat(num2str(x),'.png'));
    end
    %te = cut2cll(subs1{4});
     for i=1:length(subs1)
         subs2{i} = cut2cll(subs1{i}); % CCL (component connected labelling)
         %figure; imshow(subs2{i});
     end
    subs3 = transform_format2(subs2);
    for x=1:length(subs3)
        %imwrite(subs3{x},strcat(num2str(x),'.png'));
        %figure; imshow(subs3{x});
    end
    for i=1:length(subs3)
        subs4{i} = fit_size(subs3{i}); % cut sub image as small as possible
        
        %figure; imshow(subs4{i});
        subs5{i} = add_padding(subs4{i}); % add padding to make it square 
        %imwrite(subs5{i},strcat(num2str(i),'.png'));
        %figure; imshow(subs5{i});
        %figure; imshow(subs5{i});
    end


end


