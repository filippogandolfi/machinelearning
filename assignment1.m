%% Filippo Gandolfi

% Upload data
% !!trovare forma migliore per applicarlo sempre!!
load('weatherdata.mat');
weather_data = table2array(weatherdata);
[n, d] = size(weather_data);

% Split into training and test
index = randperm(n);
trset = weather_data(index(1:10), :);
teset = weather_data(index(11:end), 1:(d-1));
target = weather_data(index(11:end),d);

% Calling the Naive Bayes classifier
[result, e_rate] = naiveBayes(trset, teset, target);
