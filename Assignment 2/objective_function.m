function [j] = objective_function(test,w,intercept)
% Re-run 1,3 and 4 from task 2 using only 10% (or less) of the data.
% Compute the objective (mean square error) on the training data
% Compute the objective of the same models on the remaining 90% (or more) of the data.
% Repeat for different training-test random splits, for instance 10 times. Suggestion: write code for this job, don't waste time repeating manually. Matlab scripts are done for that.
% Show the results (using a graph or a table of values) and comment.
    [n,d] = size (test);
    if d<=2
        x = test(:,1); % first column
        t = test(:,2); % second column
    else
        x = test(:,2:4);
        t = test(:,1);
        y = x*w;
    end
    
    if intercept==3
        j = immse(t, y);
    else
        for i=1:n
            lamda = 0;
            square = ((t(i)-intercept-w*(x(i)))^2);
            lamda = lamda+square;
        end
        j = (1/n)*(lamda);
    end
    