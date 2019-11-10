%% Filippo Gandolfi
% Robotics Engineering - II year - 2019/2020
% Machine Learning - Assignment 2

% loading
test1 = load('turkish-se-SP500vsMSCI.csv');
test2 = load('mtcarsdata4features.mat');
test2 = test2.mtcarsdata4features;
test2 = table2array(test2);
[n1,d1] = size (test1);
[n2,d2] = size (test2);

%% Point 1 - 100%
% algo
[x,t,y,w] =  linear_regression(test1);
% figure
figure
title('Linear regression without intercept');
plot (x,y);
hold on
plot (x,t,'o');
hold off




%% Point 2 - OK
%preparation
perc=10;
rowpr=floor(n1/100*perc); %rows created from the percentage
figure
%algo [...]
for j=1:perc
        allIndices = randperm(n1);
        subset = test1(allIndices(1:rowpr),:);
        [x,t,y,w] =  linear_regression(subset);
        %figure
        plot (x,y);
        hold on
end
hold off
% end


%% Point 3 - OK

%preparation
mpg = test2(:,1);
weight = test2(:,4);
mpgweight = [weight mpg];
%algo
[x2,t2,y2,w2] =  linear_regression_intercept(mpgweight);
%figure
figure
plot (x2,t2,'o')
hold on
plot (x2,y2);
hold on
hold off

%% Point 4  - TBD

[w4,y4]=multi_regression(test2);
T = table(test2(:,1), y4);
T.Properties.VariableNames = {'Mpg real (t)' 'Mpg estimated (y)'};
figure
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
    'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);

%% Task 3

% Point 1
for k=1:100
    j0=0;
    [j1_10, j1_90]=task3(test1,1);
    totale1_10 = j0+j1_10;
    totale1_90 = j0+j1_90;
end
ave1_10=totale1_10/100;
ave1_90=totale1_90/100;

    col_0 = {'Train set' ; 'Test set' };
    col_1 = { '10%'; '90%'};
    col_2 = { ave1_10 ; ave1_90};
    f = figure;
    data = [ col_0 col_1 col_2 ];
    colNames = {'Dataset' , 'Percentage' , 'MSE'};
    uitable(f, 'Data', data, 'ColumnName', colNames, 'Position', [5 340 260 60]);

%Point 3
for k=1:100
    j0=0;
    [j2_10, j2_90]=task3(mpgweight,2);
    totale2_10 = j0+j2_10;
    totale2_90 = j0+j2_90;
end
ave2_10=totale2_10/100;
ave2_90=totale2_90/100;

    col_0 = {'Train set' ; 'Test set' };
    col_1 = { '10%'; '90%'};
    col_2 = { ave2_10 ; ave2_90};
    f = figure;
    data = [ col_0 col_1 col_2 ];
    colNames = {'Dataset' , 'Percentage' , 'MSE'};
    uitable(f, 'Data', data, 'ColumnName', colNames, 'Position', [5 340 260 60]);


%Point 4
for k=1:100
    j0=0;
    [j3_10, j3_90]=task3(test2,3);
    totale3_10 = j0+j3_10;
    totale3_90 = j0+j3_90;
end
ave3_10=totale3_10/100;
ave3_90=totale3_90/100;

    col_0 = {'Train set' ; 'Test set' };
    col_1 = { '10%'; '90%'};
    col_2 = { ave3_10 ; ave3_90};
    f = figure;
    data = [ col_0 col_1 col_2 ];
    colNames = {'Dataset' , 'Percentage' , 'MSE'};
    uitable(f, 'Data', data, 'ColumnName', colNames, 'Position', [5 340 260 60]);


%print table


%

%% how to do...

% TASK 3: objective function pag 20. t target y è lo slope di prima * x
% slope * x + w1. 
% multidimensional pag. 50