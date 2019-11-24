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
training_set = [data]; % n x (d+1) matrix
training_set_labels = [labels]; % divided for the task 3
[test_set, test_label] = loadMNIST(1); % m x d matrix 

n = 1; % use for take only piece of the dataset and not the whole (computation issue)
test_set = test_set(1:end/n,1:end);
test_label = test_label(1:end/n,1:end);

% create matrix for speed up the computation
err_k=zeros(5,1); % error rate
accuracy_k=zeros(5,1); % accuracy (1-error)
all = zeros(5,10); % overall for pass it to Excel

kappa = [1 2 3 4 5]; % array for k
d = [1 2 3 4 5 6 7 8 9 10]; % array for the digits
for j = 1:10
    for i=1:5
        k = kappa(i);
        % main function, bring all to the knn function
        [pred,erate,B] = knn([training_set, training_set_labels==d(j)], test_set, k, test_label==d(j));
        err_k(i) = erate;
        accuracy_k(i) = 1-erate;
    end
    all(:,j)=accuracy_k;
end

% I remove the graph of matlab because the computation was too slow and the
% figure takes also time. I decide to take the matrix all and perform
% graphs on Excel.


    


