%% Filippo Gandolfi
% Robotics Engineering - II year - 2019/2020
% Machine Learning - Assignment 2

test1 = load('turkish-se-SP500vsMSCI.csv');
test2 = load('mtcarsdata4features.mat');
test2 = test2.mtcarsdata4features;

% Point 1 - OK
[y] =  linear_regression(test1);

% Point 2 
x = test1(:,1); % first column
[n, d] = size(x);
t = test1(:,2); % second column
[m, p] = size(t);
perc=10;
colpr=floor(n/perc);
test10pr=zeros(colpr,perc);
for j=1:perc
%     for i=(floor(n/10)*(j-1)):(floor(n/10)*j)
    for i=(colpr*(j-1)+1:colpr*j)
        xlpr=sum(x(i));
        tlpr=sum(t(i));
        wpr = (xlpr*tlpr)/xlpr^2; % w is the slope of the funciton, This is the least squares
% solution to the linear regression problem.
        ypr = wpr*x; % y is the linear regression line
    end
%     plot(x,ypr)
%     hold on
end


% Point 3

mpg = test2(:,1);
weight = test2(:,2);
mpgweight = [mpg weight];

[y2] =  linear_regression_intercept(mpgweight);







%% how to do...
%
%
% pagina 40, calcolare w1 simile a prima ma con valori diversi 
% y = w0 + xw1
% plotto tutti i puntini
% 
% pagina 53, 4 colonne diverse, una è il target. X grande tutte le colonne
% esclusa X grande, pinv di x per t
%
% TASK 3: objective function pag 20. t target y è lo slope di prima * x
% slope * x + w1. 
% multidimensional pag. 50