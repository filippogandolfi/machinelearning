function [subset] = perc_dataset(test,perc)
    [n1,d1] = size (test);
    rowpr=floor(n1/perc); %rows created from the percentage
    %algo [...]
    for j=1:perc
            allIndices = randperm(n1);
            subset = test(allIndices(1:rowpr),:);
    end