function [y] =  linear_regression(test)
    x = test(:,1); % first column
    [n, d] = size(x);
    t = test(:,2); % second column
    [m, p] = size(t);
    for i=1:n
        xl=sum(x);
    end
    for j=1:m
        tl=sum(t);
    end
w = (xl*tl)/xl^2; % w is the slope of the funciton, This is the least squares
% solution to the linear regression problem.
y = w*x; % y is the linear regression line
figure
plot (x,y);
hold on
plot (x,t,'o')
hold off
end