function [j10, j90]=task3(test,flag)
%
    [n1,d1] = size (test);
    perc=13;
    rowpr=floor(n1/100*perc);
    allIndices = randperm(n1);
    subset10 = test(allIndices(1:rowpr),:);
    if flag==1
        [x10,t10,y10,w10] =  linear_regression(subset10);
        intercept=0;
    else if flag==2
        [x10,t10,y10,w10,intercept] =  linear_regression_intercept(subset10); 
    else if flag==3
        [w10,y10]=multi_regression(subset10);
        intercept=3;
         end
         end
    end
    [j10] = objective_function(subset10,w10,intercept);
    
    %
    perc=90;
    rowpr=floor(n1/100*perc);
    allIndices = randperm(n1);
    subset90 = test(allIndices(1:rowpr),:);
    if flag==1
        [x90,t90,y90,w90] =  linear_regression(subset90);
        intercept90=0;
    else if flag==2
        [x90,t90,y90,w90,intercept90] = linear_regression_intercept(subset90);
    else if flag==3
        [w90,y90] = multi_regression(subset90);
        intercept90=0;
        end
        end
    end
    [j90] = objective_function(subset90,w10,intercept);
end