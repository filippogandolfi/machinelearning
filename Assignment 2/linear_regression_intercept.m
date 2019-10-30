function [y2] =  linear_regression_intercept(test)
    x2 = test(:,1); % first column
    [n2, d] = size(x2);
    t2 = test(:,2); % second column
    [m2, p] = size(t2);
    for i=1:n2
        xl2=sum(x2);
    end
    for j=1:m2
        tl2=sum(t2);
    end
    x_segn = (1/n2)*xl2;
    t_segn = (1/m2)*tl2;
    
    for i=1:n
        w2up = sum((xl-x_segn)*(tl-t_segn));
        w2down = sum((xl-x_segn)^2);
    end
       
w2 = w2up/w2down;
w0 = t_segn - w2*x_segn;
y2 = w0 + x2*w2; % y is the linear regression line
plot (x2,y2);
end