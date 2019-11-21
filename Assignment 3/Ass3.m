%% Filippo Gandolfi 
% 4112879 - Robotics Engineering - 2019/2020
% Assignment 3
% Task
%         Task 1: Obtain a data set
%         Task 2: Build a kNN classifier
%         Task 3: Test the kNN classifiers
%
%% Task 2
%X = loadMNIST(0,[1,2,3]);
[data, labels] = loadMNIST(0);
% dataset = load('loadMNIST');
training_set = [data, labels]; % n x (d+1) matrix
[test_set, test_labels] = loadMNIST(1); % m x d matrix 

n = 1;
test_set = test_set(1:end/n,1:end);
training_set = [data, labels];
test_labels = test_labels(1:end/n,1:end);

% k = ; % around integer for kNN
%
% 
% if k>0 && k<=ntr
%     disp ('correct k');
% else
%     disp('wrong k');
% end
% 
% %% Classify the training set
% %call the knn function


    


