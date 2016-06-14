function [robotData] = DoSIFTFeatureEx()
%DOSIFTFEATUREEX [robotData] = DoSIFTFeatureEx(robotData, imageDir)
%   This function takes robotData structure, loads each of the images in
%   the dataset, performs SIFT feature extraction and stores the results in
%   the structure. imageDir is the directory in which the images can be
%   found
%   This function assumes the presence of the VLFEAT library

robotData = struct('fileName',{},'f',{},'d',{},'frames',{},'descriptors',{});
%imageDir =  'D:\PhDWork\Datasets\Active Vision Database\occlusions\Full_Curry\segmented\';
imageDir =  'D:\PhDWork\Datasets\Africon_1\';
%path = 'D:\PhDWork\Datasets\occlusions\Confusion_Curry';
directory = dir(imageDir);

count = 1;
num = 1;
 files = ls([imageDir,'\*.bmp']);
for j = 1:size(files,1)
   %name = strcat(path,directory(j).name);
   %name = strcat(name,'\','segmented\');
  
   %for idx = 1:size(files)
    %disp(files(idx, :))
    %disp(idx);
    
    filename1 = files(j,:);        
    
    robotData(j).fileName  = filename1;
    fprintf(['Processing image ' robotData(num).fileName '\n']);
    % Load the image and convert to grey
    imFile = [imageDir filename1];%[ robotData(num).fileName]
    try
        im = imread(imFile);
        if(size(im, 3) > 1)
            im = rgb2gray(im);
        end
        im = single(im) / 255;
    catch
        robotData(j).f = [];
        robotData(j).d = [];
        continue;
    end

    % Perform feature extraction
    fprintf('Extracting features from image... ');
    %[robotData(num).frames, robotData(num).descriptors] = vl_sift(im, 'FirstOctave', 1, 'PeakThresh', 0.01);
    [robotData(j).frames, robotData(j).descriptors] = vl_sift(im);
    fprintf('Got %u features!\n', size(robotData(j).frames, 2));

    num = num +1;

end
%disp(sum)

   
   
