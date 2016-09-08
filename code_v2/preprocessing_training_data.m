function [ X_train,T_train ] = preprocessing_training_data(notation_path,notations,level )
%Transform from image data to matrix
features = zeros(1,10000);
upper_bound = 14; % default level 1
switch level
    case 1
        upper_bound = 14;
    case 2
        upper_bound = 16;
    case 3
        upper_bound = 17;
    case 4
        upper_bound = 20;
    case 5
        upper_bound = 22;
    otherwise
        upper_bound = 14;
end
T = zeros(515*upper_bound,1);
for i=1:upper_bound
    for j=1:515
        im = imread(strcat(notation_path,notations{i},'/sample_',num2str(j),'.png'));
        if i == 17 | i == 22 % exception for fraction & sqrt
             im2 = imresize(im,[50,100]);
             addd = zeros(25,100);
             im = [addd;im2;addd];
        end
        
        f = reshape(im,[1,10000]);
        features = [features;f];
    end
    awal = (i-1)*515+1;
    akhir = awal + 515;
    T(awal:akhir) = i;
end
X_train = features(2:end,:);
T_train = T(2:end,:);
end

