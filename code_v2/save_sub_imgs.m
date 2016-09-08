function save_sub_img(subimgs,level,id)
    level_dir = strcat('level_',num2str(level));
    n = length(subimgs);
    path_log = strcat(num2str(level_dir),'/',num2str(id),'/');
    if ~exist(path_log,'dir')
         mkdir(path_log);
    end
    for s = 1:n
        im = subimgs{s};
        %im1 = imresize(im,[100,100]);
        fname = strcat(path_log,num2str(s),'.png');
        imwrite(im,fname);
        %figure; imshow(im);
        
    end
end