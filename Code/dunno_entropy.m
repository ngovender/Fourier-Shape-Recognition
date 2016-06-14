% path = 'D:\PhDWork\code\vocab_tree\Deon''s code\Vocabtree2\Vocabtree2\Viewpoint_values_all\elephant\';
% files = ls([path,'*.m']);
% 
% for j = 1:size(files)
%      filename1 = files(j,:);  
%      filename1= strcat(path,filename1)
%      x(j) = load(filename1)
%end

% verification
X = [0.4 0.85 0.9 1.0 1.0 1.0]
Y = [0.4 0.45 0.6 0.63 0.7 0.82]
figure
subplot(2,1,1)

plot(X,'-o');
hold on;
ylabel('Confidence');
%title('Verification results after each view for Curry Object 1')
xlabel('Curry Object 1');
plot(Y,'--rs')
set(gca,'XTick',1:6)
h = legend('Our Method','Random');
set (h, 'Location', 'SouthEast');

%recognition

X1 = [0.4 0.61 0.7 0.82 0.98 1.0 1.0]
Y1 = [0.4 0.42 0.53 0.59 0.68 0.71 0.82]
subplot(2,1,2)
hold on;
plot(X1,'-o');
plot(Y1,'--rs')

ylabel('Confidence');
%title('Recognition results after each view for Curry Object 1')
xlabel('Curry Object 1');
h = legend('Our Method','Random');
set (h, 'Location', 'SouthEast');

% x = [
% 4.910678e+003;
% 5.199870e+003;
% 5.465562e+003;
% 5.517032e+003;
% 3.602547e+002;
% 3.227588e+002;
% 3.902399e+002;
% 2.802776e+002;
% 2.677081e+002;
% 2.317346e+002;
% 3.199566e+002;
% 3.037541e+002;
% 2.709958e+002;
% 3.363723e+002;
% 3.055624e+002;
% 2.978111e+002;
% 3.398164e+002;
% 4.603419e+002;
% 4.321706e+002;
% 
% ]
% disp(j);
% %x(19) = 180;
% 
% mean = sum(x) / length(x);
% polar([0:20:340]' / 180 * pi, x(:) - min(x));