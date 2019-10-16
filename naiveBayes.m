function [prob_tot, final_prob] = naiveBayes(trset,teset)
    [n, d] = size(trset);
    [m, f] = size(teset);
    
    %check size
    if d ~= (f+1)
       error('Error size');
    end
    
    %check arguments
    if nargin<2
       error('Error on arguments');
    end
    
    %check training
    for i=1:n
        for j = 1:d 
            if trset(i,j) < 1
               error('error value');                
            end
        end
    end
    
    %check test
    for i = 1:m
        for j = 1:f 
            if teset(i,j) < 1
               error('error value');
            end
        end
    end
    
    %Training
    %probability of each event
    for i=1:d
        max_val(i) = max(trset(:,i));
        for j = 1:max_val
            prob_classes(j,i) = sum(trset(:,i)==j);
            prob_val(j,i) = prob_classes(j,i)/n; 
        end
    end
    
    num_classes = max_val(d);
    
    prob_tot=zeros(max(max_val),d-1,num_classes);
    for i=1:(d-1)
        for j=1:n
            for p=1:max_val(i)
                for k=1:num_classes
                    if (trset(j,i)==p && trset(j,d)==k)
                        prob_tot(p,i,k) = prob_tot(p,i,k)+1;
                    end
                end
            end
        end
    end
   
    
    for i=1:d-1
        for j=1:max(max_val)
            for k=1:num_classes
                prob_tot(j,i,k) = prob_tot(j,i,k)/prob_classes(k,d);
            end
        end
    end      
  %lejosonfe del training 
  
  %Classify the test set according to the inferred rule, and return the classification obtained
  prob_situa0 = ones(m,num_classes);
  for k=1:num_classes
      for i=1:m
        for j=1:f
              val = teset(j,i);
              prob_situa0 (i,k) = prob_situa0 (i,k) * prob_tot(val,i,k);
          end
          final_prob = prob_situa0 * prob_classes(k,d);
      end
  end
      
end

%esempio lezione(
% func
% func(1)
% a = [1 2; 2 3; 4 5]
% [a a(:,1) == 2]
% sum(a(:,1)==2)
% sum(a(:,1)==2)/size(a,1)
% probability of find 2 in this column
% for val=1:max(a(:;1))
% disp(sum(a(:,1)==val)/size(a,1))
% clca
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% esempio 2 lezione del 15/10