function [w4,y4]=multi_regression(test)
    X_big = test(:,2:4);
    target = test(:,1);
    w4 = pinv(X_big)*target;
    y4 = X_big*w4;
end