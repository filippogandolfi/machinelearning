function [x,t,y,w] =  linear_regression(test)
    x = test(:,1); % first column
    t = test(:,2); % second column
    num=sum(x.*t);
    den=sum(x.^2);
    w = num/den; % w is the slope of the funciton, This is the least squares
    % solution to the linear regression problem.
    y = w*x; % y is the linear regression line
end