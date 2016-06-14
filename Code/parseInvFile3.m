

load loadingVocab

objects{1} = (1:18); % first object
   

for i = 1:34
    objects{i+1} = (17+2+(i-1)*18):(17+2+17+(i-1)*18);
end

nodeNum = size(invFile, 2);
nodeCounts = zeros(nodeNum, length(objects));

% Gather statistics
for i=1:nodeNum
    i
    for k=1:size(invFile{i}, 1)
        for j=1:length(objects)
            [f ii] = find(invFile{i}(k, 1) == objects{j});
            
            if (~isempty(f))
                nodeCounts(i, j) = 2;%nodeCounts(i, j) + invFile{i}(k, 2);
            end
        end
    end
end

% Fudge factor
% White noise to protect against overly confident leaf nodes
nodeCounts = nodeCounts + 1 * ones(size(nodeCounts));

%return

weights = sum(nodeCounts);

for i=1:size(nodeCounts, 2)
    if (weights(i) ~= 0)
%        nodeCounts(:, i) = nodeCounts(:, i) / nodeCounts(1, i);
        nodeCounts(:, i) = nodeCounts(:, i) / weights(i);
    else
        nodeCounts(:, i) = 0;
    end
end

% x = pwd;
% cd ..
% cd ..
% inputImage
% data = DoSIFTFeatureEx_nextImage('D:\PhDWork\Datasets\occlusions\Full_Battery\segmented\','00017.bmp');
% CCCdisp(data(1));
% cd(x)
% 



%return

save ('nodeCounts','nodeCounts');

