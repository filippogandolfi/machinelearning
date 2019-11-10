function [prediction, e_rate] = naiveBayes(trset,teset,target)
    [n, d] = size(trset);
    [m, f] = size(teset);
    
    %check size of the matrices
    if d ~= (f+1)
       error('Error size');
    end
    
    %check arguments
    if nargin<2
       error('Error on arguments');
    end
    
    %check training set 
    for i=1:n
        for j = 1:d 
            if trset(i,j) < 1
               error('error value');                
            end
        end
    end
    
    %check test set
    for i = 1:m
        for j = 1:f 
            if teset(i,j) < 1
               error('error value');
            end
        end
    end  %%

    e_rate = 0;
    %% First task: Training
    % I need the probability of each event
    for i=1:d
        max_val(i) = max(trset(:,i)); % max value present in each column
        for j = 1:max_val 
            prob_classes(j,i) = sum(trset(:,i)==j); % how many times the value appear 
            prob_val(j,i) = prob_classes(j,i)/n; % pounded by the number of rows
        end
    end
    
    num_classes = max_val(d); % Number of classes present
    
    prob_tot=zeros(max(max_val),d-1,num_classes);
    for i=1:(d-1)
        for j=1:n
            for p=1:max_val(i)
                for k=1:num_classes
                    if (trset(j,i)==p && trset(j,d)==k)
                        prob_tot(p,i,k) = prob_tot(p,i,k)+1; % create N (num_classes) matrices with their probability for each value
                    end
                end
            end
        end
    end
  
    
    
    for i=1:d-1
        for j=1:max(max_val)
            for k=1:num_classes
                prob_tot(j,i,k) = prob_tot(j,i,k)/prob_classes(k,d); % pounded by the number of classes
            end
        end
    end
  % end of the training 
  
  % Classify the test set 
  prob_situa = ones(m,num_classes);
  for k=1:num_classes
      for i=1:m
        for j=1:f
              val = teset(j,i); % used for findind the values in the test and match with the one trained
              prob_situa (i,k) = prob_situa (i,k) * prob_tot(val,i,k); % prob for each row
        end
          final_prob = prob_situa * prob_classes(k,d); % applying the Bayes formula (called in the report Scenario)
      end
  end
  
  % normalize
  norm_prob = zeros(m,num_classes);
  for i=1:m
      for j=1:num_classes
          norm_prob(i,j) = final_prob(i,j) / sum(final_prob(i,:));
      end
  end
  
  % Is the result of the test consistent with the known results?
  prediction = zeros(m);
      for i=1:m
          [~,prediction(i)] = max(norm_prob(i,:)); %take the index of the max value
              
          if (prediction(i) == target(i))  
          else
            e_rate = (e_rate+1);
          end % error rate
      end
      e_rate = (e_rate/m)*100;
  end                  
          
%esempio lezione
%
%
%
%
%