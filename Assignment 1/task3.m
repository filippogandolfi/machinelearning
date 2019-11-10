function [final_prob3,e_rate3] = task3(trset3,max_init_val,teset,target)
    [n, d] = size(trset3);
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
            if trset3(i,j) < 1
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

    e_rate3 = 0;    
    a = 1;
    n3 = max_init_val; % is the number of values of attribute x
    
    %% First task: Training
    % I need the probability of each event
    for i=1:d
        max_val(i) = max(trset3(:,i)); % max value present in each column
        for j = 1:max_val 
            prob_classes(j,i) = sum(trset3(:,i)==j); % how many times the value appear 
            prob_val(j,i) = prob_classes(j,i)/n; % pounded by the number of rows
        end
    end
    
    num_classes = max_val(d); % Number of classes present
    
    prob_tot3=zeros(max(max_val),d-1,num_classes);
    for i=1:(d-1)
        for j=1:n
            for p=1:max_val(i)
                for k=1:num_classes
                    if (trset3(j,i)==p && trset3(j,d)==k)
                        prob_tot3(p,i,k) = prob_tot3(p,i,k)+1; % create N (num_classes) matrices with them probability for every value
                    end
                end
            end
        end
    end
    
    
    for i=1:d-1
        for j=1:max(max_val)
            for k=1:num_classes
                prob_tot3(j,i,k) = (prob_tot3(j,i,k)+a)/(prob_classes(k,d)+(a*n3(j))); % here the difference with the task 1 and 2
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
              prob_situa (i,k) = prob_situa (i,k) * prob_tot3(val,i,k); % prob for each row
        end
          final_prob3 = prob_situa * prob_classes(k,d); % applying the Bayes formula
      end
  end
  
  % normalize
  norm_prob = zeros(m,num_classes);
  for i=1:m
      for j=1:num_classes
          norm_prob(i,j) = final_prob3(i,j) / sum(final_prob3(i,:));
      end
  end
  
  % Is the result of the test consistent with the known results?
  prediction = zeros(m);
      for i=1:m
          [~,prediction(i)] = max(norm_prob(i,:)); %take the index of the max value
              
          if (prediction(i) == target(i))  
          else
            e_rate3 = (e_rate3+1);
          end % error rate
      end
      e_rate3 = (e_rate3/m)*100;
  end                  
    
%     
%     for i=1:d-1
%         for j=1:max(max_val)
%             for k=1:num_classes
%                 prob_task3(j,i,k) = (prob_task3(j,i,k)+a)/(prob_classes(k,d)+(a*n3(j))); % pounded by the number of classes
%             end
%         end
%     end      
%   % end of the training 
% end