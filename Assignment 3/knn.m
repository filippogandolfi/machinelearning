%% function knn
function [y,erate,B] = knn(training_set, test_set, k, gt)

    erate = 0;
    
    % Get dimensions
    [test_set_r, test_set_c] = size(test_set);
    [training_set_r, training_set_c] = size(training_set);
    
    %% Checks
    
    % check input
    if nargin<3
        error('error on input!')
    end

    % check dimensions
    if((training_set_c-1) ~= test_set_c)
        disp("error, wrong dimensions!");
    end
    
    % Check cardinality
    cardinality = training_set_r;
    if (k <= 0 || k > cardinality)
        disp("error, k wrong dimension!");
    end

    %% Classify the test
    labels = zeros(k, test_set_r);
    X = training_set(:,1:test_set_c);
    Y = test_set;
    % pdist2 returns the distance using the metric "euclidean"
    [~, B] = pdist2(X,Y,'euclidean',"smallest",k);
   
    for i = 1:k
        for j=1:test_set_r
                   labels (i,j) = training_set(B(i,j),end); % labels used for the mode
        end
    end

    y = zeros(1,test_set_r);
    
    for i = 1:test_set_r
         y(i) = mode(labels(:,i)); 
    end
    y = y';
    erate = (sum(y ~= gt))/test_set_r; % number of time the mode is different from the test_labels divided by test set rows
end
