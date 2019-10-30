%% Filippo Gandolfi
% Robotics Engineering - II year - 2019/2020
% Machine Learning - Assignment 1 

% Upload data
% This works only with a pre modified file.
% It's possible to implemente a script that automatically change the file.

load('weatherdata.mat');
weather_data = table2array(weatherdata);
[n, d] = size(weather_data);

% Split into training and test 
index = randperm(n);
trset = weather_data(index(1:10), :); % dataset for training 
teset = weather_data(index(11:end), 1:(d-1)); % dataset for test

target = weather_data(index(11:end),d); %this is used for calculate the error rate
 
% For TASK 3, I create a new training set
    for i=1:d
        max_init_val(i) = max(weather_data(:,i)); % max value present in each column
    end

trset3 = [max_init_val;trset]; %add a row at the top
% testWrong = [2,2,2,2,2;2,2,2,2,2;2,2,2,2,2;2,2,2,2,2;2,2,2,2,2;2,2,2,2,2;];
% trset3 = testWrong;

% Calling the Naive Bayes classifier
[result, e_rate] = naiveBayes(trset, teset, target);

[final_prob3,e_rate3] = task3(trset3,max_init_val,teset,target);

    
    
    
    